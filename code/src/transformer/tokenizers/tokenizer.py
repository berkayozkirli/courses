# Base class for tokenizers.
class Tokenizer:
    def __init__(self):
        self.vocab = None

    def encode(self, text):
        """Convert text to a list of token IDs."""
        raise NotImplementedError("Subclasses should implement this method.")

    def decode(self, token_ids):
        """Convert a list of token IDs back to text."""
        raise NotImplementedError("Subclasses should implement this method.")

    def tokenize(self, text):
        """Create a dictionary from the given corpus."""
        raise NotImplementedError("Subclasses should implement this method.")