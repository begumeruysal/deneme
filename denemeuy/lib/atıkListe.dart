
import 'package:flutter/material.dart';

class WasteTrackingResultsPage extends StatelessWidget {
  final List<Map<String, dynamic>> selectedWastes;

  WasteTrackingResultsPage({required this.selectedWastes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff7cc2d8),
        title: Text('Atık Takibi Sonuçları'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: selectedWastes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(selectedWastes[index]['Atık Türü']),
            subtitle: Text('Miktar: ${selectedWastes[index]['Miktar']} - Durum: ${selectedWastes[index]['Durumu']}'),
            trailing: Text(selectedWastes[index]['Tarih']),
          );
        },
      ),
    );
  }
}