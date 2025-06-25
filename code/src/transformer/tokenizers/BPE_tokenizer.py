from .tokenizer import Tokenizer
from typing import List, Tuple
import json
import ast
import os

def init_vocab():
    return {i: bytes([i]) for i in range(256)}

def generate_byte_list(corpus: str) -> List[int]:
    """
    Generate a list of bytes from 0 to 255.
    """
    byte_list = []
    for char in corpus:
        for byte in char.encode('utf-8'):
            byte_list.append(byte)
    return byte_list

def merge_pairs(byte_list: List[int], pair: Tuple[int, int], token: int) -> List[int]:
    """
    Merge all occurrences of a pair of bytes in the byte list with a new token.
    """
    index = 0
    while index < len(byte_list) - 1:
        if (byte_list[index], byte_list[index + 1]) == pair:
            byte_list[index] = token
            del byte_list[index + 1]
        index += 1

def all_pairs(byte_list: List[int]) -> List[Tuple[int, int]]:
        # Get all possible pairs.
        return list(zip(byte_list[:-1], byte_list[1:]))

def most_frequent_pair(byte_list: List[int]) -> Tuple[int, int]:
        # Create pairs of consecutive bytes.
        pair_counts = {}
        for pair in zip(byte_list[:-1], byte_list[1:]): # Turns out this is how we get pairs in pythonic way (thanks karpathy)
            pair_counts[pair] = pair_counts.get(pair, 0) + 1
        # Most frequent pair will be given a new token.
        max_pair = max(pair_counts, key=pair_counts.get)
        return max_pair

class BPE_Tokenizer(Tokenizer):
    def __init__(self):
        super().__init__()
        self.vocab = init_vocab()
        self.merges = {}

    def train(self, corpus: str, num_merges: int):
        """
            Train the BPE tokenizer on the given corpus.
            Corpus should be a list of strings.
        """
        # Turn the corpus into a list of byte values.
        byte_list = generate_byte_list(corpus)
        # Merge until we reach the desired number of merges.
        for _ in range(num_merges):
            max_pair = most_frequent_pair(byte_list)
            new_token = len(self.vocab)
            self.merges[max_pair] = new_token
            self.vocab[new_token] = self.vocab[max_pair[0]] + self.vocab[max_pair[1]]
            # Replace all occurrences of the most frequent pair with the new token in place.
            print(f"Merging pair {max_pair} into token {new_token}.")
            merge_pairs(byte_list, max_pair, new_token)
        # Save files in the same directory as this tokenizer file
        dir_path = os.path.dirname(os.path.abspath(__file__))
        vocab_path = os.path.join(dir_path, "byte_pair_vocab.json")
        merges_path = os.path.join(dir_path, "byte_pair_merges.json")
        with open(vocab_path, 'w', encoding='utf-8') as f:
            json.dump({k: v.decode('latin1') for k, v in self.vocab.items()}, f)
        with open(merges_path, 'w', encoding='utf-8') as f:
            json.dump({str(k): v for k, v in self.merges.items()}, f, ensure_ascii=False, indent=4)
            

    def load(self, vocab_file: str = "byte_pair_vocab.json", merges_file: str = "byte_pair_merges.json"):
        """Load the vocabulary and merges from files in the tokenizer's directory."""
        dir_path = os.path.dirname(os.path.abspath(__file__))
        vocab_path = os.path.join(dir_path, vocab_file)
        merges_path = os.path.join(dir_path, merges_file)

        with open(vocab_path, 'r', encoding='utf-8') as f:
            vocab_raw = json.load(f)
            self.vocab = {int(k): v.encode('latin1') for k, v in vocab_raw.items()}

        with open(merges_path, 'r', encoding='utf-8') as f:
            merges_raw = json.load(f)
            self.merges = {ast.literal_eval(k): v for k, v in merges_raw.items()}

    def encode(self, text: str) -> List[int]:
        """Convert text to a list of token IDs using BPE."""
        byte_list = generate_byte_list(text)
        while len(byte_list) > 1:
            pairs = all_pairs(byte_list)
            pair = min(pairs, key=lambda p: self.merges.get(p, float("inf")))
            if pair not in self.merges:
                break
            token = self.merges[pair]
            merge_pairs(byte_list, pair, token)
        return byte_list

    def decode(self, token_ids: List[int]) -> str:
        """Convert a list of token IDs back to text using BPE."""
        tokens = b"".join(self.vocab[idx] for idx in token_ids)
        text = tokens.decode("utf-8", errors="replace") # Since utf-8 can throw errors (not all bytes are valid utf-8)
        return text

    def tokenize(self, text):
        """Tokenize the input text into tokens using BPE."""
        return self.encode(text)  # In this case, tokenization is the same as encoding.