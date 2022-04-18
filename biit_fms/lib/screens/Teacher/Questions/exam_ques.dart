import 'dart:io';

import 'package:biit_fms/constants/constants.dart';
import 'package:biit_fms/helperMethods/get_methods.dart';
import 'package:biit_fms/widgets/alert_show.dart';
import 'package:biit_fms/widgets/card.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ExamQues extends StatefulWidget {
  ExamQues({Key? key}) : super(key: key);

  var snap;

  ExamQues.set(this.snap);

  @override
  State<ExamQues> createState() => _ExamQuesState();
}

class _ExamQuesState extends State<ExamQues> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        ExpansionTile(
          title: const Text("Mid Exam"),
          leading: IconButton(
            onPressed: () {
              showAlertIngredient(context, widget.snap, 'mid');
            },
            icon: const Icon(Icons.info_outline),
          ),
          children: [
            FutureBuilder(
                future: getFiles(widget.snap['aid'], '5'),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  try {
                    var snap = snapshot.data;
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {}
                    return snap.toString() != '[]' && findname(snap, 'Mid')
                        ? Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    downloadFile(snap[getIndex(snap, 'Mid')]
                                    ['FILENAME']
                                        .toString());
                                  },
                                  child:Text(snap[getIndex(snap, 'Mid')]
                                  ['FILENAME']
                                      .toString(),
                                    style: const TextStyle(
                                      decoration:
                                      TextDecoration.underline,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  color: Colors.red,
                                  onPressed: () async {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          content: Row(
                                            children: const [
                                              CircularProgressIndicator(),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text("Processing"),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                    await deleteFile(
                                        snap[getIndex(snap, 'Mid')]['AID'], 5);
                                    Navigator.pop(context);
                                    setState(() {});
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                  ),
                                )
                              ],
                            ),
                          )
                        : ElevatedButton(
                            onPressed: () async {
                              FilePickerResult? result =
                                  await FilePicker.platform.pickFiles(
                                type: FileType.custom,
                                allowedExtensions: ['pdf', 'doc'],
                              );
                              PlatformFile? file = result!.files.first;
                              File uploader = File(file.path!);
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    content: Row(
                                      children: const [
                                        CircularProgressIndicator(),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text("Processing"),
                                      ],
                                    ),
                                  );
                                },
                              );
                              await uploadFile(uploader, "Mid Exam Question",
                                  '5', widget.snap['aid'].toString());
                              Navigator.pop(context);
                              setState(() {});
                            },
                            child: const Text('Upload File'),
                          );
                  } catch (e) {
                    return const Center(
                      child: Text(
                        "Connection Error...\nPlease check your Internet connection...",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    );
                  }
                }),
          ],
        ),
        ExpansionTile(
          title: const Text("Final Exam"),
          leading: IconButton(
            onPressed: () {
              showAlertIngredient(context, widget.snap, 'final');
            },
            icon: const Icon(Icons.info_outline),
          ),
          children: [
            FutureBuilder(
              future: getFiles(widget.snap['aid'], '5'),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                try {
                  var snap = snapshot.data;
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {}
                  return snap.toString() != '[]' && findname(snap, 'Final')
                      ? Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  downloadFile(snap[getIndex(snap, 'Final')]
                                  ['FILENAME']
                                      .toString());
                                },
                                child:Text(snap[getIndex(snap, 'Final')]
                                ['FILENAME']
                                    .toString(),
                                  style: const TextStyle(
                                    decoration:
                                    TextDecoration.underline,
                                  ),
                                ),
                              ),
                              IconButton(
                                color: Colors.red,
                                onPressed: () async {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        content: Row(
                                          children: const [
                                            CircularProgressIndicator(),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text("Processing"),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                  await deleteFile(
                                      snap[getIndex(snap, 'Final')]['AID'], 5);
                                  Navigator.pop(context);
                                  setState(() {});
                                },
                                icon: const Icon(
                                  Icons.delete,
                                ),
                              )
                            ],
                          ),
                        )
                      : ElevatedButton(
                          onPressed: () async {
                            FilePickerResult? result =
                                await FilePicker.platform.pickFiles(
                              type: FileType.custom,
                              allowedExtensions: ['pdf', 'doc'],
                            );
                            PlatformFile? file = result!.files.first;
                            File uploader = File(file.path!);
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: Row(
                                    children: const [
                                      CircularProgressIndicator(),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("Processing"),
                                    ],
                                  ),
                                );
                              },
                            );
                            await uploadFile(uploader, "Final Exam Question",
                                '5', widget.snap['aid'].toString());
                            Navigator.pop(context);
                            setState(() {});
                          },
                          child: const Text('Upload File'),
                        );
                } catch (e) {
                  return const Center(
                    child: Text(
                      "Connection Error...\nPlease check your Internet connection...",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ],
    ));
  }
}
