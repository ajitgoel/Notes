###### Vue.js debugging in Chrome and VS Code:
https://github.com/Microsoft/vscode-recipes/blob/master/vuejs-cli/README.md
vue.config.js:
module.exports = {
  configureWebpack: {
    devtool: 'source-map',
  }
}

put debugger on that line, in the .vue code where we need to debug