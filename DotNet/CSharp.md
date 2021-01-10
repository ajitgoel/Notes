###### HttpContent.ReadAsAsync in .Net Core
a. install-package Microsoft.AspNet.WebApi.Client
var myClass = await response.Content.ReadAsAsync<MyClass>());
b. using Json.Net instead of using Microsoft.AspNet.WebApi.Client
var myClass = JsonConvert.DeserializeObject<MyClass>(await response.Content.ReadAsStringAsync());

###### Check dictionary contains key
var containsKey=dictionary.ContainsKey(keyname);

###### Read AWS access key, secret key from AWS configuration file
var credentialProfileStoreChain = new CredentialProfileStoreChain(@"C:\Users\AjitGoel\.aws\credentials");
credentialProfileStoreChain.TryGetAWSCredentials("amplify-workshop-user", out AWSCredentials awsCredentials);
var credentials = awsCredentials.GetCredentials();
var aws_access_key_id = credentials.AccessKey;
var aws_secret_access_key = credentials.SecretKey;

**Logging entity framework database commands to debug window:**

public partial class InstaTranscribeDatabaseContext : Microsoft.EntityFrameworkCore.DbContext
{
    public static readonly ILoggerFactory loggerFactory = new LoggerFactory(new[] {new DebugLoggerProvider()});
    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        optionsBuilder.UseLoggerFactory(loggerFactory).EnableSensitiveDataLogging();
    }
}

**C# Equivalent of SQL Server DataTypes**

| SQL Server data type | Equivalent C# data type |
| -------------------- | ----------------------- |
| varbinary            | Byte[]                  |
| binary               | Byte[]                  |
| image                | None                    |
| varchar              | None                    |
| char                 | None                    |
| nvarchar             | String, Char[]          |
| nchar                | String, Char[]          |
| text                 | None                    |
| ntext                | None                    |
| rowversion           | Byte[]                  |
| bit                  | Boolean                 |
| tinyint              | Byte                    |
| ==smallint==         | ==Int16==               |
| int                  | Int32                   |
| bigint               | Int64                   |
| smallmoney           | Decimal                 |
| money                | Decimal                 |
| numeric              | Decimal                 |
| decimal              | Decimal                 |
| real                 | Single                  |
| float                | Double                  |
| smalldatetime        | DateTime                |
| datetime             | DateTime                |
| table                | None                    |
| cursor               | None                    |
| timestamp            | None                    |
| xml                  | None                    |