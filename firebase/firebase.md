###### Refer to database collection in firebase functions
import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';
var users= admin.firestore().collection('users');

###### Debug firebase functions
a. set GOOGLE_APPLICATION_CREDENTIALS=C:\Users\AjitGoel\Downloads\VideoAudioTranscription\functions\key.json
b. after firebase.initializeApp
firebase.functions().useFunctionsEmulator('http://localhost:5000') 
c. In the \.vscode\launch.json, add 
    {
      "type": "node",
      "request": "attach",
      "name": "Attach",
      "port": 9229,
      "restart": true,
      "skipFiles": ["<node_internals>/**"]
    }
d. in one window run,
firebase emulators:start --only functions --inspect-functions
e. in second window run, 
cd functions
npm run build:watch
f. in visual studio code, in "debug" menu item, click "attach"
g. run the runnable function in postman, using the link provided in the browser window created by step d above. 
"raw" option
"json" option
body:
-----
{
    "data": {"body":{"quantity":51}}
}

##### Firebase commands: 
###### start emulators: 
firebase emulators:start
###### configure emulators:
firebase init emulators
###### Complete application deploy:
npm run build && firebase deploy
###### deploy only functions:
firebase deploy --only functions
###### deploy only front end:
npm run build && firebase deploy --only hosting
###### deploy firesore rules:
firebase deploy --only firestore:rules
###### deploy single function:
firebase deploy --only functions:<functionname1>,functions:<functionname2>
###### set configuration for firebase functions: 
firebase functions:config:set sendgrid.key=a stripe.secretkey=b
###### Get configuration for firebase functions(and output to a file): 
firebase functions:config:get > .runtimeconfig.json
###### view deployed site: 
firebase open hosting:site

