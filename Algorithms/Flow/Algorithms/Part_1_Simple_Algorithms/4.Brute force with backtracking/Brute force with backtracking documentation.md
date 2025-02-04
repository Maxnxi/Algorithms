#  Brute force with backtracking

Brute force with backtracking
The brute force algorithm with backtracking to work with empty solutions and expands it step by step. All possible variants of construction solutions are recursively iterated.
In this example, consider the problem of calculating the number of ways to place N queens on an n×n board so that no two beat each other. 
Thus, Image4.1 shows two possible solutions for n = 4.

Image4.2. Possible ways to place 4 queens on a 4×4 board

The problem can be solved by the brute force method with backtracking, considering horizontals after another. More precisely, exactly one queen can be placed on each horizontal so that it is not attacked by previously placed queens. The next solution will be found when it find all the problems on the queen. 

For example, Image4.2 shows several partial solutions generated by the backtracking algorithm for n = 4. The first three high-level arrangements are not allowed because the Queens attack each other.
But the fourth arrangement is allowed, and it can be expanded to a solution by placing two more Queens on the board. This can be done in one way.

./Flow/Algorithms/Part_1_Simple_Algorithms/4./Image4.1.png
./Flow/Algorithms/Part_1_Simple_Algorithms/4./Image4.2.png

