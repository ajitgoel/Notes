# Sorting Algorithms

### 

Sorting is a fundamental concept in computer science and a practical day-to-day tool for building software in the real world. Because sorting is so ubiquitous, it's a favorite subject in interviews, and you'll almost certainly encounter problems related to it.

There are several common ways that sorting comes up in questions—and it's not always obvious at first glance. Here are some common patterns to watch out for:

- You're given **data that is already sorted**, but you need to understand how to take advantage of the properties of sorted data to solve the problem more efficiently.
- You're asked to solve a problem where the most efficient solution requires **adding a sorting algorithm** as an intermediate step.
- You may need to **implement a sorting function** to solve a particular use case or handle data in a specific format.

### Using sorted data

Generally when we talk about sorting in the context of interviews, we're referring to sorting **arrays** containing primitive types such as numbers or strings. Sorted data has a number of useful properties that make it more efficient to perform other operations. If you're given pre-sorted data, you should take advantage of this property to unlock more efficient solutions to the problem.

Here are some examples of problems that benefit from having sorted input:

- **Finding a particular value**. Determining the existence or index of a given value is an `O(log n)` operation in a sorted list or search tree. See [Binary Search] for more examples.
- **Finding the minimum or maximum values.** Rather than searching over the entire input, finding the *k* min/max elements with sorted input becomes an `O(1)` operation.
- **Finding duplicate or missing values.** Since similar values are grouped together in sorted lists, it's easier to determine the frequency of each value.

Sorting problems can also pop up in problems with other data structures, too, most notably in [binary search trees], [heaps], and [linked lists].

### Choosing a sorting algorithm

Remember, sorting doesn't always come for free. The efficiency of most sorting algorithms is based on the number of comparisons it has to perform between input elements, which scales with the input length `n`. The most common out-of-the-box sorting methods provided in standard libraries are typically based on Quicksort and have an average runtime of `O(n log n)` , so this is a good benchmark to remember when you're deciding whether sorting will improve the performance of your solution or not. For reference, we've included a table of common sorting algorithms and their best and worst-case runtimes:

| Algorithm      | Average Runtime | Worst Runtime | When to Use                                                  |
| :------------- | :-------------- | :------------ | :----------------------------------------------------------- |
| Insertion sort | N^2             | N^2           | Better for very short lists, stable, and in-place.           |
| Quicksort      | N log N         | N^2           | Often fastest in practice, can be in-place but not stable.   |
| Mergesort      | N log N         | N log N       | Stable but not in-place.                                     |
| Heap sort      | N log N         | N log N       | In-place and better worst case runtime than quicksort        |
| Radix sort     | N*k             | N*k           | Non-comparison sort that runs in linear time; stable but not in-place. |

So, when does it make sense to use a different sorting algorithm than the standard library? Here's a quick test you can use:

- Do you need to sort the entire list or just maintain the min/max `K` elements? Consider using heapsort to reduce time and space complexity. See [Heaps] for more examples.
- Is your data already partially or **nearly sorted**? Consider using insertion sort, which is the most efficient on this type of data.
- Do you need to sort **in-place** or create a copy of the original output? Insertion sort and quicksort can be performed in-place while merge sort cannot.
- Do you need a **stable** sort, where sorted items are retained in the same order? Merge sort and insertion sort are stable while quicksort is not.

### Implementing comparison functions

While it's possible that you'll be asked to implement a sorting algorithm from scratch, you're more likely to write a custom **comparison function**. You may need to implement such a function if the data you are sorting is an object or class rather than a primitive type with a built-in sort method, if you are sorting by multiple properties at the same time, or if you want to ensure a stable sort where previously sorted items retain their original order.

```python
// Basic comparison
function compare(a, b) {
	if (a === b) return 0;
  return a < b ? -1 : 1;
}

// Compare based on the property `name`
function compareProperty(a, b) {
	if (a.name === b.name) return 0;
	return a.name < b.name ? -1 : 1;
}

// Compare multiple properties, `name` then `price`
function compareMultipleProperties(a, b) {
  if (a.name === b.name) return b.price - a.price;
	return a.name < b.name ? -1 : 1;
}
```

### Practical example

Consider this example: You're given a list of recent appointment bookings with beginning and end times, expressed as hours from 0 to 23. We want to write a function `findScheduleConflicts` that will returns a list of all the unique appointments that are in conflict with each other, i.e. have overlapping start and end times.

```python
input: [[2,3], [1,2], [3,5], [4,6]]
output: [[3,5], [4,6]]
```

A brute-force solution could compare every appointment in the list, which would be O(n^2), but it would be much simpler to solve if our input were sorted. In this case, our data has more than one potential sort key, so we need to write a compare function that uses the appointment start time, a[0] . This will arrange our results so that any overlapping appointments will be next to each other in the list, allowing us to find conflicts in just one pass.

```python
function findScheduleConflicts(arr) {
  arr.sort((a, b) => b[0] - a[0]);
  const conflicts = new Set();

  for (let i = 0; i < sorted.length - 1; i++) {
	const a = sorted[i];
        const b = sorted[i + 1];
        if (b[0] < a[1]) {
            conflicts.add(a);
	    conflicts.add(b);
          }
   }

   const result = conflicts.values();
}
```

**Time complexity:** Our solution sorts the input with a runtime `O(n log n)` and iterates through the array one time to performs `N` extra comparisons, which still reduces to `O(n log n)`.

**Space complexity**: We sorted our array in-place and used a Set for a total memory overhead of `O(n)`.

### Practice Problems

- [Find the Duplicates](https://www.tryexponent.com/courses/software-engineering/swe-practice/find-the-duplicates)
- [Number Finder](https://www.tryexponent.com/courses/software-engineering/swe-practice/number-finder)
- [Merge Intervals](https://www.tryexponent.com/courses/software-engineering/swe-practice/merge-intervals)
- [K-Messed Array Sort](https://www.tryexponent.com/courses/software-engineering/swe-practice/k-messed-array-sort)