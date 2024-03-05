

import 'package:adminforhamropalika/model/newsfeed_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class NewsFeedDb {
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<String> addpost(NewsFeed newsfeeds) async {
    DocumentReference<Map<String, dynamic>> documentReference =
        db.collection('newsfeed').doc();

    // Set the data to the document
    await documentReference.set(newsfeeds.toJson(newsfeeds));

    // Return the auto-generated ID
    return documentReference.id;
  }

  Future<List<NewsFeed>> getAllNewsFeed() async {
    List<NewsFeed> newsfeed = [];

    try {
      QuerySnapshot<Map<String, dynamic>> collection =
          await db.collection('newsfeed').get();

      for (var doc in collection.docs) {
        Map<String, dynamic> jsonData = doc.data();
        jsonData['id'] = doc.id;
        newsfeed.add(NewsFeed.fromjson(jsonData));
      }
    } catch (error, stackTrace) {
      print("Unable to get data $error and the stackTrace is $stackTrace");
    }

    return newsfeed;
  }
}

