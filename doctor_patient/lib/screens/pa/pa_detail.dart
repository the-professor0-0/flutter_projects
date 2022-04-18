import 'package:dollar/widgets/app_bar.dart';
import 'package:dollar/widgets/cards.dart';
import 'package:flutter/material.dart';

class PaDetail extends StatefulWidget {
  const PaDetail({Key? key}) : super(key: key);

  @override
  _PaDetailState createState() => _PaDetailState();
}

class _PaDetailState extends State<PaDetail> {
  List names = ['kinza', 'areej', 'rabia', 'shaista'];
  List contact = ['0123', '0123', '0123', '0123'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar3("Assistant"),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: names.length,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return paCard(names[index],contact[index],context);
          },
        ),
      ),
    );
  }
}
