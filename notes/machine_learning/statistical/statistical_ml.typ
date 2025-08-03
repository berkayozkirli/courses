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
Machine learning is about building algorithms which allow a computer to learn specific tasks from training examples. Not only memorizing, but generalizing to unseen instances is learning. Computer should learn general a rule that can solve a given task.

Deductive reasoning is the process of reasoning from one or more general statements to reach a logically certain conclusion.

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

Any succesful algorithm has an inherent inductive bias.

== kNN Algorithm
*Data* Take a set of training points and their labels $(X_i, Y_i)_(i=1,...,n)$, the machine learning algorithm will use these to generate a classfication rule $f: cal(X) arrow {0,1}$. A set of test points independent from the training set will be used to evaluate the performance of the algorithm.

$f_("alg")$ is the constructed function by the algorithm, a training error is computed from the predicted labels and the true labels of the training set. $hat(Y)_i := f_("alg")(X_i)$ is the predicted labels and 
$ cal(l)(X_i,Y_i,hat(Y)_i):= cases(0 "if " hat(Y)_i = Y_i, 1 "otherwise") $
is called the pointwise 0-1 loss.

To get the training error we sum over all training points and take the average 
$ R_("train")(f_"alg") = 1/n sum^n_(i=1) cal(l)(X_i,Y_i,f_("alg")(X_i)) $

Similarly we can calculate the test error on a set of test points $(X_i, Y_i)_(i=1,...,m)$
$ R_("test")(f_"alg") = 1/m sum^m_(i=1) cal(l)(X_i,Y_i,f_("alg")(X_i)) $

The crucial measure of success is the performance of the classifier on an independent test set.

kNN algorithm takes $k$ closest points in the training set, the majority class is assigned to the test point.

*Given* Training points $(X_i, Y_i)_(i=1,...,n) subset cal(X) times {0,1}$ and a distance function $d: cal(X) times cal(X) arrow RR$.

*Goal* Construct a classifier $f: cal(X) arrow {0,1}$
- Given a test point $X' in cal(X)$, find the $k$ closest points in the training set by computing all distances $d(X', X_i)$, $"kNN"(X') = X_(i_1), ..., X_(i_k)$.
- Assign the majority label $Y'$ among the corresponding labels 
$ Y' = cases(0 "if " sum_(j=1)^k Y_i_j lt.eq k/2, 1 "otherwise") $

The classifier doesn't require a training phase, the result depends on the parameter $k$ and the distance function $d$. Small $k$ leads to underfitting, large $k$ leads to overfitting. It turns out $k$ should be roughly of order $log(n) "as" n arrow infinity$.

The performance of kNN rules can only be good is the distance function encodes the relevant information.

What is the inductive bias of kNN? Input points that are close to each other should have the same label.

kNN can be applied to regression as well, the predicted value is the average of the $k$ closest points. Algorithms based on kNN can be used for many other tasks such as density estimation, clustering, outlier detection, etc.

== Standard Setup for ML
- Input space $cal(X)$, output space $cal(Y)$
  - The spaces $cal(X)$ and $cal(Y)$ can have some mathematical structure, e.g. vector space, topology, metric.
  - We assume that each space endowed with a $sigma$-algebra, to be able to define probability measures on them.
- Probability distribution $P$ on the product space $cal(X) times cal(Y)$
  - no assumptions on the form of the probability distribution.
  - both input variables and output variables are random quantities.
- A classifier şs simply a function $f: cal(X) arrow cal(Y)$
  - If the output space is discrete the task is called classification, if the output space is continuous the task is called regression.
- A loss function is a function $cal(l): cal(X) times cal(Y) arrow RR$ 
  - The choice of loss function influences the inductive bias.
  - In some application loss can depend on the input variable as well.
  - It is important that the loss depends on the order of $y$ and $y'$
- True risk (true expected loss) of a classifier $f: cal(X) arrow cal(Y)$ with respect to the loss function 