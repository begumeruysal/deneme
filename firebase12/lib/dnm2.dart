import 'package:flutter/material.dart';


class WasteSelectionAndResultsPage extends StatefulWidget {
  @override
  _WasteSelectionAndResultsPageState createState() =>
      _WasteSelectionAndResultsPageState();
}

class _WasteSelectionAndResultsPageState extends State<WasteSelectionAndResultsPage> {
  bool _isFoodWasteSelected = false;
  double _foodWasteAmount = 0;

  bool _isOilWasteSelected = false;
  double _oilWasteAmount = 0;

  List<Map<String, dynamic>> _selectedWastes = [];

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
                  activeColor: Colors.orangeAccent,
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
              setState(() {
                _selectedWastes.clear();
                if (_isFoodWasteSelected) {
                  _selectedWastes.add({
                    'Tarih': '20.06.2024',
                    'Atık Türü': 'Gıda',
                    'Miktar': _foodWasteAmount.toString() + ' kg',
                    'Durumu': 'İletildi'
                  });
                }
                if (_isOilWasteSelected) {
                  _selectedWastes.add({
                    'Tarih': '10.06.2024',
                    'Atık Türü': 'Yağ',
                    'Miktar': _oilWasteAmount.toString() + ' L',
                    'Durumu': 'Alındı'
                  });
                }
              });
            },
            child: Text('GÖNDER'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff7cc2d8),
              foregroundColor: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          if (_selectedWastes.isNotEmpty)
            Expanded(
              child: ListView(
                children: [
                  Text(
                    'Atık Takibi Sonuçları',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  DataTable(
                    columns: [
                      DataColumn(label: Text('Tarih')),
                      DataColumn(label: Text('Atık Türü')),
                      DataColumn(label: Text('Miktar')),
                      DataColumn(label: Text('Durumu')),
                    ],
                    rows: _selectedWastes
                        .map(
                          (waste) => DataRow(cells: [
                        DataCell(Text(waste['Tarih'])),
                        DataCell(Text(waste['Atık Türü'])),
                        DataCell(Text(waste['Miktar'])),
                        DataCell(Text(waste['Durumu'])),
                      ]),
                    )
                        .toList(),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  final String pass;
  final String ad;
  final String mail;
  final String no;
  final String sehir;
  final String ilce;
  final String mahalle;
  final String sokak;

  ProfilePage({
    required this.pass,
    required this.ad,
    required this.mail,
    required this.no,
    required this.sehir,
    required this.ilce,
    required this.mahalle,
    required this.sokak,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff7cc2d8),
        title: Text('Profilim'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Ad: $ad'),
            Text('Email: $mail'),
            Text('Telefon: $no'),
            Text('Şehir: $sehir'),
            Text('İlçe: $ilce'),
            Text('Mahalle: $mahalle'),
            Text('Sokak: $sokak'),
          ],
        ),
      ),
    );
  }
}

class BadgesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff7cc2d8),
        title: Text('Rozetler'),
      ),
      body: Center(
        child: Text('Rozetler sayfası'),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff7cc2d8),
        title: Text('Ayarlar'),
      ),
      body: Center(
        child: Text('Ayarlar sayfası'),
      ),
    );
  }
}

class HelpCenterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff7cc2d8),
        title: Text('Yardım Merkezi'),
      ),
      body: Center(
        child: Text('Yardım Merkezi sayfası'),
      ),
    );
  }
}
