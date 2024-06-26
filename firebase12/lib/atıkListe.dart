import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class WasteTrackingResultsPage extends StatelessWidget {
  final List<Map<String, dynamic>> selectedWastes;

  WasteTrackingResultsPage({required this.selectedWastes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('wastes').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final wastes = snapshot.data!.docs;

          return ListView.builder(
            itemCount: wastes.length,
            itemBuilder: (context, index) {
              final waste = wastes[index];
              return ListTile(
                title: Text(waste['Atık Türü']),
                subtitle: Text(waste['Miktar']),
                trailing: Text(waste['Durumu']),
              );
            },
          );
        },
      ),
    );
  }
}
