import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_record/constants.dart';
import 'package:flutter_audio_record/helper_methods/ip.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'audio_recorder.dart';

class Recorder extends StatefulWidget {
  final Function save;

  const Recorder({Key? key, required this.save}) : super(key: key);

  @override
  _RecorderState createState() => _RecorderState();
}

class _RecorderState extends State<Recorder> {
  String patho = '';
  IconData _recordIcon = Icons.mic_none;
  MaterialColor colo = Colors.orange;
  RecordingStatus _currentStatus = RecordingStatus.Unset;
  bool stop = false;
  Recording? _current;
  late FlutterAudioRecorder? audioRecorder;

  @override
  void initState() {
    super.initState();
    checkPermission();
  }

  checkPermission() async {
    if (await Permission.contacts.request().isGranted) {}

    Map<Permission, PermissionStatus> statuses = await [
      Permission.microphone,
      Permission.storage,
    ].request();
    print(statuses[Permission.microphone]);
    print(statuses[Permission.storage]);
    if (statuses[Permission.microphone] == PermissionStatus.granted) {
      _currentStatus = RecordingStatus.Initialized;
      _recordIcon = Icons.mic;
    } else {}
  }

  @override
  void dispose() {
    _currentStatus = RecordingStatus.Unset;
    audioRecorder = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          children: [
            SizedBox(
              height: 20,
            ),
            stop == false
                ? ElevatedButton(
                    onPressed: () async {
                      await _onRecordButtonPressed();
                      setState(() {});
                    },
                    child: Icon(
                      _recordIcon,
                      color: Colors.white,
                      size: 20,
                    ),
                  )
                : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RaisedButton(
                      color: colo,
                      onPressed: () async {
                        await _onRecordButtonPressed();
                        setState(() {});
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        width: 20,
                        height: 20,
                        child: Icon(
                          _recordIcon,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: _currentStatus != RecordingStatus.Unset
                          ? _stop
                          : null,
                      child: Container(
                        width: 20,
                        height: 20,
                        child: Icon(
                          Icons.send,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
          ],
        ),
      ],
    );
  }

  Future<void> _onRecordButtonPressed() async {
    switch (_currentStatus) {
      case RecordingStatus.Initialized:
        {
          _recordo();
          break;
        }
      case RecordingStatus.Recording:
        {
          _pause();
          break;
        }
      case RecordingStatus.Paused:
        {
          _resume();
          break;
        }
      case RecordingStatus.Stopped:
        {
          _recordo();
          break;
        }
      default:
        break;
    }
  }

  _initial() async {
    Directory? appDir = await getExternalStorageDirectory();
    String jrecord = 'Audiorecords';
    String dato = "${DateTime.now().millisecondsSinceEpoch.toString()}.wav";
    Directory appDirec = Directory("${appDir!.path}/$jrecord/");
    if (await appDirec.exists()) {
      patho = "${appDirec.path}$dato";
      print("path for file11 ${patho}");
      audioRecorder = FlutterAudioRecorder(patho, audioFormat: AudioFormat.WAV);
      await audioRecorder!.initialized;
    } else {
      appDirec.create(recursive: true);
      Fluttertoast.showToast(msg: "Start Recording , Press Start");
      patho = "${appDirec.path}$dato";
      print("path for file22 ${patho}");
      audioRecorder = FlutterAudioRecorder(patho, audioFormat: AudioFormat.WAV);
      await audioRecorder!.initialized;
    }
  }

  _start() async {
    await audioRecorder!.start();
    var recording = await audioRecorder!.current(channel: 0);
    setState(() {
      _current = recording!;
    });

    const tick = const Duration(milliseconds: 50);
    new Timer.periodic(tick, (Timer t) async {
      if (_currentStatus == RecordingStatus.Stopped) {
        t.cancel();
      }

      var current = await audioRecorder!.current(channel: 0);
      // print(current.status);
      setState(() {
        _current = current!;
        _currentStatus = _current!.status!;
      });
    });
  }

  _resume() async {
    await audioRecorder!.resume();
    Fluttertoast.showToast(msg: "Resume Recording");
    setState(() {
      _recordIcon = Icons.pause;
      colo = Colors.red;
    });
  }

  _pause() async {
    await audioRecorder!.pause();
    Fluttertoast.showToast(msg: "Pause Recording");
    setState(() {
      _recordIcon = Icons.mic;
      colo = Colors.green;
    });
  }

  _stop() async {
    var result = await audioRecorder!.stop();
    Fluttertoast.showToast(msg: "Stop Recording , File Saved");
    widget.save();
    await addNoti();
    setState(() {
      _current = result;
      _currentStatus = _current!.status!;
      _current!.duration = null;
      _recordIcon = Icons.mic;
      stop = false;
    });
  }

  addNoti() async {
    try {
      String uploadUrl = ('http://' +
          IP.ip +
          '/obms/api/obms/addNoti?froms='+User.id+'&tos='+Constant.tos.toString())
          .toString();
      Dio dio = Dio();
      var formData = FormData.fromMap(
          {'file': await MultipartFile.fromFile(patho.toString())});
      var response = await dio.post(uploadUrl, data: formData);
      var res = jsonDecode(response.toString());
      print(res);
      Navigator.pop(context);
    } catch (e) {
      print(e);
    }
  }

  Future<void> _recordo() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.microphone,
      Permission.storage,
    ].request();
    print(statuses[Permission.microphone]);
    print(statuses[Permission.storage]);
    if (statuses[Permission.microphone] == PermissionStatus.granted) {
      await _initial();
      await _start();
      Fluttertoast.showToast(msg: "Start Recording");
      setState(() {
        _currentStatus = RecordingStatus.Recording;
        _recordIcon = Icons.pause;
        colo = Colors.red;
        stop = true;
      });
    } else {
      Fluttertoast.showToast(msg: "Allow App To Use Mic");
    }
  }
}
