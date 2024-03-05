import 'dart:io';



import 'package:adminforhamropalika/model/newsfeed_model.dart';
import 'package:adminforhamropalika/services/newsfeed_image_db_services.dart';
import 'package:adminforhamropalika/view_model/newsfeed_view_model.dart';
import 'package:flutter/material.dart';
import 'package:images_picker/images_picker.dart';
import 'package:provider/provider.dart';
class UserNewsFeed extends StatefulWidget {
  const UserNewsFeed({super.key, });

  @override
  State<UserNewsFeed> createState() => _UserNewsFeedState();
}
List<File> selectedImages = [];
late NewsfeedImageDb newsfeedImageDb;

class _UserNewsFeedState extends State<UserNewsFeed> {
  late NewsFeedViewModel newsFeedViewModel;
   TextEditingController captioncontroller = TextEditingController();
   
     var caption;
   @override
  void initState() {
    
    super.initState();
        newsFeedViewModel = Provider.of<NewsFeedViewModel>(context, listen: false);
      newsfeedImageDb = NewsfeedImageDb(selectedImages: selectedImages);
      newsfeedImageDb = NewsfeedImageDb(selectedImages: []);
  }
  @override
  Widget build(BuildContext context) {
    
      double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(

      appBar: AppBar(
        title: Text("News Feed"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Container(
                                width: deviceWidth * 0.90,
                                height: deviceHeight * 0.20,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: TextField(
                                  controller: captioncontroller,
                                  maxLines:
                                      null, 
                                  keyboardType: TextInputType
                                      .multiline, 
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 15),
                                      border: InputBorder.none,
                                      hintText: "Write caption here"),
                                ),
                              ),
              ),
            ),

                       

                              SizedBox(
              height: 20,
            ),
            Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () async {
                        List<Media>? res = await ImagesPicker.pick(
                          count: 3,
                          pickType: PickType.image,
                        );

                        if (res != null && res.isNotEmpty) {
                          setState(() {
                            selectedImages =
                                res.map((media) => File(media.path)).toList();
                          });
                        } else {
                          // No image selected
                          // print('No image selected');
                        }
                      },
                      child: Container(
                        width: 125,
                        height: 125,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.shade100,
                          border: Border.all(
                            color: Color.fromARGB(233, 0, 130, 4),
                            width: 2,
                          ),
                        ),
                        child: selectedImages.isNotEmpty
                            ? ClipOval(
                                child: Image.file(
                                  selectedImages.first,
                                  width: 125,
                                  height: 125,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Icon(
                                Icons.camera_alt_outlined,
                                size: 60,
                                color: Color.fromARGB(233, 0, 130, 4),
                              ),
                      ),
                    ),
                  ),

                      ElevatedButton(
              onPressed: () async {
    
      NewsfeedImageDb newsfeedImageDb=NewsfeedImageDb(selectedImages: selectedImages);
      List<String>imageUrl=await newsfeedImageDb.uploadImagesToFirebaseStorage();
                
            

  newsFeedViewModel.addpost(
                  NewsFeed(
                    caption: captioncontroller.text,
                    timestamp: DateTime.now(),
                    imageUrls: imageUrl,
                  ) as NewsFeed,
                
                );
 

                                                 setState(() {
        selectedImages.clear();
           captioncontroller.clear();
    
      });

             
     
              },

              child: Text("Send"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.pink; // Color when pressed
                    }
                    return Colors.green; // Default color
                  },
                ),
              ),
            ),

            
          ],
        ),
      ),
    );
  }
}