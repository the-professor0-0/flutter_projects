import 'dart:io';

import 'package:biit_fms/constants/constants.dart';
import 'package:biit_fms/helperMethods/get_methods.dart';
import 'package:biit_fms/screens/Teacher/Questions/ques_tab_bar.dart';
import 'package:biit_fms/screens/Teacher/Samples/bwa_tab_bar.dart';
import 'package:biit_fms/screens/Teacher/Solution/sol_tab_bar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../tabular_clo.dart';

class SubFolder extends StatefulWidget {
  SubFolder({Key? key}) : super(key: key);

  var snap;

  SubFolder.set(this.snap);

  @override
  _SubFolderState createState() => _SubFolderState();
}

class _SubFolderState extends State<SubFolder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Constant.blueColor,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  widget.snap['DISCIPLINE'].toString() +
                      ' - ' +
                      widget.snap['SemC'].toString() +
                      widget.snap['SECTION'].toString() +
                      ' | ' +
                      widget.snap['COURSE_NO'].toString() +
                      ' | ' +
                      widget.snap['folder_type'] +
                      " Folder".toUpperCase(),
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                ExpansionTile(
                  title: const Text('Weekly Plan'),
                  children: [
                    FutureBuilder(
                        future: getFiles(widget.snap['aid'], '2'),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          try {
                            var snap = snapshot.data;
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                            if (snapshot.hasError) {}
                            return snap.toString() != '[]'
                                ? ListView.builder(
                                    itemCount: snap.length,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                downloadFile(snap[index]
                                                        ['FILENAME']
                                                    .toString());
                                              },
                                              child: Text(
                                                snap[index]['FILENAME']
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
                                                await deleteFile(
                                                    snap[index]['AID'], 2);
                                                setState(() {});
                                              },
                                              icon: const Icon(
                                                Icons.delete,
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    },
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
                                      await uploadFile(uploader, "FORM 1E", '2',
                                          widget.snap['aid'].toString());
                                      setState(() {});
                                    },
                                    child: const Text('Upload Form-1E'),
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
                  title: const Text('Attendance'),
                  children: [
                    FutureBuilder(
                        future: getFiles(widget.snap['aid'], '3'),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          try {
                            var snap = snapshot.data;
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                            if (snapshot.hasError) {}
                            return snap.toString() != '[]'
                                ? ListView.builder(
                                    itemCount: snap.length,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                downloadFile(snap[index]
                                                        ['FILENAME']
                                                    .toString());
                                              },
                                              child: Text(
                                                snap[index]['FILENAME']
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
                                                await deleteFile(
                                                    snap[index]['AID'], 3);
                                                setState(() {});
                                              },
                                              icon: const Icon(
                                                Icons.delete,
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    },
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
                                      await uploadFile(uploader, "Attendance",
                                          '3', widget.snap['aid'].toString());
                                      setState(() {});
                                    },
                                    child: const Text('Upload Attendance'),
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
                GestureDetector(
                  onTap: () {
                    Get.to(QuesTabBar.set(widget.snap));
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width - 60,
                    padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        const Text(
                          "Questions",
                          style: TextStyle(fontSize: 16),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Get.to(TabularClo.set(widget.snap));
                              },
                              icon: const Icon(Icons.info_outline_rounded),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 14,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(SolTabBar.set(widget.snap));
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width - 60,
                    padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Solutions",
                          style: TextStyle(fontSize: 16),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 14,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(BwaTabBar.set(widget.snap));
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width - 60,
                    padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Samples",
                          style: TextStyle(fontSize: 16),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 14,
                        ),
                      ],
                    ),
                  ),
                ),
                ExpansionTile(
                  title: const Text('Marks Distribution + Grading'),
                  children: [
                    FutureBuilder(
                        future: getFiles(widget.snap['aid'], '10'),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          try {
                            var snap = snapshot.data;
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                            if (snapshot.hasError) {}
                            return snap.toString() != '[]'
                                ? ListView.builder(
                                    itemCount: snap.length,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(snap[index]['FILENAME']
                                                .toString()),
                                            IconButton(
                                              color: Colors.red,
                                              onPressed: () async {
                                                await deleteFile(
                                                    snap[index]['AID'], 10);
                                                setState(() {});
                                              },
                                              icon: const Icon(
                                                Icons.delete,
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    },
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
                                      await uploadFile(
                                          uploader,
                                          "Distribution Grading",
                                          '10',
                                          widget.snap['aid'].toString());
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
                  title: const Text('Result'),
                  children: [
                    FutureBuilder(
                        future: getFiles(widget.snap['aid'], '8'),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          try {
                            var snap = snapshot.data;
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                            if (snapshot.hasError) {}
                            return snap.toString() != '[]'
                                ? ListView.builder(
                                    itemCount: snap.length,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                downloadFile(snap[index]
                                                        ['FILENAME']
                                                    .toString());
                                              },
                                              child: Text(
                                                snap[index]['FILENAME']
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
                                                await deleteFile(
                                                    snap[index]['AID'], 8);
                                                setState(() {});
                                              },
                                              icon: const Icon(
                                                Icons.delete,
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    },
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
                                      await uploadFile(uploader, "Award List",
                                          '8', widget.snap['aid'].toString());
                                      setState(() {});
                                    },
                                    child: const Text('Upload Award List'),
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
                  title: const Text('FCR'),
                  children: [
                    FutureBuilder(
                        future: getFiles(widget.snap['aid'], '9'),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          try {
                            var snap = snapshot.data;
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                            if (snapshot.hasError) {}
                            return snap.toString() != '[]'
                                ? ListView.builder(
                                    itemCount: snap.length,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                downloadFile(snap[index]
                                                        ['FILENAME']
                                                    .toString());
                                              },
                                              child: Text(
                                                snap[index]['FILENAME']
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
                                                await deleteFile(
                                                    snap[index]['AID'], 9);
                                                setState(() {});
                                              },
                                              icon: const Icon(
                                                Icons.delete,
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    },
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
                                      await uploadFile(uploader, "FCR", '9',
                                          widget.snap['aid'].toString());
                                      setState(() {});
                                    },
                                    child: const Text('Upload Report'),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
