#let title = [
  Understanding Analysis
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
= Real Numbers
- Natural Numbers cannot always subtract $ NN = {1, 2, 3, ...} $
- Integers cannot always divide $ ZZ = {..., -2, -1, 0, 1, 2, ...} $
- Rational Numbers form an ordered field, but cannot always take roots $ QQ = {a/b | b in NN and a in ZZ} $

*Theorem* There is no rational number whose square equal 2.

_Proof:_  Suppose $exists x in QQ$ such that $x^2=2$, then if $x=a/b$ then there exists an isosceles right triangle with positive integer side-lengths.

#align(center, image(("figures/analysis/root2proofdrawn.png")))

If there is a triangle with integer side-lengths, then there are infinitely many such triangles with integer side-lengths. This is impossible. $qed$

- Real Numbers form an ordered field that is complete, and can take roots.

*Axiom of Completeness* Every non-empty subset of $RR$ that is bounded above has a least upper bound.

The AoC implies the existence of any root of any positive real number.

*Theorem* For every $x in RR$ with $x gt 0 and n in NN$ then $ exists! y in RR$ such that $y^n = x$.

*Archimedean Property* Given any $epsilon gt 0$, $exists n in NN$ such that $1/n lt epsilon$. This is nothing but a restatement of the fact that one can find arbitrarily large natural numbers since $1/n lt epsilon arrow.l.r n gt epsilon^(-1)$.

*Theorem* Both $QQ$ and $RR \\ QQ$ are dense in $RR$.
If $x,y in RR$ with $x lt y$, then
  - $exists q in QQ$ such that $x lt z lt y$.
  - $exists z in RR \\ QQ$ such that $x lt z lt y$.
_Proof:_ Let $x,y in RR$ with $x lt y$. Then $y-x gt 0$, and by the Archimedean Property, there exists $n in NN$ such that $1/n lt y-x$. Then, $n y - n x  gt 1$. Between $n x$ and $n y$ there must be at least one integer $k in ZZ$ such that $n x lt k lt n y$. Then, $k/n$ is a rational number between $x$ and $y$. With this let's consider the $x - sqrt(2), y - sqrt(2) in RR$, then we know that $exists m in QQ$ such that $x - sqrt(2) lt m lt y - sqrt(2)$, and thus $exists z in RR \\ QQ$ such that $x lt z lt y$.

*Definition* A real number s is the least upper bound for a set $A subset RR$ if it satisfies the following:
- $a lt.eq s,  forall a in A$
- $forall epsilon gt 0, exists a in A "with" s-epsilon lt a $
The least upper bound is also called the supremum of the set $A$, and denoted by $sup(A)$. Supremum can or cannot be an element of the set $A$.

*Theorem* Nested Internal Property states if $I_1 supset I_2 supset ...$ is nested sequence of closed intervals, then $inter^(infinity)_(n=1) I_n eq.not emptyset$

_Proof:_ For each $n in NN$ let $a_n = inf(I_n)$ and $b_n = sup(I_n)$. Consider $A = {a_n | n in NN}$. Since $A$ is bounded (by $b_n, forall n$),  $s = sup(A)$ exists. 

Since $s$ in an upper bound for $A$ then $a_n lt.eq s, forall n$. 

Since $s$ is the *least* upper bound for $A$, then $s lt.eq b_n, forall n$, then $a_n lt.eq s lt.eq b_n, forall n$ meaning $s in I_n, forall n$ $qed$

In fact, $"AoC" arrow.l.r "NIP"$

Let $A subset RR$, if $sup(A)$ exists, then there exists a sequence ${a_n}$ of points in $A$ such that $lim_(n arrow infinity) a_n = sup(A)$
