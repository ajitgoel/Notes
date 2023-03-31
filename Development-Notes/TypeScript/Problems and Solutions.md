**Problem:**
Cannot find module 'monocdk/aws-stepfunctions-tasks/lib/resource-arn-suffix'
**Solution:**
brazil ws clean && bb clean && rm -rf node_modules build dist package-lock.json
brazil ws sync --md
bb app install && bb app install --save-dev