import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';

admin.initializeApp();
const db = admin.firestore();
//var key = "eUwv2hxyzBU:APA91bF-e4bB1IFEv_IJAs67F1tdchvQDKrxikT0krp5kl2VSJ_lN76kwvkn0l3NUKz_r5Ut7q-FcUG7IUE4XGKgJDCmI3czvPEQQkn78IX6W9Xb0o6vyQ0GyLDXN84ZY_PEhaUTgp66"
const fcm = admin.messaging();

export const sendToTheDevice = functions.firestore
    .document('BNHA/{chapterId}')
    .onCreate(async snapshot => {
        const chapter = snapshot.data();
        var tokens = [];

        await db.collection('Users').get()
            .then((snapshot) => {

                if(snapshot.empty)
                    console.log('No devices');
                else {

                    for(var doc of snapshot.docs){
                        tokens.push(doc.data().token)
                    }
                }
            })



        const payload = {
            notification: {
                title: 'A new chapter has been released',
                body: `Read Boku no Hero Academia Chapter ${chapter.number} now!`,
                clickAction: 'FLUTTER_NOTIFICATION_CLICK',
            },
        };

        return fcm.sendToDevice(tokens, payload);
    });