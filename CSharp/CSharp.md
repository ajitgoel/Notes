###### HttpContent.ReadAsAsync in .Net Core
a. install-package Microsoft.AspNet.WebApi.Client
var myClass = await response.Content.ReadAsAsync<MyClass>());
b. using Json.Net instead of using Microsoft.AspNet.WebApi.Client
var myClass = JsonConvert.DeserializeObject<MyClass>(await response.Content.ReadAsStringAsync());

###### Check dictionary contains key
var containsKey=dictiorary.ContainsKey(keyname);

###### Read AWS access key, secret key from AWS configuration file
var credentialProfileStoreChain = new CredentialProfileStoreChain(@"C:\Users\AjitGoel\.aws\credentials");
credentialProfileStoreChain.TryGetAWSCredentials("amplify-workshop-user", out AWSCredentials awsCredentials);
var credentials = awsCredentials.GetCredentials();
var aws_access_key_id = credentials.AccessKey;
var aws_secret_access_key = credentials.SecretKey;