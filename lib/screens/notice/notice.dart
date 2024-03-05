import 'dart:io';

import 'package:adminforhamropalika/model/notice_model.dart';
import 'package:adminforhamropalika/services/notice_image_db.dart';
import 'package:adminforhamropalika/view_model/notice_view_model.dart';
import 'package:flutter/material.dart';
import 'package:images_picker/images_picker.dart';
import 'package:provider/provider.dart';

class SendNotice extends StatefulWidget {
  const SendNotice({super.key});

  @override
  State<SendNotice> createState() => _SendNoticeState();
 
}
  List<File> selectedImages = [];
  late NoticeImageDb noticeImageDb;

class _SendNoticeState extends State<SendNotice> {
   late UsernoticeViewModel userNoticeViewModel;
     TextEditingController headingcontroller = TextEditingController();
  TextEditingController noticecontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    userNoticeViewModel = Provider.of<UsernoticeViewModel>(context, listen: false);
      noticeImageDb = NoticeImageDb(selectedImages: selectedImages);
      noticeImageDb = NoticeImageDb(selectedImages: []);

  }
 @override
Widget build(BuildContext context) {

      double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Center(child: Text("Send Notice")),
        backgroundColor: Colors.green,
      ),
      body:  SingleChildScrollView(
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
                                  controller: headingcontroller,
                                  maxLines:
                                      null, 
                                  keyboardType: TextInputType
                                      .multiline, 
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 15),
                                      border: InputBorder.none,
                                      hintText: "Write heading here"),
                                ),
                              ),
              ),
            ),

            SizedBox(
              height: 20,
            ),
        
                           SingleChildScrollView(
                             child: Container(
                              width: deviceWidth * 0.90,
                              height: deviceHeight * 0.20,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: TextField(
                                controller:noticecontroller,
                                maxLines:
                                    null, 
                                keyboardType: TextInputType
                                    .multiline, 
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 15),
                                    border: InputBorder.none,
                                    hintText: "Write full notice here"),
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
    
      NoticeImageDb noticeImageDb=NoticeImageDb(selectedImages: selectedImages);
      List<String>imageUrl=await noticeImageDb.uploadImagesToFirebaseStorage();
                
            

 userNoticeViewModel.addnotice(UserNotice(
      heading: headingcontroller.text,
      notice: noticecontroller.text,
      timestamp: DateTime.now(),
      imageUrls: imageUrl,
    ));

                                                 setState(() {
        selectedImages.clear();
           headingcontroller.clear();
      noticecontroller.clear();
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