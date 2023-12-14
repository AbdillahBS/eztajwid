import 'package:eztajwid/model/dtmateri.dart';
import 'package:eztajwid/views/detailmateri.dart';
import 'package:flutter/material.dart';

class Materi extends StatelessWidget {
  const Materi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 60,
        title: Container(
          child: const Row(
            children: [
              SizedBox(width: 100),
              Text(
                "Daftar Materi",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ]),
        child: ListView.builder(
          itemCount: dt.length,
          itemBuilder: (context, index) {
            final DataMateri data = dt[index];
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return DetailMateri(data: data);
                  },
                ));
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 181, 186, 223),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          Text(
                            data.nama,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                            maxLines: 2,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
