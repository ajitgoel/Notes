###### Testing Vuejs
https://laracasts.com/series/testing-vue

vue-cli projects use @ to refer to the src directory.
https://www.freecodecamp.org/news/simple-unit-tests-with-vue-test-utils-and-jest-c384d7abc321/

###### string concatenation:
var username = 'craig';
console.log(`hello ${username}`);

###### split string into array based on newline:
var stringAsArray = stringInstance.Split("\n");

###### Concat text and variable in template:
<vs-list-item :subtitle="data[id].invoiceData.tasks[0].pricePerHour + ' USD'"/>

###### Change a value inside the onclick:
<button @click="newTitle = false">Save</button>
<script type="text/javascript">
  data :{
      newTitle : true
  }
</script>