###### HttpContent.ReadAsAsync in .Net Core
a. install-package Microsoft.AspNet.WebApi.Client
var myClass = await response.Content.ReadAsAsync<MyClass>());
b. using Json.Net instead of using Microsoft.AspNet.WebApi.Client
var myClass = JsonConvert.DeserializeObject<MyClass>(await response.Content.ReadAsStringAsync());

###### Check dictionary contains key
var containsKey=dictiorary.ContainsKey(keyname);

