import 'package:adminforhamropalika/model/complaint_model.dart';
import 'package:flutter/material.dart';

class ComplaintDetailsScreen extends StatelessWidget {
    final Complaint complaint;

  const ComplaintDetailsScreen({super.key, required this.complaint});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Complaint Details')),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${complaint.name ?? ''}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
                Text(
              'Address: ${complaint.address ?? ''}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
                Text(
              'phone : ${complaint.phone ?? ''}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
                Text(
              'Email: ${complaint.email ?? ''}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
                Text(
              'Gender: ${complaint.gender ?? ''}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
                Text(
              'Ward: ${complaint.ward ?? ''}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'Complaint: ${complaint.complaint ?? ''}',
               style: TextStyle(fontWeight: FontWeight.bold),
            ),
             SizedBox(height: 8.0),
               Text(
              'Current Location',
               style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'latitude: ${complaint.latitude ?? ''}',
               style: TextStyle(),
            ),
              Text(
              'longitude: ${complaint.longitude ?? ''}',
               style: TextStyle(),
            ),
            SizedBox(height: 16.0),
            if (complaint.imageUrls != null && complaint.imageUrls!.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Images:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  // Display images here (you can use a ListView.builder)
                  // Example:
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: complaint.imageUrls!.length,
                    itemBuilder: (context, index) {
                      return Image.network(complaint.imageUrls![index]);
                    },
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}