import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eztajwid/model/dtsholat.dart';
import 'package:eztajwid/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, dynamic>> quotes = [];

  @override
  void initState() {
    super.initState();
    fetchQuotes();
  }

  Future<void> fetchQuotes() async {
    try {
      final quotesQuery = FirebaseFirestore.instance.collection('quotes');
      final querySnapshot = await quotesQuery.get();
      final fetchedQuotes = querySnapshot.docs.map((doc) {
        return doc.data();
      }).toList();
      setState(() {
        quotes = fetchedQuotes;
      });
    } catch (e) {
      // Handle potential errors (print, show an error message, etc.)
      print('Error fetching quotes: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/bg.png"), fit: BoxFit.cover)),
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      "assets/images/logoezl.png",
                      height: 30,
                    )),
                const Text(
                  "EzLearning Tajwid",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 78, 203),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              height: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                    image: AssetImage("assets/images/masjid1.png"),
                    fit: BoxFit.cover),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ListTile(
                    title: Text(
                      tgl(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white.withOpacity(0.7),
                    ),
                    child: Column(
                      children: [
                        Text(
                          waktu(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 26),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(15),
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: slt.length,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 4 / 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  final sholat prayer = slt[index];
                  return Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            prayer.text1,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                prayer.text2,
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              CircleAvatar(
                                  radius: 25,
                                  backgroundColor:
                                      Color.fromARGB(255, 169, 215, 253),
                                  child: SvgPicture.asset(
                                    prayer.url,
                                    color: prayer.warna,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            //kotak materi
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Quotes",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 78, 203),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 200,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: quotes.length + 1,
                      itemBuilder: (BuildContext context, int index) {
                        var number = quotes.length + 1;
                        if (index == quotes.length) {
                          return Container(
                            margin: const EdgeInsets.only(right: 20),
                            padding: const EdgeInsets.all(20),
                            width: 300,
                            height: 220,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white.withOpacity(0.6),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text("Quotes"),
                                              TextFormField(
                                                decoration: InputDecoration(
                                                  labelText: 'Teks Arab',
                                                ),
                                                onChanged: (String arb) {
                                                  getarb(arb);
                                                },
                                              ),
                                              TextFormField(
                                                decoration: InputDecoration(
                                                  labelText: 'Teks Terjemahan',
                                                ),
                                                onChanged: (String terjemah) {
                                                  getterjemah(terjemah);
                                                },
                                              ),
                                              SizedBox(height: 10),
                                              ElevatedButton(
                                                onPressed: () {
                                                  create(
                                                      context); // Panggil fungsi create() saat tombol ditekan
                                                },
                                                child: Text('Simpan'),
                                              ),
                                            ],
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text('Tutup'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    size: 28,
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          // final materi = materiList[index];
                          return Container(
                            margin: const EdgeInsets.only(right: 20),
                            padding: const EdgeInsets.all(20),
                            width: 200,
                            // height: 220,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white.withOpacity(0.6),
                            ),
                            child: ListView(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  quotes[index]['text1'],
                                  style: GoogleFonts.lateef(
                                    textStyle: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                ),
                                const SizedBox(height: 10),
                                Expanded(
                                  child: Text(
                                    " \" " + quotes[index]['text2'] + " \" ",
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                    ),
                                    maxLines: 4,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  var id, arab, terjemahan;

  void getarb(String arb) {
    this.arab = arb;
  }

  void getterjemah(String terjemah) {
    this.terjemahan = terjemah;
  }

  void create(BuildContext context) {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("quotes").doc(id);

    documentReference.set({"text1": arab, "text2": terjemahan}).then((value) {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Quotes Tersimpan"),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Navbar()),
                      (route) => false);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    });
  }
}
