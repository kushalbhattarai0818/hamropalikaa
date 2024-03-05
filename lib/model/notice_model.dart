class UserNotice{

   String?heading;
    String?notice;
  late  DateTime timestamp;
    List<String>? imageUrls;
   

  UserNotice({ this.heading,
    this.notice,
      required this.timestamp,
         this.imageUrls,
    });

       UserNotice.fromjson(Map<String, dynamic> json){

        heading=json['heading'];
        notice=json['notice'];
        timestamp=json['timestamp'];
         imageUrls = List<String>.from(json['imageUrl']);
      
       }

       
  toJson(UserNotice notices) {
    Map<String, dynamic> json = {};

    json['heading'] = notices.heading;
    json['notice'] = notices.notice;
    json['timestamp']=notices.timestamp;
     json['imageUrl'] = notices.imageUrls;
       

  return json;

  }

}