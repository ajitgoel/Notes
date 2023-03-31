
### Difference between a tilde (~) and a caret (^) in a npm package.json file

The version number is in [semver syntax](http://semver.org/) which designates each section with different meaning. semver is broken into three sections separated by a dot.
major.minor.patch
1.0.2
Major, minor and patch represent the different releases of a package.
npm uses the tilde (~) and caret (^) to designate which patch and minor versions to use respectively.
So if you see `~1.0.2` it means to install version `1.0.2` or the latest patch version such as `1.0.4`. If you see `^1.0.2` it means to install version `1.0.2` or the latest minor or patch version such as `1.1.0`.