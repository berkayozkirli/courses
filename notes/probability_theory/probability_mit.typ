#let title = [
  Probability
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
= Combinatorial Analysis
The basic principle of counting: if one experiment can result in $m$ possible outcomes and another one can result in $n$ possible outcomes, then there are $m n$ possible outcomes of the two experimets.

== Permutation
$ n (n-1) (n-2)...3 dot 2 dot 1 = n! $
is the number of different different permutations of $n$ objects.

*examlpe* 10 books to put on a bookshelf. Of these, 4 are mathematics books, 3 are chemistry books, 2 are history books, and 1 is a language book. All the books dealing with the same subject are together on the shelf. How many different arrangements are possible?

*solution* There are 4! 3! 2! 1! arrangements such that the mathematics books are first in line, then the chemistry books, then the history books, and then the language book. Similarly, for each possible ordering of the subjects, there are 4! 3! 2! 1! possible arrangements. Hence, as there are 4! possible orderings of the subjects, the desired answer is 4! 4! 3! 2! 1! = 6912.

*example* How many different letter arrangements can be formed from the letters PEPPER?

*solution* We first note that there are 6! permutations of the letters $P_1E_1P_2P_3E_2R$ when the 3P's and the 2E's are distinguished from one another. However, consider any one of these permutations—for instance, $P_1P_2E_1P_3E_2R$. If we now permute the P's among themselves and the E's among themselves, then the resultant arrangement would still be of the form PPEPER. That is, all 3! 2! permutations are of the form PPEPER. Hence, there are 6!/(3! 2!) = 60 possible letter arrange-
ments of the letters PEPPER.

In general, the same reasoning shows that there are $ n! / (n_1 ! n_2 ! ... n_r !) $ different permutations of $n$ objects, of which $n_1$ are alike $n_2$ are alike,...,$n_r$ are alike.



