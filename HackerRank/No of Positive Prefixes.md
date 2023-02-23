```
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Net.Http;
using System.Threading.Tasks;
using Newtonsoft.Json;

public class Program
{
	public static void Main(string[] args)
	{
		var array=new int[]{-6,3,4,-10};
		NoOfPositivePrefixes(array);
	}
	public static void NoOfPositivePrefixes(int[] array)
	{
		array=array.OrderByDescending(x=>x).ToArray();
		int prefixSum=0, NoOfPositiveElements=0;
		for(var i=0; i<array.Length; i++)
		{
			prefixSum=prefixSum+array[i];
			if(prefixSum > 0)
			{
				NoOfPositiveElements++;
			}
		}
		return NoOfPositiveElements;
	}
}

```