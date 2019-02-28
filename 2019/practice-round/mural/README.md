# Mural

## Problem

Thanh wants to paint a wonderful mural on a wall that is **N** sections long. Each
section of the wall has a beauty score, which indicates how beautiful it will
look if it is painted. Unfortunately, the wall is starting to crumble due to
a recent flood, so he will need to work fast!

At the beginning of each day, Thanh will paint one of the sections of the wall.
On the first day, he is free to paint any section he likes. On each subsequent
day, he must paint a new section that is next to a section he has already
painted, since he does not want to split up the mural.

At the end of each day, one section of the wall will be destroyed. It is always
a section of wall that is adjacent to only one other section and is unpainted
(Thanh is using a waterproof paint, so painted sections can't be destroyed).

The total beauty of Thanh's mural will be equal to the sum of the beauty scores
of the sections he has painted. Thanh would like to guarantee that, no matter
how the wall is destroyed, he can still achieve a total beauty of at least B.
What's the maximum value of B for which he can make this guarantee?

## Input

The first line of the input gives the number of test cases, **T**. **T** test cases
follow. Each test case starts with a line containing an integer **N**. Then,
another line follows containing a string of **N** digits from 0 to 9. The i-th
digit represents the beauty score of the i-th section of the wall.

## Output

For each test case, output one line containing Case #x: y, where x is the test
case number (starting from 1) and y is the maximum beauty score that Thanh can
guarantee that he can achieve, as described above.
