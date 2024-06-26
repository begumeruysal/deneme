import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WasteSelectionPage extends StatefulWidget {
  final List<Map<String, dynamic>> selectedWastes;
  final Function(List<Map<String, dynamic>>) onWastesUpdated;

  WasteSelectionPage({required this.selectedWastes, required this.onWastesUpdated});

  @override
  _WasteSelectionPageState createState() => _WasteSelectionPageState();
}

class _WasteSelectionPageState extends State<WasteSelectionPage> {
  bool _isFoodWasteSelected = false;
  double _foodWasteAmount = 0;

  bool _isOilWasteSelected = false;
  double _oilWasteAmount = 0;

  void _saveWasteToFirestore(Map<String, dynamic> wasteData) async {
    await FirebaseFirestore.instance.collection('wastes').add(wasteData);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            'ATIK TÜRÜ SEÇİNİZ',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SwitchListTile(
            title: Text('Gıda Atığı'),
            value: _isFoodWasteSelected,
            onChanged: (bool value) {
              setState(() {
                _isFoodWasteSelected = value;
              });
            },
            activeColor: Color(0xff84bb6f),
          ),
          if (_isFoodWasteSelected)
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Atık miktarı seçin (kg)'),
                ),
                Slider(
                  value: _foodWasteAmount,
                  activeColor: Color(0xff7cc2d8),
                  inactiveColor: Colors.black,
                  divisions: 50,
                  max: 50,
                  min: 0,
                  label: _foodWasteAmount.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _foodWasteAmount = value;
                    });
                  },
                ),
              ],
            ),
          SwitchListTile(
            title: Text('Yağ Atığı'),
            value: _isOilWasteSelected,
            onChanged: (bool value) {
              setState(() {
                _isOilWasteSelected = value;
              });
            },
            activeColor: Color(0xff84bb6f),
          ),
          if (_isOilWasteSelected)
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Atık miktarı seçin (L)'),
                ),
                Slider(
                  value: _oilWasteAmount,
                  activeColor: Color(0xff7cc2d8),
                  inactiveColor: Colors.black,
                  divisions: 50,
                  max: 50,
                  min: 0,
                  label: _oilWasteAmount.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _oilWasteAmount = value;
                    });
                  },
                ),
              ],
            ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_isFoodWasteSelected) {
                Map<String, dynamic> foodWaste = {
                  'Tarih': '20.06.2024',
                  'Atık Türü': 'Gıda',
                  'Miktar': _foodWasteAmount.toString() + ' kg',
                  'Durumu': 'İletildi'
                };
                widget.selectedWastes.add(foodWaste);
                _saveWasteToFirestore(foodWaste);
              }
              if (_isOilWasteSelected) {
                Map<String, dynamic> oilWaste = {
                  'Tarih': '10.06.2024',
                  'Atık Türü': 'Yağ',
                  'Miktar': _oilWasteAmount.toString() + ' L',
                  'Durumu': 'İletildi'
                };
                widget.selectedWastes.add(oilWaste);
                _saveWasteToFirestore(oilWaste);
              }
              widget.onWastesUpdated(widget.selectedWastes);

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Atık bilgileri gönderildi!'),
                  duration: Duration(seconds: 2),
                  action: SnackBarAction(
                    label: 'Kapat',
                    onPressed: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    },
                  ),
                ),
              );
            },
            child: Text('GÖNDER'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff7cc2d8),
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
