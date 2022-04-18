import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as GET;
import 'package:image_picker/image_picker.dart';
import 'package:intermittent_fasting/authMethods/ip.dart';
import 'package:intermittent_fasting/screens/user/add_ingredient.dart';
import 'package:intermittent_fasting/widgets/appbar.dart';
import 'package:intermittent_fasting/widgets/drawer.dart';
import 'package:intermittent_fasting/widgets/textfields.dart';

class AddItem extends StatefulWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  TextEditingController name = TextEditingController();
  TextEditingController calories = TextEditingController();

  var chosenValue = "Fast Food";

  File? image;
  final picker = ImagePicker();

  imgFromGallery() async {
    final img = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (img != null) {
        image = File(img.path);
      }
    });
  }

  addItem() async {
    try {
      String uploadUrl = ('http://' +
              IP.ip +
              '/ifasting/api/ifasting/additem?name=' +
              name.text +
              '&category=' +
              chosenValue.toString() +
              '&calories=' +
              calories.text)
          .toString();
      Dio dio = Dio();
      var formData = FormData.fromMap(
          {'file': await MultipartFile.fromFile(image!.path.toString())});
      var response = await dio.post(uploadUrl, data: formData);
      var res = jsonDecode(response.toString());
      if (res.toString() != 'null') {
        GET.Get.to(AddIngredient.set(res['id']));
      }
    } catch (e) {
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar("Add Item"),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Category'),
                  DropdownButton<String>(
                    value: chosenValue,
                    iconEnabledColor: Colors.black,
                    items: <String>['Fast Food', 'Fruits', 'Dishes']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        chosenValue = value!;
                      });
                    },
                  ),
                ],
              ),
              textField("Item Name", name, context, false),
              textField("Calories", calories, context, false),
              image.toString() != 'null'
                  ? Image.file(
                      image!,
                      width: 100,
                    )
                  : Container(),
              ElevatedButton(
                onPressed: () {
                  imgFromGallery();
                },
                child: const Text("Upload Image"),
              ),
              ElevatedButton(
                onPressed: () {
                  addItem();
                },
                child: const Text("Add Item"),
              )
            ],
          ),
        ),
      ),
      drawer: userDrawer(context),
    );
  }
}
