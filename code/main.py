import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import sklearn
import torch
import sympy
import mlflow
import ipykernel
import ipywidgets
import IPython
import notebook

def main():
    print("[SUCCESS] NumPy version:", np.__version__)
    print("[SUCCESS] Pandas DataFrame sample:\n", pd.DataFrame([[1, 2], [3, 4]]))
    print("[SUCCESS] Scikit-learn version:", sklearn.__version__)
    x = sympy.Symbol('x')
    expr = sympy.integrate(sympy.sin(x), x)
    print("[SUCCESS] SymPy integral of sin(x):", expr)
    print("[SUCCESS] PyTorch CUDA available:", torch.cuda.is_available())
    print("[SUCCESS] Torch tensor example:", torch.tensor([1.0, 2.0]) + 1)
    print("[SUCCESS] MLflow version:", mlflow.__version__)
    print("[SUCCESS] IPython version:", IPython.__version__)
    print("[SUCCESS] ipykernel loaded:", ipykernel.__name__)
    print("[SUCCESS] ipywidgets version:", ipywidgets.__version__)
    print("[SUCCESS] Jupyter Notebook version:", notebook.__version__)
    print("\n All core libraries imported and ran successfully!")

if __name__ == "__main__":
    main()
