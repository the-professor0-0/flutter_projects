import 'dart:io';

import 'package:biit_fms/constants/constants.dart';
import 'package:biit_fms/helperMethods/get_methods.dart';
import 'package:biit_fms/widgets/alert_show.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ExamSol extends StatefulWidget {
  ExamSol({Key? key}) : super(key: key);

  var snap;

  ExamSol.set(this.snap);

  @override
  State<ExamSol> createState() => _ExamSolState();
}

class _ExamSolState extends State<ExamSol> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        ExpansionTile(
          title: const Text('Mid'),
          leading: IconButton(
            onPressed: () {
              showAlertIngredient(context, widget.snap, 'mid');
            },
            icon: const Icon(Icons.info_outline),
          ),
          children: [
            FutureBuilder(
              future: getFiles(widget.snap['aid'], '6'),
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
                                  downloadFile(
                                      snap[getIndex(snap, 'Mid')]
                                      ['FILENAME']
                                          .toString());
                                },
                                child: Text(
                                  snap[getIndex(snap, 'Mid')]
                                  ['FILENAME']
                                      .toString(),
                                  style: const TextStyle(
                                    decoration: TextDecoration.underline,
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
                                      snap[getIndex(snap, 'Mid')]['AID'], 6);
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
                            await uploadFile(uploader, "Mid Solution", '6',
                                widget.snap['aid'].toString());
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
        ExpansionTile(
          title: const Text('Finals'),
          leading: IconButton(
            onPressed: () {
              showAlertIngredient(context, widget.snap, 'final');
            },
            icon: const Icon(Icons.info_outline),
          ),
          children: [
            FutureBuilder(
              future: getFiles(widget.snap['aid'], '6'),
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
                                  downloadFile(
                                      snap[getIndex(snap, 'Final')]
                                      ['FILENAME']
                                          .toString());
                                },
                                child: Text(
                                  snap[getIndex(snap, 'Final')]
                                  ['FILENAME']
                                      .toString(),
                                  style: const TextStyle(
                                    decoration: TextDecoration.underline,
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
                                      snap[getIndex(snap, 'Final')]['AID'], 6);
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
                            await uploadFile(uploader, "Final Solution", '6',
                                widget.snap['aid'].toString());
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
