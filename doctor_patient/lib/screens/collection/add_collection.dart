import 'package:dollar/widgets/buttons.dart';
import 'package:dollar/widgets/text_fields.dart';
import 'package:flutter/material.dart';

class AddCollection extends StatefulWidget {
  const AddCollection({Key? key}) : super(key: key);

  @override
  _AddCollectionState createState() => _AddCollectionState();
}

class _AddCollectionState extends State<AddCollection> {

  TextEditingController letter=TextEditingController();
  TextEditingController words=TextEditingController();
  TextEditingController Image=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center (child: Text("Add Collections")),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 25),
        child: Column(
          children: [
            registerTextField(letter, "Letter"),
            registerTextField(words, "Words"),
            registerTextField(Image, "Image"),
            const SizedBox(height: 10,),
            addButton(context),
          ],
        ),
      ),
    );
  }
}
