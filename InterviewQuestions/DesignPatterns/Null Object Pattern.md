## Avoid accidentally throwing a NullReferenceException and null object checking code(Null Object Pattern)

==**Null Object Pattern:**
Avoid accidentally throwing a NullReferenceException and null object checking code by using the **Null Object** design pattern.==

using System;
using System.Linq;
    public static class StringExtensions 
    { 
        public static int GetSafeLength(this string valueOrNull) 
        { 
            return (valueOrNull ?? string.Empty).Length; 
        }
    }
    public static class Program 
    {
        static readonly string[] strings = new [] { "ajit", "goel", null, "kumar" };
        public static void Main(string[] args) 
        {
           ==//no need to do any checks here
            var query = from text in strings select text.GetSafeLength();== 
            Console.WriteLine(query.Sum());
        }
    }
