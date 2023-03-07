**Fibonacci:**
Write a function _fib_ that takes in a number argument, _n_, and returns the _n_-th number of the Fibonacci sequence.
The 0-th number of the sequence is 0.
The 1-st number of the sequence is 1.
To generate further numbers of the sequence, calculate the sum of previous two numbers.
Solve this recursively.
#### test_00:
`fib(0); // -> 0`
#### test_01:
`fib(1); // -> 1`
#### test_02:
`fib(2); // -> 1`
#### test_03:
`fib(3); // -> 2`

```
/// Time complexity: O(2 to the power of n) i.e exponential, Space complexity: O(n)
/// Time complexity with memonization: O(2*n) i.e linear, Space complexity: O(n)
const fib = (n, memo={}) => {
  if(n in memo)
    return memo[n];
  if(n===0)
    return 0;
  if(n===1)
    return 1;
  memo[n]=fib(n-1, memo) + fib(n-2, memo);
  return memo[n];
};
module.exports = {
  fib,
};
```

**tribonacci**
Write a function _tribonacci_ that takes in a number argument, _n_, and returns the _n_-th number of the Tribonacci sequence.
The 0-th and 1-st numbers of the sequence are both 0.
The 2-nd number of the sequence is 1.
To generate further numbers of the sequence, calculate the sum of previous three numbers.
Solve this recursively.

```
/// Time complexity: O(3 to the power of n) i.e exponential, Space complexity: O(n)
/// Time complexity with memonization: O(3*n) i.e linear, Space complexity: O(n)
const tribonacci = (n, memo={}) => {
  if(n in memo)
    return memo[n];
  if(n===0 || n===1)
    return 0;
  if(n===2)
    return 1;
  memo[n]=tribonacci(n-1, memo) + tribonacci(n-2, memo) + tribonacci(n-3, memo);
  return memo[n];
};
module.exports = {
  tribonacci,
};
```

**sum possible**
Write a function _sumPossible_ that takes in an amount and an array of positive numbers. The function should return a boolean indicating whether or not it is possible to create the amount by summing numbers of the array. You may reuse numbers of the array as many times as necessary.
You may assume that the target amount is non-negative.
#### test_00:
`sumPossible(8, [5, 12, 4]); // -> true, 4 + 4`
#### test_01:
`sumPossible(15, [6, 2, 10, 19]); // -> false`

```
/// Time complexity with memonization-linear: O(amount * length of numbers), Space complexity: O(amount)
const sumPossible = (amount, numbers, memo={}) => {
  if(amount in memo)
    return memo[amount];
  if(amount<0){
    memo[amount] =false;
    return false;
  }
  if(amount===0){
    memo[amount] =true;
    return true;
  }
  for(let number of numbers){
    if(sumPossible(amount-number, numbers, memo)){
      memo[amount] =true;
      return true;
    }
  }
  memo[amount]=false;
  return false;
};
module.exports = {
  sumPossible,
};
```

----------------------
**min change**
Write a function minChange that takes in an amount and an array of coins. The function should return the minimum number of coins required to create the amount. You may use each coin as many times as necessary.
If it is not possible to create the amount, then return -1.
test_00:
minChange(8, [1, 5, 4, 12]); // -> 2, because 4+4 is the minimum coins possible
test_01:
minChange(13, [1, 9, 5, 14, 30]); // -> 5
test_02:
minChange(23, [2, 5, 7]); // -> 4
test_03:
minChange(102, [1, 5, 10, 25]); // -> 6
test_04:
minChange(200, [1, 5, 10, 25]); // -> 8
test_05:
minChange(2017, [4, 2, 10]); // -> -1
test_06:
minChange(271, [10, 8, 265, 24]); // -> -1
test_07:
minChange(0, [4, 2, 10]); // -> 0
test_08:
minChange(0, []); // -> 0

```
const minChange = (amount, coins) => {
  const result=_minChange(amount, coins);
  if(result===Infinity)
    return -1;
  else
    return result;
}
const _minChange = (amount, coins, memo={}) => {
  if(amount in memo) 
    return memo[amount];
  if(amount<0)
    return Infinity;
  if(amount===0)
    return 0;
  let minCoins=Infinity;
  for(let coin of coins){
    const numCoins=1+_minChange(amount-coin, coins, memo);
    if(numCoins<minCoins){
      minCoins=numCoins;
    }
  }
  memo[amount]=minCoins;
  return memo[amount];
    
};
module.exports = {
  minChange,
};
```

----------------------------
**count paths**

Write a function, countPaths, that takes in a grid as an argument. In the grid, 'X' represents walls and 'O' represents open spaces. You may only move down or to the right and cannot pass through walls. The function should return the number of ways possible to travel from the top-left corner of the grid to the bottom-right corner.
test_00:

const grid = [
  ["O", "O"],
  ["O", "O"],
];
countPaths(grid); // -> 2

test_01:

const grid = [
  ["O", "O", "X"],
  ["O", "O", "O"],
  ["O", "O", "O"],
];
countPaths(grid); // -> 5

test_02:

const grid = [
  ["O", "O", "O"],
  ["O", "O", "X"],
  ["O", "O", "O"],
];
countPaths(grid); // -> 3

test_03:

const grid = [
  ["O", "O", "O"],
  ["O", "X", "X"],
  ["O", "O", "O"],
];
countPaths(grid); // -> 1

test_04:

const grid = [
  ["O", "O", "X", "O", "O", "O"],
  ["O", "O", "X", "O", "O", "O"],
  ["X", "O", "X", "O", "O", "O"],
  ["X", "X", "X", "O", "O", "O"],
  ["O", "O", "O", "O", "O", "O"],
];
countPaths(grid); // -> 0

test_05:

const grid = [
  ["O", "O", "X", "O", "O", "O"],
  ["O", "O", "O", "O", "O", "X"],
  ["X", "O", "O", "O", "O", "O"],
  ["X", "X", "X", "O", "O", "O"],
  ["O", "O", "O", "O", "O", "O"],
];
countPaths(grid); // -> 42

test_06:

const grid = [
  ["O", "O", "X", "O", "O", "O"],
  ["O", "O", "O", "O", "O", "X"],
  ["X", "O", "O", "O", "O", "O"],
  ["X", "X", "X", "O", "O", "O"],
  ["O", "O", "O", "O", "O", "X"],
];
countPaths(grid); // -> 0

test_07:

const grid = [
  ["O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O"],
  ["O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O"],
  ["O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O"],
  ["O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O"],
  ["O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O"],
  ["O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O"],
  ["O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O"],
  ["O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O"],
  ["O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O"],
  ["O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O"],
  ["O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O"],
  ["O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O"],
  ["O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O"],
  ["O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O"],
  ["O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O"],
];
countPaths(grid); // -> 40116600

test_08:

const grid = [
  ["O", "O", "X", "X", "O", "O", "O", "X", "O", "O", "O", "O", "O", "O", "O"],
  ["O", "O", "X", "X", "O", "O", "O", "X", "O", "O", "O", "O", "O", "O", "O"],
  ["O", "O", "O", "X", "O", "O", "O", "X", "O", "O", "O", "O", "O", "O", "O"],
  ["X", "O", "O", "O", "O", "O", "O", "X", "O", "O", "O", "O", "O", "O", "O"],
  ["X", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O"],
  ["O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "X", "X", "O"],
  ["O", "O", "O", "O", "O", "O", "O", "X", "O", "O", "O", "O", "O", "X", "O"],
  ["O", "O", "O", "O", "O", "O", "O", "O", "X", "O", "O", "O", "O", "O", "O"],
  ["X", "X", "X", "O", "O", "O", "O", "O", "O", "X", "O", "O", "O", "O", "O"],
  ["O", "O", "O", "O", "X", "X", "O", "O", "O", "O", "X", "O", "O", "O", "O"],
  ["O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O"],
  ["O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O"],
  ["O", "O", "O", "O", "X", "X", "O", "O", "O", "O", "O", "O", "O", "O", "O"],
  ["O", "O", "O", "O", "O", "O", "O", "O", "X", "O", "O", "O", "O", "O", "O"],
  ["O", "O", "O", "O", "O", "O", "O", "O", "X", "O", "O", "O", "O", "O", "O"],
];
countPaths(grid); // -> 3190434

```
const countPaths = (grid, r=0, c=0, memo={}) => {
  const pos=r+','+c;
  if(pos in memo)
    return memo[pos];
  if(r===grid.length || c===grid[0].length || grid[r][c]==='X')
    return 0;
  //if we are going from end of the grid to end of grid 
  //then we can do it in 1 paths
  if(r===grid.length-1 && c===grid[0].length-1)
    return 1;
  const downCount=countPaths(grid,r+1,c,memo);
  const rightCount=countPaths(grid,r,c+1,memo);
  memo[pos]=rightCount+downCount;
  return memo[pos];
};
module.exports = {
  countPaths,
};
```

------------------------------

max path sum

Write a function, maxPathSum, that takes in a grid as an argument. The function should return the maximum sum possible by traveling a path from the top-left corner to the bottom-right corner. You may only travel through the grid by moving down or right.

You can assume that all numbers are non-negative.
test_00:

const grid = [
  [1, 3, 12],
  [5, 1, 1],
  [3, 6, 1],
];
maxPathSum(grid); // -> 18

test_01:

const grid = [
  [1, 2, 8, 1],
  [3, 1, 12, 10],
  [4, 0, 6, 3],
];
maxPathSum(grid); // -> 36

test_02:

const grid = [
  [1, 2, 8, 1],
  [3, 10, 12, 10],
  [4, 0, 6, 3],
];
maxPathSum(grid); // -> 39

test_03:

const grid = [
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
];
maxPathSum(grid); // -> 27

test_04:

const grid = [
  [1, 1, 3, 1, 1, 1, 1, 4, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1, 2, 1, 1, 6, 1, 1, 5, 1, 1, 0, 0, 1],
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 5, 1, 1, 1, 1, 0, 1, 1, 1, 1],
  [2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [2, 1, 1, 1, 1, 8, 1, 1, 1, 1, 1, 1, 1],
  [2, 1, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1, 9, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 8, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1, 42, 1, 1, 1, 1, 1, 1, 1, 8, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
];
maxPathSum(grid); // -> 82

```
const maxPathSum = (grid, r=0, c=0, memo={}) => {
  const pos=r+','+c;
  if(pos in memo)
    return memo[pos];
  if(r===grid.length || c===grid[0].length)
    return -Infinity;
  if(r===grid.length-1 && c===grid[0].length-1)
    return grid[r][c];
  const down=maxPathSum(grid,r+1,c,memo);
  const right=maxPathSum(grid,r,c+1,memo);
  memo[pos]=grid[r][c] + Math.max(right,down);
  return memo[pos];
};
module.exports = {
  maxPathSum,
};

```

------------------------------
## non adjacent sum
Write a function, _nonAdjacentSum_, that takes in an array of numbers as an argument. The function should return the maximum sum of non-adjacent elements in the array. There is no limit on how many elements can be taken into the sum as long as they are not adjacent.
`For example, given: [2, 4, 5, 12, 7]  The maximum non-adjacent sum is 16, because 4 + 12.  4 and 12 are not adjacent in the array.`
#### test_00:
`const nums = [2, 4, 5, 12, 7]; nonAdjacentSum(nums); // -> 16`
#### test_01:
`const nums = [7, 5, 5, 12]; nonAdjacentSum(nums); // -> 19`
#### test_02:
`const nums = [7, 5, 5, 12, 17, 29]; nonAdjacentSum(nums); // -> 48`
#### test_03:
`const nums = [   72, 62, 10,  6, 20, 19, 42,   46, 24, 78, 30, 41, 75, 38,   23, 28, 66, 55, 12, 17, 9,   12, 3, 1, 19, 30, 50, 20 ]; nonAdjacentSum(nums); // -> 488`
#### test_04:
`const nums = [   72, 62, 10,  6, 20, 19, 42, 46, 24, 78,   30, 41, 75, 38, 23, 28, 66, 55, 12, 17,   83, 80, 56, 68,  6, 22, 56, 96, 77, 98,   61, 20,  0, 76, 53, 74,  8, 22, 92, 37,   30, 41, 75, 38, 23, 28, 66, 55, 12, 17,   72, 62, 10,  6, 20, 19, 42, 46, 24, 78,   42 ]; nonAdjacentSum(nums); // -> 1465`

```
const nonAdjacentSum = (nums, indexBeingConsidered=0, memo={}) => {
  if(indexBeingConsidered in memo)
    return memo[indexBeingConsidered];
  if(indexBeingConsidered>=nums.length)
    return 0;
  const include=nums[indexBeingConsidered] + 
        nonAdjacentSum(nums,indexBeingConsidered+2, memo);
  const exclude=nonAdjacentSum(nums, indexBeingConsidered+1, memo);
  memo[indexBeingConsidered]=Math.max(include,exclude);
  return memo[indexBeingConsidered];
};
module.exports = {
  nonAdjacentSum,
};
```
------------------------
## summing squares

Write a function, _summingSquares_, that takes a target number as an argument. The function should return the minimum number of perfect squares that sum to the target. A perfect square is a number of the form (i*i) where i >= 1.

For example: 1, 4, 9, 16 are perfect squares, but 8 is not perfect square.

`Given 12: summingSquares(12) -> 3  The minimum squares required for 12 is three, by doing 4 + 4 + 4.  Another way to make 12 is 9 + 1 + 1 + 1, but that requires four perfect squares.`

#### test_00:

`summingSquares(8); // -> 2`

#### test_01:

`summingSquares(9); // -> 1`

#### test_02:

`summingSquares(12); // -> 3`

#### test_03:

`summingSquares(1); // -> 1`

#### test_04:

`summingSquares(31); // -> 4`

#### test_05:

`summingSquares(50); // -> 2`

#### test_06:

`summingSquares(68); // -> 2`

#### test_07:

`summingSquares(87); // -> 4`

```
const summingSquares = (n, memo={}) => {
  if(n in memo) return memo[n];
  if(n===0) return 0;
  let minSquares=Infinity;
  for(let i=1; i<=Math.sqrt(n); i++){
    const square=i*i;
    const numSquares=1+summingSquares(n-square, memo);
    minSquares=Math.min(numSquares,minSquares);
  }
  memo[n]=minSquares;
  return memo[n];
};
module.exports = {
  summingSquares,
};

```