import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';

admin.initializeApp();
const db = admin.firestore();
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