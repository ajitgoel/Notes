```
using System;
public class Program
{
	public static void Main()
	{
		var array=new int[,]{{1,2}, {3,4}, {5,6}, {7,8}};
		var result=0;
		for(var i=0; i<array.GetLength(0); i++)
		{
			if((array[i,0] ^ array[i,1]) > (array[i,0] & array[i, 1]))
			{	
				result++;
			}
		}
		Console.WriteLine("result: " + result.ToString()) ;
	}
}
```