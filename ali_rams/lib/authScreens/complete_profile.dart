import 'dart:io';
import 'package:ali_rams/widgets/buttons.dart';
import 'package:ali_rams/widgets/constants.dart';
import 'package:ali_rams/widgets/textfields.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileComplete extends StatefulWidget {
  const ProfileComplete({Key? key}) : super(key: key);

  @override
  _ProfileCompleteState createState() => _ProfileCompleteState();
}

class _ProfileCompleteState extends State<ProfileComplete> {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController address = TextEditingController();

  File? image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickImage != null) {
        image = File(pickImage.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Constant.blueColor,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage('assets/logox.png'),
                  width: 150,
                ),
                const SizedBox(
                  height: 30,
                ),
                loginTextfield(
                    "First Name", firstname, Icons.person, context, false),
                loginTextfield(
                    "Last Name", lastname, Icons.vpn_key, context, false),
                loginTextfield(
                    "Address", lastname, Icons.vpn_key, context, false),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        getImage();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: MediaQuery.of(context).size.width / 3 + 10,
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 10),
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Constant.orangeColor,
                              Constant.orange2Color,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Upload Front".toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 12),
                            ),
                            const Image(
                              image: AssetImage('assets/card.png'),
                              width: 50,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        getImage();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: MediaQuery.of(context).size.width / 3 + 10,
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 10),
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Constant.orangeColor,
                              Constant.orange2Color,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Upload Back".toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 12),
                            ),
                            const Image(
                              image: AssetImage('assets/card.png'),
                              width: 50,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                submitButton("SUBMIT", context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
