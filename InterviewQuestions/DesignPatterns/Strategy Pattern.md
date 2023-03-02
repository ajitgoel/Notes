
## Encapsulate and vary algorithm from the client that uses it(Strategy Pattern)

==**Strategy pattern** is a software design pattern that enables an algorithm’s behavior to be selected at runtime.== It
a. defines a family of algorithms,
b. encapsulates each algorithm, and
c. makes the algorithms interchangeable within that family.

**Example:**
```
using System.Collections.Generic;
class StrategyDesignPatternClient
{
    static void Main()
    {
        var sortedList = new SortedList();
        sortedList.Add("name 1");
        sortedList.Add("name 2");
        sortedList.Add("name 3");
        /*The client passes the "sort strategy" to the SortedList so the SortedList can use that passed strategy to sort the internal list*/
        sortedList.SetSortStrategy(new QuickSort());
        sortedList.Sort();
    }
}
public class SortedList
{
    private List<string> list = new List<string>();
    private SortStrategy sortstrategy;
    public void SetSortStrategy(SortStrategy sortstrategy)
    {
        this.sortstrategy = sortstrategy;
    }
    public void Add(string name)
    {
        list.Add(name);
    }
    public void Sort()
    {
        /*Ask the "SortStrategy" class to sort the list*/
        sortstrategy.Sort(list);
    }
}
public interface ISortStrategy
{
    void Sort(List<string> list);
}
public class QuickSort : ISortStrategy
{
    public void Sort(List<string> list)
    {
        // Default is Quicksort
        list.Sort(); 
    }
}
public class ShellSort : ISortStrategy
{
    public void Sort(List<string> list)
    {
        // ShellSort the "list" collection here. 
    }
}
public class MergeSort : ISortStrategy
{
    public void Sort(List<string> list)
    {
        //MergeSort the "list" collection here. 
    }
}
```
```
