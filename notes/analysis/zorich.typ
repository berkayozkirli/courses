#let title = [
  Analysis
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
= Introduction
Bourbaki, N: Mathematics is the science that studies different structures (relations) on sets.
== Sets
Axioms of naive set theory:
- A set may consist of any distinguishable objects.
- A set is unambiguously determined by the collection of objects that comprise it.
- Any property defines the set of objects having that property.

$x$ is an element of the set $X$: $x in X$

$x$ is not an element of the set $X$: $x in.not X$ 

$A=B := forall x ((x in A) arrow.r.l (x in B))$ 

$A subset B := forall x ((x in A) arrow.r (x in B))$

If $M$ is a set, any property $P$ distinguishes in $M$ the subset: ${x in M | P(x)}$

Let $A$ and $B$ be subsets of set $M$:

- $A union B := {x in M | (x in A) or (x in B)}$

- $A inter B := {x in M | (x in A) and (x in B)}$

- $A \\ B := {x in M | (x in A) and (x in.not B)}$
de Morgan rules:
- $complement_M (A union B) = complement_M A inter complement_M B$
- $complement_M (A inter B) = complement_M A union complement_M B$

We must establish $complement_M (A union B) subset complement_M A inter complement_M B$ 
$ x in complement_M (A union B) &arrow x in.not (A union B) \ &arrow (x in.not A) or (x in.not B) \ &arrow (x in complement_M A) or (x in complement_M B) \ &arrow x in complement_M A inter complement_M B $ 

Also $complement_M A inter complement_M B subset complement_M (A union B)$ 

$ x in complement_M A inter complement_M B &arrow x in complement_M A and x in complement_M B \ &arrow x in.not A and x in.not B \ &arrow x in.not (A union B) \ &arrow x in complement_M (A union B) $

Let $X$ and $Y$ be arbitrary sets. The set $ X times Y := {(x,y) |(x in X) and (y in Y)} $
formed by the ordered pairs $(x,y)$ whose first element belongs to $X$ and whose second element belongs to $Y$, is called the direct product of the sets $X$ and $Y$.

== Functions
Let $X$ and $Y$ be certain sets. We say that there is a function defined on $X$ with values in $Y$ if, by virtue of some rule $f$, to each element $x in X$ there corresponds an element $y in Y$.

The term “function” has a variety of useful synonyms in different areas of mathematics: mapping, transformation, morphism, operator, functional.

If $A subset X$ and $f :X arrow Y$ is a function, we denote by $f|A$ or $f|_A$ the function $phi :A arrow Y$ that agrees with $f$ on $A$. More precisely, $f|A(x) := phi (x) "if" x in A$. The
function $f|A$ is called the restriction of $f$ to $A$, and the function $f :X arrow Y$ is called an extension or a continuation of $phi$ to $X$.

Defining a function involves specifying a triple $(X, Y , f)$:
- $X$ is the set being mapped, or domain of the function;
- $Y$ is the set into which the mapping goes, or a domain of arrival of the function;
- $f$ is the rule according to which a definite element $y in Y$ is assigned to each element $x in X$.

When a function $f :X arrow Y$ is called a mapping, the value $f(x) in Y$ that it assumes at the element $x in Y$ is usually called the image of $x$.

A funtion $f: X arrow Y$ is said to be 
- surjective if $f(X) = Y$
- injective if for any elements $x_1, x_2 in X$ $ (f(x_1) = f(x_2) arrow (x_1 = x_2)) $
- bijective if it is both surjective and injective

If the mapping $f :X arrow Y$ is bijective, that is, it is a one-to-one correspondence between the elements of the sets $X$ and $Y$, there naturally arises a mapping
$ f^(−1) :Y arrow X $
defined as follows: if $f (x)=y$, then $f^(−1)(y)=x$ that is, to each element $y in Y$ one assigns the element $x in X$ whose image under the mapping $f$ is $y$. By the surjectivity of $f$ there exists such an element, and by the injectivity of $f$, it is unique.
Hence the mapping $f^(−1)$ is well-defined. This mapping is called the inverse of the original mapping $f$. It is clear from the construction of $f^(-1)$ that itself is also bijective and its inverse is $f$.

== Relations
*Definition* A relation $R$ is any set of ordered pairs $(x,y)$.

Thus, a relation can be interpreted as a subset $R$ of the direct product $X times Y$. If $X subset X'$ and $Y subset Y'$, then of course $R subset X times Y subset X' times Y'$, so that a given relation can be defined as a subset of different sets.

A relation $R$ having three properties: 
- $a R a$ (reflexivity)
- $a R b arrow b R a$ (symmetry) 
- $a R b and b R c arrow a R c$ (transitivity)
is called an equivalence relation.

A relation $R$ having three properties: 
- $a R a$ (reflexivity)
- $a R b and b R a arrow b = a$ (anti-symmetry) 
- $a R b and b R c arrow a R c$ (transitivity)
is called a partial ordering.

If the condition $forall a forall b ((a R b) or (b R a))$ holds on partial oredering then the reltion is an ordering.

A relation $R$ is said to be functional if $ (x R y_1) and (x R y_2) arrow (y_1 = y_2) $ A functional relation is called a function.

The graph of a function $f: X arrow Y$ is a subset $Gamma$ of the direct product $X times Y$ whose elements have the form $(x, f(x))$.
$ Gamma := {(x,y) in X times Y | y=f(x)} $
When defined as a subset, a function and its graph are the same.

== Supplementary Material
=== Cardinality of a Set
The set $X$ is said to have a equipollent to the set $Y$ if there exists a bijective mapping of $X$ onto $Y$. It is clear that the relation $X R Y$ is an equivalence relation.

The relation of equipollence, partitions the collection of all sets into classes of mutuallt equivalent sets. Sets of an equivalence class has the same number of elements.

The class to which a set $X$ belongs is called the cardinality of $X$. If $X tilde Y$ we can write $"card" X = "card" Y$.

$ "card" X lt.eq "card" Y := exists Z subset Y ("card" X = "card" Z) $

If $X subset Y$, it is clear that $"card" X lt.eq "card" Y$. It turns out, however, that the relation $X subset Y$ does not exclude the inequality $"card" Y lt.eq "card" X$, even when X is a proper subset of Y. For example $x arrow.r.bar x / (1 - |x|)$ is a bijective mapping of the interval $-1 lt x lt 1$ of the real axis $RR$ onto the entire axis.

A set is called finite if it is not equipollent to any proper subset of itself; otherwise its called infinite. - Dedekind

Equipollence relation has the following properties:
- $"card" X lt.eq "card" Y and "card" Y lt.eq "card" Z arrow.r "card" X lt.eq "card" Z$
- $"card" X lt.eq "card" Y and "card" Y lt.eq "card" X arrow.r "card" X = "card" Y$(Schröder-Bernstein Theorem)
- $forall X forall Y ("card" X lt.eq "card" Y) or ("card" Y lt.eq "card" X)$(Cantor's Theorem)
Thus the class of cardinal numbers is linearlt ordered.

Theorem $"card" X lt "card" cal(P)(X)$

_Proof_ The assertion is obvious for the empty set, for the rest assume $X eq.not emptyset$

Since $cal(P)(X)$ contains all one-element subsets of $X$, $"card" X lt.eq "card" cal(P)(X)$

To prove the theorem it now suffices to show that $"card" X eq.not "card" cal(P)(X)$ if $X eq.not emptyset$ (by the diagonal argument)

Suppose, contrary to the assertion, that there exists a bijective mapping $f :X arrow.r cal(P)(X)$. Consider the set $A = {x in X :x in.not f (x)}$ consisting of the elements $x in X$ that do not belong to the set $f(x) in cal(P)(X)$ assigned to them by the bijection. Since $A in cal(P)(X)$, there exists $a in X$ such that $f(a)=A$. For the element $a$ the relation $a in A$ is impossible by the definition of $A$, and the relation $a in.not A$ is impossible, also by the definition of $A$. We have thus reached a contradiction with the law of excluded middle. $square$

= Real Numbers
Any description of differentiable functions that is at all complete need a precise definition of real numbers. 

== The Axiom System and Some General Properties of the Set of Real Numbers

*Definition* A set $RR$ is called the set of real numbers and its elements are real numbers if the following list of conditions holds, the axiom system of real numbers:
- Axioms for addition: An operation $ +: RR times RR arrow.r RR $ is defined, assigning to each order pair $(x,y)$ of elements $x,y$ of $RR$ a certain element $x + y in RR$, called the sum of $x$ and $y$. This operation satisfies the following conditions:
  - There exists a neutral, or identity element 0 such that $ x+0 = 0+x = x $ for every $x in RR$.
  - For every element $x in RR$ there exists an element $-x in RR$ called negative of $x$ such that $ x + (-x) = (-x) + x = 0 $
  - The operation $+$ is associative: $ x+(y+z) = (x+y)+z $ for any $x,y,z in RR$
  - The operation $+$ is commutative: $ x+y = y+x $ for any $x,y in RR$
  If an operation is defined on set $G$ satisfying the first three addition axioms we say that a group structure is defined on $G$, $G$ is a group. If the operation is called addition $G$ is an additive group, if the operation is also commutative then the group is called Abelian. Thus $RR$ is an additive Abelian group.
- Axioms for multiplication: An operation $ dot: RR times RR arrow.r RR $ is defined, assigning to each order pair $(x,y)$ of elements $x,y$ of $RR$ a certain element $x dot y in RR$, called the product of $x$ and $y$. This operation satisfies the following conditions:
  - There exists a neutral, or identity element $1in RR \\ 0$ such that $ x dot 1 = 1 dot x = x $ for every $x in RR$.
  - For every element $x in RR \\ 0$ there exists an element $x^(-1) in RR$ called inverse, or reciprocal, of $x$ such that $ x dot x^(-1) = x^(-1) dot x = 1 $
  - The operation $dot$ is associative: $ x dot (y dot z) = (x dot y) dot z $ for any $x,y,z in RR$.
  - The operation $dot$ is commutative: $ x dot y = y dot x $ for any $x,y in RR$
  The set $RR \\ 0$ is a group with respect to the operation of multiplication.
- Multiplication is distributive with respect to addition $ (x+y)z = x z + y z $ for all $x,y,z in RR$. If two operations satisfying these axioms are defined on a set $G$, $G$ is called a field.
- Order axioms: Between elements of $RR$ there is a relation $lt.eq$, for elements $x, y in RR$ one can determine wheter $x lt.eq y$ or not.
  - $forall x in RR (x lt.eq x)$
  - $(x lt.eq y) and (y lt.eq x) arrow.r (x=y)$
  - $(x lt.eq y) and (y lt.eq z) arrow.r (x lt.eq z)$
  - $forall x in RR forall y in RR (x lt.eq y) or (y lt.eq x)$
  The relation $lt.eq "on" RR$ is called inequality.
  A set on which there is a relation between pairs of elements satisfying the first three axioms of order is said to be *partially ordered*. If also the fourth axiom holds the set is *linearly ordered*. Thus the set of real numbers is linearly ordered.
- If $x, y, z in RR$ $ (x lt.eq y) arrow.r (x+z lt.eq y+z) $
- If $x,y in RR$ $ (0 lt.eq x) and (0 lt.eq y) arrow.r (0 lt.eq x dot y) $
- If $X "and" Y$ are nonempty subsets of $RR$ having the property that $x lt.eq y "for every" x in  X "and every" y in Y$ then there exists a $c in RR$ such that $x lt.eq c lt.eq y "for all" x in  X "and" y in Y$

Any set on which these axioms hold is a concrete realization or model of the real numbers.

Are these axioms consistent, does there exist a set satisfying all the conditions just listed? (Yes, set of naturals, rationals and reals can be constructed from the axioms of set theory)

Does the given system of axioms determine the mathematical object uniquely? That is, as the logicians would say, is the axiom system categorical? If a bijection $f: RR_a arrow.r RR_b$ can be established between two independent models $RR_a$ and $RR_b$ preserving the arithmatic operations and the order, these two models are equally valid. These realizations are said to be isomorphic and the mapping $f$ is called an *isomorphism*. (Real numbers are categorical)

== Some General Algebraic Properties
- Consequences of Addition Axioms:
  - There is only one 0 in the set of real numbers.
  _Proof_ If $0_1 "and" 0_2$ are both zeros in $RR$ then by definition of zero, $0_1 = 0_1 + 0_2 = 0_2 + 0_1 = 0_2$ 
  - Each element of the set of real numbers has a unique negative. 
  _Proof_ If $x_1$ and $x_2$ are both negatives of $x in RR$, then $ x_1 = x_1 + 0 = x_1 + (x + x_2) =\ (x_1 + x) + x_2 = 0 + x_2 = x_2 $
  - In $RR$ the equation $a + x = b$ has the unique solution $x = b + (-a)$ 
  _Proof_ $ (a + x = b) & arrow.l.r ((x + a) + (-a) = b + (-a)) arrow.l.r \
  & arrow.l.r (x + (a + (-a)) = b + (-a)) arrow.r.l \
  & arrow.l.r (x + 0 = b + (-a)) arrow.l.r \ 
  & arrow.l.r (x=b+(-a)) $
- Consequences of Multiplication Axioms
  - There is only one multiplicative unit in the real numbers
  - For each $x eq.not 0$ there is only one reciprocal $x^(-1)$
  - For $a in RR\\0$ the equation $a dot x = b$ has the unique solution $x=b dot a^(-1)$

