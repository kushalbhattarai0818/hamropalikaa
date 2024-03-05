import 'package:adminforhamropalika/model/complaint_model.dart';
import 'package:adminforhamropalika/screens/watersupply/complaint_details_screen.dart';
import 'package:adminforhamropalika/view_model/complaint_view_model.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class ComplaintListScreen extends StatelessWidget {
  const ComplaintListScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(child: Text('Complaints')),
      ),
      backgroundColor: Colors.white,
      body: Consumer<ComplaintViewModel>(
        builder: (context, complaintViewModel, child) {
          List<Complaint> complaints = complaintViewModel.complains;

          return ListView.builder(
            itemCount: complaints.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  height: 80,
                    decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(20),
                           color: Colors.grey[200],
                          ),
                  child: ListTile(
                     title: Text("Name: ${complaints[index].name ?? 'Anonymous'}"),
                    subtitle: Text("Complaint:${complaints[index].complaint ?? ''}"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ComplaintDetailsScreen(complaint: complaints[index]),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
