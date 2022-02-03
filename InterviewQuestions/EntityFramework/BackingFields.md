==**Backing fields**==: controlling access to data in an entity class  

public class Person
{
private DateTime _dateOfBirth;
public void SetDateOfBirth(DateTime dateOfBirth)
{
_dateOfBirth = dateOfBirth;
}

==//The private backing field, which can’t be directly accessed via normal .NET software==
==public int AgeYears =>Years(_dateOfBirth, DateTime.Today);==

==//Allows the backing field to be set You can access the person’s age, but not their exact date of birth.==
private static int Years(DateTime start, DateTime end)
{
return (end.Year - start.Year - 1) +(((end.Month > start.Month) ||((end.Month == start.Month)&& (end.Day >= start.Day)))? 1 : 0);
}}  