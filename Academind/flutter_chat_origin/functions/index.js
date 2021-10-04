const functions = require("firebase-functions");
const admin = require("firebase-admin");

admin.initializeApp();

exports.myFunction = functions.firestore
    .document("chat/{message}")
    .onCreate((snapshot, context) => {
      return admin.messaging().sendToTopic("chat", {
        notification: {
          title: snapshot.data().username,
          body: snapshot.data().text,
          clickAction: "FLUTTER_NOTIFICATION_CLICK",
        },
      });
    });


//Chạy lệnh này khi gặp lỗi Deploy & Có thể cần xóa các dòng coment này khi Deploy!
//cd functions && npx eslint . --fix
//https://stackoverflow.com/questions/68140196/how-to-fix-lint-problems-with-fix-in-firebase-functions