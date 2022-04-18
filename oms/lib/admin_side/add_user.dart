import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_audio_record/helper_methods/ip.dart';
import 'package:flutter_audio_record/widgets/app_bar.dart';
import 'package:flutter_audio_record/widgets/drawer.dart';
import 'package:flutter_audio_record/widgets/text_fields.dart';

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  TextEditingController name = TextEditingController();
  TextEditingController cnic = TextEditingController();
  TextEditingController pwd = TextEditingController();
  TextEditingController phno = TextEditingController();

  File? image;

  int radioValue = 1;

  imgFromCamera() async {
    var img = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 50);

    setState(() {
      image = File(img!.path);
    });
  }

  imgFromGallery() async {
    var img = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 50);
    setState(() {
      image = File(img!.path);
    });
  }

  handleRadioValueChange(int value) {
    setState(() {
      radioValue = value;
    });
    print(value);
  }

  addUser(dsg) async {
    try {
      String uploadUrl = ('http://' +
              IP.ip +
              '/obms/api/obms/addUser?name=' +
              name.text +
              '&cnic=' +
              cnic.text +
              '&pwd=' +
              pwd.text +
              '&phno=' +
              phno.text +
              '&dsg=' +
              dsg)
          .toString();
      Dio dio = Dio();
      var formData = FormData.fromMap(
          {'file': await MultipartFile.fromFile(image!.path.toString())});
      var response = await dio.post(uploadUrl, data: formData);
      var res = jsonDecode(response.toString());
      print(res);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar("Add User"),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/mainback.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(10),
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                image == null
                    ? GestureDetector(
                        onTap: () {
                          showPicker(context);
                        },
                        child: const Icon(
                          Icons.camera,
                          size: 50,
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.file(
                          image!,
                          width: 100,
                          height: 100,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                TextButton(
                  onPressed: () {
                    showPicker(context);
                  },
                  child: const Text("Upload Image"),
                ),
                textfield("Name", name, Icons.person, context),
                textfield("CNIC", cnic, Icons.credit_card_outlined, context),
                textfield("Password", pwd, Icons.vpn_key_outlined, context),
                textfield("Phone Number", phno, Icons.phone, context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text("Designation : "),
                    Row(
                      children: [
                        Radio(
                            value: 2,
                            groupValue: radioValue,
                            onChanged: (value) {
                              setState(() {
                                handleRadioValueChange(2);
                              });
                            }),
                        const Text(
                          'Office Boy',
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: 1,
                            groupValue: radioValue,
                            onChanged: (value) {
                              setState(() {
                                handleRadioValueChange(1);
                              });
                            }),
                        const Text(
                          'Teacher',
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    addUser(radioValue==1?"teacher":"officeBoy");
                  },
                  child: const Text("Add User"),
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: adminDrawer(context),
    );
  }

  void showPicker(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Photo Library'),
                  onTap: () {
                    imgFromGallery();
                    Navigator.of(context).pop();
                  }),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  imgFromCamera();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
