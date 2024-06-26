import 'package:flutter/material.dart';
import 'AnaSayfa.dart';

void main() {
  runApp(Login());
}

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GirisEkrani(),
      title: 'Uygulama Adı',
    );
  }
}

class GirisEkrani extends StatefulWidget {
  @override
  State<GirisEkrani> createState() => _GirisEkraniState();
}

class _GirisEkraniState extends State<GirisEkrani> {
  String ad = '';
  String mail = '';
  String no = '';
  String sehir = '';
  String ilce = '';
  String mahalle = '';
  String sokak = '';
  String? _selectedUser = 'Bireysel'; // Varsayılan olarak Bireysel seçili
  bool _isDropdownError = false;

  final _formKey = GlobalKey<FormState>();

  TextEditingController adController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController noController = TextEditingController();
  TextEditingController sehirController = TextEditingController();
  TextEditingController ilceController = TextEditingController();
  TextEditingController mahalleController = TextEditingController();
  TextEditingController sokakController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        shadowColor: Colors.black,
        titleSpacing: 25,
        backgroundColor: Color(0xff7cc2d8),
        title: Text(
          'UYGULAMA ADI',
          style: TextStyle(
              color: Colors.white, fontSize: 32, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              verticalDirection: VerticalDirection.down,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Lütfen kullanıcı türü seçiniz:',
                        style: TextStyle(
                            fontSize: 18
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    DropdownButton<String>(
                      value: _selectedUser,
                      onChanged: (_user) {
                        setState(() {
                          _selectedUser = _user;
                          _isDropdownError = false;
                        });
                      },
                      items: [
                        DropdownMenuItem(child: Text("Bireysel"), value: 'Bireysel'),
                        DropdownMenuItem(child: Text("Kurumsal"), value: 'Kurumsal'),
                      ],
                      hint: Text("Seçiniz"),
                    ),
                  ],
                ),
                if (_isDropdownError)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Lütfen kullanıcı türü seçiniz',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                if (_selectedUser == 'Bireysel') ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: TextFormField(
                      onChanged: (_ad) {
                        setState(() {
                          ad = _ad;
                        });
                      },
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        hintText: 'Adınızı ve soyadınızı giriniz.',
                        labelText: 'Adınız ve Soyadınız',
                        icon: Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                      ),
                      controller: adController,
                      onTap: () {
                        print('Text editing\'e basıldı.');
                      },
                      onEditingComplete: () {
                        print("Text edit bitti!");
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Adınızı ve soyadınızı giriniz';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: TextFormField(
                      onChanged: (_mail) {
                        setState(() {
                          mail = _mail;
                        });
                      },
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        hintText: 'Email giriniz',
                        labelText: 'Email',
                        icon: Icon(
                          Icons.email,
                          color: Colors.black,
                        ),
                      ),
                      controller: mailController,
                      onTap: () {
                        print('Text editing\'e basıldı.');
                      },
                      onEditingComplete: () {
                        print("Text edit bitti!");
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Lütfen email giriniz';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      onChanged: (_no) {
                        setState(() {
                          no = _no;
                        });
                      },
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        hintText: 'Telefon numarası giriniz',
                        labelText: 'Telefon Numarası',
                        icon: Icon(
                          Icons.phone,
                          color: Colors.black,
                        ),
                      ),
                      controller: noController,
                      onTap: () {
                        print('Text editing\'e basıldı.');
                      },
                      onEditingComplete: () {
                        print("Text edit bitti!");
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Lütfen telefon numarası giriniz';
                        }
                        return null;
                      },
                    ),
                  ),
                ] else if (_selectedUser == 'Kurumsal') ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: TextFormField(
                      onChanged: (_ad) {
                        setState(() {
                          ad = _ad;
                        });
                      },
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        hintText: 'Kurum adı giriniz.',
                        labelText: 'Kurum Adı',
                        icon: Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                      ),
                      controller: adController,
                      onTap: () {
                        print('Text editing\'e basıldı.');
                      },
                      onEditingComplete: () {
                        print("Text edit bitti!");
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Lütfen kurum adı giriniz';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: TextFormField(
                      onChanged: (_mail) {
                        setState(() {
                          mail = _mail;
                        });
                      },
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        hintText: 'Email giriniz',
                        labelText: 'Email',
                        icon: Icon(
                          Icons.email,
                          color: Colors.black,
                        ),
                      ),
                      controller: mailController,
                      onTap: () {
                        print('Text editing\'e basıldı.');
                      },
                      onEditingComplete: () {
                        print("Text edit bitti!");
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Lütfen email giriniz';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      onChanged: (_no) {
                        setState(() {
                          no = _no;
                        });
                      },
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        hintText: 'Kurum telefon numarası giriniz',
                        labelText: 'Kurum İletişim Numarası',
                        icon: Icon(
                          Icons.phone,
                          color: Colors.black,
                        ),
                      ),
                      controller: noController,
                      onTap: () {
                        print('Text editing\'e basıldı.');
                      },
                      onEditingComplete: () {
                        print("Text edit bitti!");
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Lütfen kurum telefon numarası giriniz';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: TextFormField(
                    onChanged: (_sehir) {
                      setState(() {
                        sehir = _sehir;
                      });
                    },
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      hintText: 'Şehir seçiniz',
                      labelText: 'Şehir',
                      icon: Icon(
                        Icons.location_on,
                        color: Colors.black,
                      ),
                    ),
                    controller: sehirController,
                    onTap: () {
                      print('Text editing\'e basıldı.');
                    },
                    onEditingComplete: () {
                      print("Text edit bitti!");
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Lütfen şehir giriniz';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: TextFormField(
                    onChanged: (_ilce) {
                      setState(() {
                        ilce = _ilce;
                      });
                    },
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      hintText: 'İlçe giriniz',
                      labelText: 'İlçe',
                      icon: Icon(
                        Icons.location_city,
                        color: Colors.black,
                      ),
                    ),
                    controller: ilceController,
                    onTap: () {
                      print('Text editing\'e basıldı.');
                    },
                    onEditingComplete: () {
                      print("Text edit bitti!");
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Lütfen ilçe giriniz';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: TextFormField(
                    onChanged: (_mahalle) {
                      setState(() {
                        mahalle = _mahalle;
                      });
                    },
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      hintText: 'Mahalle giriniz',
                      labelText: 'Mahalle',
                      icon: Icon(
                        Icons.location_city,
                        color: Colors.black,
                      ),
                    ),
                    controller: mahalleController,
                    onTap: () {
                      print('Text editing\'e basıldı.');
                    },
                    onEditingComplete: () {
                      print("Text edit bitti!");
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Lütfen mahalle giriniz';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: TextFormField(
                    onChanged: (_sokak) {
                      setState(() {
                        sokak = _sokak;
                      });
                    },
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      hintText: 'Sokak giriniz',
                      labelText: 'Sokak',
                      icon: Icon(
                        Icons.location_city,
                        color: Colors.black,
                      ),
                    ),
                    controller: sokakController,
                    onTap: () {
                      print('Text editing\'e basıldı.');
                    },
                    onEditingComplete: () {
                      print("Text edit bitti!");
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Lütfen sokak giriniz';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isDropdownError = _selectedUser == null;
                    });
                    if (_formKey.currentState?.validate() ?? false && !_isDropdownError) {
                      Route bitisSayfasinaGec = MaterialPageRoute(
                        builder: (context) => AnaSayfa(
                          ad: adController.text,
                          mail: mailController.text,
                          no: noController.text,
                          sehir: sehirController.text,
                          ilce: ilceController.text,
                          mahalle: mahalleController.text,
                          sokak: sokakController.text, pass: '',
                        ),
                      );
                      Navigator.push(context, bitisSayfasinaGec);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFA2CB91),
                  ),
                  child: Text('Giriş yap',
                    style: TextStyle(
                        color: Colors.white),
                  ),
                ),],
            ),
          ),
        ),
      ),
    );
  }
}
