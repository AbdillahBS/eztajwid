import 'package:eztajwid/model/dtmateri.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailMateri extends StatelessWidget {
  final DataMateri data;
  const DetailMateri({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        title: Text(data.nama, style: GoogleFonts.amiri()),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Text(data.nama,style: TextStyle(
          //   fontSize: 30,
          //   fontWeight: FontWeight.bold,
          // ),textAlign: TextAlign.center,),
          Card(
            elevation: 5.0,
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Text(data.jdl,style: TextStyle(
                  //   fontSize: 18,
                  //   fontWeight: FontWeight.bold,
                  // ),),
                  const SizedBox(height: 10),
                  Text(
                    data.deskripsi,
                    style: GoogleFonts.lateef(
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
