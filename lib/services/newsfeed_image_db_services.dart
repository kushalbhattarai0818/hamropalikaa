import 'dart:io';



import 'package:firebase_storage/firebase_storage.dart'as firebase_storage;
import 'package:uuid/uuid.dart';



class NewsfeedImageDb {
  List<File> selectedImages;

  NewsfeedImageDb({required this.selectedImages});

  Future<List<String>> uploadImagesToFirebaseStorage() async {
    List<String> imageUrls = [];
    var uuid = Uuid();

    try {
      for (int i = 0; i < selectedImages.length; i++) {
        File image = selectedImages[i];
        String fileName = 'image_${uuid.v4()}.jpg'; 
        firebase_storage.Reference reference =
            firebase_storage.FirebaseStorage.instance.ref().child('Newsfeed_folder/$fileName');
        await reference.putFile(image);
        String downloadURL = await reference.getDownloadURL();
        print('Image $i uploaded. Download URL: $downloadURL');
        imageUrls.add(downloadURL);
      }
    } catch (e) {
      print('Error uploading images: $e');
    }

    return imageUrls;
  }
}