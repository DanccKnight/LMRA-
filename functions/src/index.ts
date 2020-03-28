import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';
admin.initializeApp();

//const db = admin.firestore();
const fcm = admin.messaging();

export const sendToTopic = functions.firestore
    .document('My Hero Academia/{chapterid}')
    .onCreate(async snapshot => {
        const chapter = snapshot.data();
        const payload: admin.messaging.MessagingPayload = {
            notification: {
                title: 'A new chapter is out',
                body: `Read Boku no Hero Academia Chapter ${chapter.number} now`,
                clickAction: 'FLUTTER_NOTIFICATION_CLICK'
            }
        };
        return fcm.sendToTopic('My Hero Academia', payload);
    });