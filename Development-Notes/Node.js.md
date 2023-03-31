**Error:** your node v has to be v
https://refresh.sage.amazon.dev/posts/1068708

- Check which version of node you are using in mac by `which node`
- I used version 12. So install 12.0.0 by running `npm install`
- Now you can change to use node 12 by running `nvm use v12.0.0`
		brazil setup --node => get path of the node install => then use nvm use v{VersionNumberLike14.21.2} based on output of previous command. 
- Make sure that you have run `brazil setup --node` and Node 12.x has an executable path something like `/Users/<username>/.nvm/versions/node/v12.0.0/bin/node` I had an executable path of node 8 which was causing the issue.