import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'helper_methods/admin_methods.dart';
import 'helper_methods/ip.dart';
import 'widgets/app_bar.dart';

class AlertNotifications extends StatefulWidget {
  const AlertNotifications({Key? key}) : super(key: key);

  @override
  _AlertNotificationsState createState() => _AlertNotificationsState();
}

class _AlertNotificationsState extends State<AlertNotifications> {
  var ic = Icons.play_arrow_outlined;
  bool playing = false;
  final player = AudioPlayer();

  checkAudio(snap) {
    if (snap['msg'].split('.').length == 1) {
      return Text(
        snap['msg'].toString().toUpperCase(),
        style: const TextStyle(fontSize: 16),
      );
    }
    return IconButton(
      onPressed: () async {
        await getAudio(snap['msg']);
      },
      icon: Icon(ic),
    );
  }

  getAudio(var file) async {
    try {
      if (playing) {
        player.stop();
        playing = false;
        ic = Icons.play_arrow_outlined;
        setState(() {});
      } else {
        Dio dio = Dio();
        file = file.toString().replaceAll(' ', '%20');
        String downloadUrl =
            ('http://' + IP.ip + '/obms/files/' + file.toString()).toString();
        Directory appDocDirectory = await getApplicationDocumentsDirectory();
        Directory(appDocDirectory.path + '/' + 'dir')
            .create(recursive: true)
            .then((Directory directory) async {
          print(directory.path);
          await dio.download(downloadUrl, directory.path + '/' + file);
          await player.setUrl(directory.path + '/' + file);
          player.play();
          ic = Icons.stop;
          playing = true;
          setState(() {});
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    player.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar("Notification"),
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
          padding: const EdgeInsets.all(5),
          child: FutureBuilder(
            future: getNotification(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              try {
                var snap = snapshot.data;
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {}
                return ListView.builder(
                  itemCount: snap.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                snap[index]['name'].toString().toUpperCase(),
                                style: const TextStyle(fontSize: 16),
                              ),
                              checkAudio(snap[index]),
                            ],
                          ),
                          const Divider(
                            thickness: 2,
                          ),
                        ],
                      ),
                    );
                  },
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
        ),
      ),
    );
  }
}
