const functions = require('firebase-functions');
const admin = require('firebase-admin');

admin.initializeApp(functions.config().firebase);

var msgData;
var token = "eUwv2hxyzBU:APA91bF-e4bB1IFEv_IJAs67F1tdchvQDKrxikT0krp5kl2VSJ_lN76kwvkn0l3NUKz_r5Ut7q-FcUG7IUE4XGKgJDCmI3czvPEQQkn78IX6W9Xb0o6vyQ0GyLDXN84ZY_PEhaUTgp66";

exports.offerTrigger = functions.firestore.document(
    'My Hero Academia'/{chapter}
    ).onCreate((snapshot,context) => {
        msgData = snapshot.data();
        var payload = {
            "notifications": {
                "title": "A new chapter has been released",
                "body": "Read chapter " + msgData.number + " now!",
                "sound": "default"
            }
        }

        return admin.messaging().sendToDevice(token,payload).then((response) => {

        }).catch((error) => {
            console.log(error);
        })
    })