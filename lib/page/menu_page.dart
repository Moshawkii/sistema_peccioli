// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'home_page.dart';

class menuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 3, // Number of columns
          children: List.generate(14, (index) {
            if (index == 12) {
              return GridTile(
                child: gridViewCell(
                  icon: iconsList[index],
                  label: labelList[index],
                ),
              );
            } else {
              return GridTile(
                child: gridViewCell(
                  icon: iconsList[index],
                  label: labelList[index],
                ),
              );
            }
          }),
        ),
      ),
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.red.shade300,
        title: Text("Sistema Peccioli"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          },
          icon: Icon(
            Icons.clear_outlined,
          ),
          iconSize: 30,
        ),
      ),
    );
  }

  List<String> labelList = [
    "Home",
    "Novità",
    "Eventi",
    "Turismo",
    "Attività",
    "Macca",
    "Segnalazioni",
    "Servizi On-line",
    "Scuola",
    "Ingombranti",
    "Il Comune",
    "Associazioni",
    "Galleria",
    "Area Riservata",
  ];

  List<IconData> iconsList = [
    Icons.home_outlined,
    Icons.campaign_sharp,
    Icons.event_available_outlined,
    Icons.work_outlined,
    Icons.piano_outlined,
    Icons.color_lens_sharp,
    Icons.warning_amber,
    Icons.mouse_outlined,
    Icons.auto_stories_sharp,
    Icons.recycling_outlined,
    Icons.account_balance,
    Icons.pages_outlined,
    Icons.camera_alt_rounded,
    Icons.lock_outline,
  ];
  Widget gridViewCell({String? label, IconData? icon}) {
    return Container(
      width: 150,
      height: 150,
      color: Colors.white,
      margin: EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(icon ?? Icons.star, size: 50, color: Colors.red.shade200),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(label ?? "",
                style: TextStyle(
                    letterSpacing: 1,
                    fontFamily: "Rubik",
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }
}
