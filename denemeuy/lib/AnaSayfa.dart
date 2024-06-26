import 'package:flutter/material.dart';
import 'atıkListe.dart';
import 'atıkSec.dart';
import 'ayarlar.dart';
import 'profile.dart';
import 'login.dart';
import 'help.dart';
import 'rozet.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GirisEkrani(),
      title: 'Uygulama Adı',
    );
  }
}

class AnaSayfa extends StatefulWidget {
  final String pass;
  final String ad;
  final String mail;
  final String no;
  final String sehir;
  final String ilce;
  final String mahalle;
  final String sokak;

  AnaSayfa({
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
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  int _selectedIndex = 0;
  List<Map<String, dynamic>> _selectedWastes = [];

  late List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      ListView(
        children: [
          buildSection('BAŞLIK 1', 'Si osculantur puer tuus aut uxorem tuam, osculum, non dico quod omnia sdnc klnvcjd llvjd sdvhn lksvıo lfjvbdf shvofdn osvhsodı ısohvsfı ıosdv.'),
          buildSection('BAŞLIK 2', 'Si osculantur puer tuus aut uxorem tuam, osculum, non dico quod omnia kscn knvcjksdb lksvncdfj lvndfjk klnscvkjc klsbvjsdf kldsvnsdjk lnvljkdnv.'),
          buildSection('BAŞLIK 3', 'Si osculantur puer tuus aut uxorem tuam, osculum, non dico quod omnia jscb jkbsj kshvuf fbjfv usdygcs blfnd usgcyu oıvf uagudcıds fvn sdhc lfdl usdhuc ıodvhn ııdsvuı jdskbv.'),
          buildSection('BAŞLIK 4', 'Si osculantur puer tuus aut uxorem tuam, osculum, non dico quod omnia jscb jkbsj kshvuf fbjfv usdygcs blfnd usgcyu oıvf uagudcıds fvn sdhc lfdl usdhuc ıodvhn ııdsvuı jdskbv.'),
          buildSection('BAŞLIK 5', 'Si osculantur puer tuus aut uxorem tuam, osculum, non dico quod omnia jscb jkbsj kshvuf fbjfv usdygcs blfnd usgcyu oıvf uagudcıds fvn sdhc lfdl usdhuc ıodvhn ııdsvuı jdskbv.'),
          buildSection('BAŞLIK 6', 'Si osculantur puer tuus aut uxorem tuam, osculum, non dico quod omnia jscb jkbsj kshvuf fbjfv usdygcs blfnd usgcyu oıvf uagudcıds fvn sdhc lfdl usdhuc ıodvhn ııdsvuı jdskbv.'),
        ],
      ),
      WasteSelectionPage(),
      WasteTrackingResultsPage(selectedWastes: _selectedWastes),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget buildSection(String heading, String content) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 8),
          Text(content),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff7cc2d8),
        title: Text('UYGULAMA ADI'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xff7cc2d8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/logo.png'),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Menü',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('PROFİL'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(
                      pass: widget.pass,
                      ad: widget.ad,
                      mail: widget.mail,
                      no: widget.no,
                      sehir: widget.sehir,
                      ilce: widget.ilce,
                      mahalle: widget.mahalle,
                      sokak: widget.sokak,
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('ROZETLER'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BadgesPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('AYARLAR'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('ÇIKIŞ'),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => GirisEkrani()),
                      (Route<dynamic> route) => true,
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('YARDIM MERKEZİ'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HelpCenterPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Ana Ekran',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.send),
            label: 'Gönderi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.delete),
            label: 'Atık Takibi',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF84bb6f),
        onTap: _onItemTapped,
      ),
    );
  }
}




