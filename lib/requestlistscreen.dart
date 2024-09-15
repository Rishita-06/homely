// request_list_screen.dart
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:homely/database.dart'; // Import the database service

class RequestListScreen extends StatelessWidget {
  final DatabaseService dbService =
      DatabaseService(); // Instance of DatabaseService

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visitor Requests'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: dbService
            .getRequests(), // Fetching data from Firebase using the service
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No requests available'));
          }

          return ListView(
            children: snapshot.data!.docs.map((doc) {
              var requestData = doc.data() as Map<String, dynamic>;
              return RequestCard(
                requestData: requestData,
                documentId: doc.id,
                onAccept: () => dbService
                    .acceptRequest(doc.id), // Accept request using db service
                onReject: () => dbService
                    .rejectRequest(doc.id), // Reject request using db service
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

class RequestCard extends StatelessWidget {
  final Map<String, dynamic> requestData;
  final String documentId;
  final VoidCallback onAccept;
  final VoidCallback onReject;

  RequestCard({
    required this.requestData,
    required this.documentId,
    required this.onAccept,
    required this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Visitor: ${requestData['visitorName']}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text('Resident: ${requestData['residentName']}'),
            Text('Visit Date: ${requestData['visit']}'),
            Text('Relationship: ${requestData['relationship']}'),
            Text('Visitor Email: ${requestData['visitorEmail']}'),
            Text('Visitor Phone: ${requestData['visitorPhone']}'),
            Text('Notes: ${requestData['notes']}'),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.check, color: Colors.green),
                  onPressed: onAccept, // Accept request
                ),
                IconButton(
                  icon: Icon(Icons.close, color: Colors.red),
                  onPressed: onReject, // Reject request
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
