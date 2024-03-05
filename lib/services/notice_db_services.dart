
import 'package:adminforhamropalika/model/notice_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UsernoticeDb {
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<String> addnotice(UserNotice notices) async {
    DocumentReference<Map<String, dynamic>> documentReference =
        db.collection('usernotice').doc();

    // Set the data to the document
    await documentReference.set(notices.toJson(notices));

    // Return the auto-generated ID
    return documentReference.id;
  }

  Future<List<UserNotice>> getAllusernotice() async {
    List<UserNotice> usernotices = [];

    try {
      QuerySnapshot<Map<String, dynamic>> collection =
          await db.collection('usernotice').get();

      for (var doc in collection.docs) {
        Map<String, dynamic> jsonData = doc.data();
        jsonData['id'] = doc.id;
        usernotices.add(UserNotice.fromjson(jsonData));
      }
    } catch (error, stackTrace) {
      print("Unable to get data $error and the stackTrace is $stackTrace");
    }

    return usernotices;
  }
}

