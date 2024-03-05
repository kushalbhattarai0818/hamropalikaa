import 'package:adminforhamropalika/model/complaint_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ComplaintDb {
  FirebaseFirestore cp = FirebaseFirestore.instance;

  Future<String> addComplaint(Complaint complaint) async {
    DocumentReference<Map<String, dynamic>> documentReference =
        cp.collection('complaint').doc();

    // Set the data to the document
    await documentReference.set(complaint.toJson(complaint));

    // Return the auto-generated ID
    return documentReference.id;
  }

  Future<List<Complaint>> getAllComplaint() async {
    List<Complaint> complaints = [];

    try {
      QuerySnapshot<Map<String, dynamic>> collection =
          await cp.collection('complaint').get();

      for (var doc in collection.docs) {
        Map<String, dynamic> jsonData = doc.data();
        jsonData['id'] = doc.id;
        complaints.add(Complaint.fromjson(jsonData));
      }
    } catch (error, stackTrace) {
      print("Unable to get data $error and the stackTrace is $stackTrace");
    }

    return complaints;
  }
}

