

class NewsFeed{

   String?caption;
    
    
     List<String>? imageUrls;
      DateTime? timestamp; 
   

  NewsFeed({ this.caption,

  
         this.imageUrls,
           this.timestamp,
    });

       NewsFeed.fromjson(Map<String, dynamic> json){

        caption=json['caption'];
       
     
         timestamp=json['timestamp'];
         imageUrls = List<String>.from(json['imageUrl']);
     
      
       }

       
  toJson(NewsFeed newsfeeds) {
    Map<String, dynamic> json = {};

    json['caption'] = newsfeeds.caption;
   
    
       json['timestamp']=newsfeeds.timestamp;
     json['imageUrl'] = newsfeeds.imageUrls;
    
       

  return json;

  }

}