from .tokenizer import Tokenizer
from typing import List

# Simply maps bytes to integers.
class ByteTokenizer(Tokenizer):
    def __init__(self):
        super().__init__()
        self.vocab = None

    def encode(self, text: str) -> List[int]:
        """Convert text to a list of token IDs."""
        return list(text.encode('utf-8'))

    def decode(self, token_ids: List[int]) -> str:
        """Convert a list of token IDs back to text."""
        return bytes(token_ids).decode('utf-8')

    def tokenize(self, text: str) -> List[int]:
        """Tokenize the input text into tokens."""
        return self.encode(text)  # In this case, tokenization is the same as encoding.