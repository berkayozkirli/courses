#let title = [
  Probability Theory and Stochastic Processes
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
= Probability Theory
== Sample Space, Events and Probability
The language of probability theory features familiar mathematical objects 
such as points, sets and functions,which receive a particular interpretation: 
points are outcomes (of an experiment), sets are events, functions are random numbers.

If $A$ and $B$ are subsets of some set $Omega$, $A union B$ denotes their union and $A inter B$ denotes their intersection. $A + B$ is the sum of the subsets and it implies $A$ and $B$ are disjoint. $A - B$ is used only if $B subset.eq A$.

Indicator function of the subset $A subset.eq Omega$ is the function $1_A:Omega arrow {0,1}$ defined by

$ 1_A(omega) = cases(
  1 "if" omega in A,
  0 "if" omega in.not A,
) $

Each experiment results in an outcome. The collection of all possible outcomes $omega$ is called the sample space $Omega$. Any subset $A$ of the sample space $Omega$ will be regarded for the time being as a representation of some event.

If $omega in A$ then $omega$ realizes $A$. Two events $A$ and $B$ are incompatible when $A inter B = emptyset$.

Sets $A_1, A_2, ...$ form a partition of $Omega$ if: 
$ sum_(k=0)^infinity A_k = Omega $
The sum notation implies disjointness, thus sets $A_1, A_2, ...$ are mutually exclusive and exhaustive. They are exhaustive in the sense that any outcome $omega$ realizes at least one among them. They are mutually exclusive in the sense that any two distinct events among them
are incompatible. Therefore, any $omega$ realizes one and only one of the events $A_n (n gt.eq 1)$.

If $B subset.eq A$ event $B$ is said to imply event $A$, since $omega$ realizes $A$ when it realizes $B$.

Probability theory assigns to each event a number, the probability of the said event. The collection $F$ of events to which a probability is assigned is not always identical to the collection of all subsets of $Omega$. The requirement on $F$ is that it should be a $bold(sigma-"field")$.

*Definition* Let $F$ be a collection of subsets of $Omega$, such that
+ $Omega$ is in $F$,
+ if $A$ belongs to $F$, then so does its complement $overline(A)$, 
+ if $A_1, A_2,...$ belong to $F$, then so does their union $union_(k=1)^(infinity) A_k$.

One then calls $F$ a $bold(sigma-"field")$ on $Omega$.

Note that the impossible event $emptyset$, being the complement of the certain event $Omega$, is
in $F$. Note also that if $A_1, A_2,...$ belong to $F$, then so does their intersection $inter_(k=1)^(infinity) A_k$.

*Definition* A probability on $(Omega, F)$ is a mapping $P: F arrow RR$ such that
+ $0 lt.eq P(A) lt.eq 1 "for all" A in F$,
+ $P(Omega)=1$,
+ $P(sum_(k=1)^infinity A_k) = sum_(k=1)^infinity P(A_k)$ for all sequences ${A_k}_(k gt.eq 1)$ of pairwise disjoint events in $F$

Property 3 is called $sigma-"additivity"$. The triple (Omega, F, P) is called a *probability space*.

*Definition* A set $N subset Omega$ is called P-negligable if it is contained in an event $A in F$ of probability $P(A) = 0$

== Independence and Conditioning
*Definition* Two events $A$ dn $B$ are called *independent* if and only if $ P(A inter B)=P(A)P(B) $.

*Definition* The conditional probability of $A$ given $B$ is the number $ P(A|B):= P(A inter B)/P(B) $ defined when $P(B) gt 0$.

*Theorem* With $P(A) gt 0$ we have the Bayes rule of retrodiction: $ P(B|A) = (P(A|B)P(B))/P(A)$

*Proof* $P(A inter B) = P(A|B)P(B) = P(B|A)P(A)$

*Theorem* Let $B_1, B_2, ...$ be events forming a partition of $Omega$. Then for any event $A$, we have the Bayes rule of total causes: $ P(A) = sum_(i=1)^infinity P(A|B_i)P(B_i) $

*Proof* $ A = A inter Omega = A inter (sum_(i=1)^infinity B_i) = sum_(i=1)^infinity A inter B_i $ Therefore by $sigma$-additivity, $ P(A) = P(sum_(i=1)^infinity A inter B_i) = sum_(i=1)^infinity P(A inter B_i) = sum_(i=1)^infinity P(A|B_i)P(B_i)$

*Theorem* For any sequence of events $A_1, ...,A_n$ we have the Bayes sequential formula: $ P(inter_(i=1)^(k)A_i) = \ P(A_1)P(A_2|A_1)P(A_3|A_1 inter A_2) ... P(A_k| inter_(i=1)^(k-1)A_i) $

*Proof* By induction first observe for $k=2$ this is simply true, suppose its true for k,
$ P(inter_(i=1)^(k+1) A_i) = P((inter_(i=1)^k A_i) inter A_(k+1)) =\ P(A_(k+1)|(inter_(i=1)^k A_i))P(inter_(i=1)^k A_i) $ By replacing $P(inter_(i=1)^k A_i)$ with the assumed equality we are left with assumed equality with argument $k+1$. 

*Definition* Let $A, B, C$ be events where $P(C) gt 0$. $A, B$ are conditionally indepenedent given $C$ if $ P(A inter B | C) = P(A|C) P(B|C) $

== Discrete Random Variables
=== Probability Distributions and Expectations
*Definition* Let $E$ be a countable set. A function $X: Omega arrow E$ such that for all $x in E$ $ {omega; X(omega) = x} in F $ is called a discrete random variable.

Calling an integer-valued random variable $X$ a random number is fine as long as one is aware that it is not the function $X$ that is random but the outcome $omega$. This makes the number $X(omega)$ random.

Let $E$ and $F$ be countable sets. Let $X$ be a random variable with values in $E$, and let $f: E arrow F$ be a function. Then $Y := f(X)$ is a random variable. 

Let $E_1$ and $E_2$ be countable sets. Let $X_1$ and $X_2$ be random variable with values in $E_1$ and $E_2$ respectively. Then $Y := (X_1, X_2)$ is a random variable in $E = E_1 times E_2$.

*Definition* Let $X$ be a discrete random variable taking its values in $E$. Its probability distribution function is the function $pi: E arrow [0,1]$, where $ pi (x) := P(X=x)(x in E). $