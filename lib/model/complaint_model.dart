class Complaint{

   String?name;
    String?address;
     String?email;
      String?phone;
       String?gender;
        String?ward;
         String?complaint;
        List<String>? imageUrls;
         double? latitude;
  double? longitude;


  Complaint({ this.name,
    this.address,
     this.email, 
     this.phone,
      this.gender,
       this.ward,
       this.complaint,
        this.imageUrls,
          this.latitude, // Add this line
     this.longitude,
  
        
        });

       Complaint.fromjson(Map<String, dynamic> json){

        name=json['name'];
        address=json['address'];
        email=json['email'];
        phone=json['phone'];
        gender=json['gender'];
        ward=json['ward'];
        complaint=json['complaint'];
        imageUrls = List<String>.from(json['imageUrl']);
         latitude = json['latitude']?.toDouble() ?? 0.0; // default value if null
  longitude = json['longitude']?.toDouble() ?? 0.0; // default value if null

       }

       
  toJson(Complaint complains) {
    Map<String, dynamic> json = {};

    json['name'] = complains.name;
    json['address'] = complains.address;
    json['email'] = complains.email;
    json['phone'] = complains.phone;
    json['gender'] = complains.gender;
    json['ward'] = complains.ward;
      json['complaint'] = complains.complaint;
      json['imageUrl'] = complains.imageUrls;
        json['latitude'] = complains.latitude;
        json['longitude'] = complains.longitude;
       

  return json;

  }

}