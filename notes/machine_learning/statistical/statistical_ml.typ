#let title = [
  Statistical ML
]
#set page(
  paper: "us-letter",
  numbering: "1",
  columns: 2,
)
#set text(
  font: "New Computer Modern",
  size: 10pt
)
#set par(justify: true)
#place(
  top + center,
  float: true,
  scope: "parent",
  clearance: 2em,
)[
  #align(center, text(17pt)[
    *#title*
  ])
]
#set heading(numbering: "1.")
#set math.mat(delim: "[")
#set math.vec(delim: "[")

= Introduction
Machine learning is about building algorithms which allow a computer to learn specific tasks from training examples. Not only memorizing, but generalizing to unseen instances is learning. Computer should general a rule that can solve a given task.

Deductive reasonnig is the process of reasoning from one or more general statements to reach a logically certain conclusion.

Inductive reasoning constructs or evaluates general propositions that are derived from specific examples. Conclusions can always be wrong.

Machine learning aims to automate inductive inference.

We need assumptions on the distribution of the data, why else choose some function that fits the data over another without prior knowledge?

To be able to learn 
- input and output need to be related
- similar inputs shuld lead to similar outputs
- there is a "simple" relationship to generate the output from the inputs.

We need to have an idea of what we are looking for: inductive bias.

*example* Lets say we have a $cal(X) = {0.01, 0.02, ...,1}$ and $cal(Y) = {0,1}$. Given training examples $(X_i, Y_i)_(i=1,...,n) subset cal(X) times cal(Y)$ we need to learn a function $f: cal(X) arrow cal(Y)$ based on the examples.

- No inductive bias, every function $f in cal(F)$ can be the correct one. We want to find a function out of $cal(F) := cal(Y)^cal(X)$, this function space contains $2^100$ functions. If we have data points with true labels, the function space that satisfy these points is a subset of $cal(F)$. How to predict a novel data point? Without an inductive bias there is no way of deciding how. Even if we have many labeled points without an assumption we can make no induction.

- Strong inductive bias, assume we know the function is one of the two functions, either always one or always zero. $cal(F) = {bold(0), bold(1)}$. After observing a single labeled data point we can induce the function. 

Model selection is picking out a suitable function space for the problem at hand. Overfitting models fits the training data extremely well, but models the noise as well. Thus predictions made on unseen data is poor. Underfitting models are too simplistic but the resulting functions are stable.

Any succesful algorithm has an inherent inductive bias 