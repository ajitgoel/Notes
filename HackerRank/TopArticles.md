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
	public static async Task Main(string[] args)
	{
		var result=await topArticles(10);
		Console.WriteLine(JsonConvert.SerializeObject(result));
	}
	public class Result{
		public string About{get;set;}
		public int CommentCount{get;set;}
	}
	public static async Task<List<string>> topArticles(int limit) {
		System.Net.Http.HttpClient httpclient=new System.Net.Http.HttpClient();
		var url="https://jsonmock.hackerrank.com/api/article_users?page={}";
		var list=new List<Result>();
		int pageNumber=1;
		int total_pages=0;
		while(pageNumber>0)
		{
			var resultString=await httpclient.GetStringAsync(string.Format(url, pageNumber));
			var resultObject=JsonConvert.DeserializeObject<dynamic>(resultString);
			if(pageNumber==1){total_pages=resultObject.total_pages;}
			Console.WriteLine(resultObject);
			foreach(var element in resultObject.data)
			{
				list.Add(new Result(){About=element.about, CommentCount=element.comment_count});
			}
			if(pageNumber==total_pages){ break;}
			pageNumber++;
		}
		var result=list.OrderByDescending(x=>x.CommentCount).ThenBy(x=>x.About).Take(limit);
		return result.Select(x=>x.About).ToList<string>();
	}
}

```