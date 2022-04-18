import 'package:flutter/material.dart';
import 'package:flutter_audio_record/helper_methods/ip.dart';
import 'package:flutter_audio_record/helper_methods/teacher_methods.dart';
import 'package:flutter_audio_record/widgets/app_bar.dart';


import '../constants.dart';

class ComplainMessage extends StatefulWidget {
  ComplainMessage({Key? key}) : super(key: key);

  var snap;

  ComplainMessage.set(this.snap);

  @override
  _ComplainMessageState createState() => _ComplainMessageState();
}

class _ComplainMessageState extends State<ComplainMessage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar("Message"),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/mainback.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    ('http://' + IP.ip + '/obms/files/' + widget.snap['img'])
                        .toString(),
                  ),
                  radius: 50,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.snap['name'].toString().toUpperCase(),
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  widget.snap['phno'].toString().toUpperCase(),
                  style: const TextStyle(fontSize: 18),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: TextFormField(
                    controller: controller,
                    cursorColor: Constant.blackColor,
                    style: TextStyle(
                      color: Constant.blackColor,
                      fontWeight: FontWeight.w400,
                    ),
                    minLines: 8,
                    maxLines: 10,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.comment,
                        color: Constant.blackColor,
                        size: 20,
                      ),
                      labelStyle: TextStyle(color: Constant.blackColor),
                      contentPadding: const EdgeInsets.all(10),
                      labelText: "Message",
                      fillColor: const Color(0xff548fbb),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1.5),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.5),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    addComplain(widget.snap['id'], controller.text);
                  },
                  child: const Text("Submit Application"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
