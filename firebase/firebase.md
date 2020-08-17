###### Refer to database collection in firebase functions
import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';
var users= admin.firestore().collection('users');