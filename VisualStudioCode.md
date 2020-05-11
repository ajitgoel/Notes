###### Vue.js debugging in Chrome and VS Code:
https://github.com/Microsoft/vscode-recipes/blob/master/vuejs-cli/README.md
vue.config.js:
module.exports = {
  configureWebpack: {
    devtool: 'source-map',
  }
}
put debugger on the line in the .vue code where we need to debug
run npm run serve
click start button to debug

###### Prettify Json:
Install Prettify Json extension
select json in the file
Cntl+Shift+P=> type "Prettify Json"