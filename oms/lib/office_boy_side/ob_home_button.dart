import 'package:flutter/material.dart';
import 'package:flutter_audio_record/helper_methods/office_boy_methods.dart';
import '../constants.dart';

class ObButton extends StatefulWidget {
  ObButton({Key? key}) : super(key: key);
  var snap, floor;

  ObButton.set(this.snap, this.floor, {this.notifyParent});

  late Function()? notifyParent;

  @override
  _ObButtonState createState() => _ObButtonState();
}

class _ObButtonState extends State<ObButton> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.snap.length,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return index % 3 == 0
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget.snap[index]['floors'] == widget.floor
                      ? GestureDetector(
                          onTap: () async {
                            Constant.changeColor(index, widget.snap.length);
                            Constant.currentLoc = widget.snap[index]['name']
                                .toString()
                                .toUpperCase();
                            await addLocationLogs(
                                widget.snap[index]['name']
                                    .toString()
                                    .toUpperCase(),
                                widget.floor,
                                DateTime.now()
                                    .toLocal()
                                    .toString()
                                    .split(' ')[0]
                                    .toString(),
                                DateTime.now()
                                    .toString()
                                    .split(' ')[1]
                                    .toString()
                                    .split('.')[0]);
                            widget.notifyParent!();
                            setState(() {});
                          },
                          child: Container(
                            width: 110,
                            margin: const EdgeInsets.all(5),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Constant.colors[index],
                            ),
                            child: Text(
                              widget.snap[index]['name'].toString(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.white,fontSize: 13),
                            ),
                          ),
                        )
                      : Container(),
                  index < widget.snap.length - 1
                      ? widget.snap[index + 1]['floors'] == widget.floor
                          ? GestureDetector(
                              onTap: () async {
                                Constant.changeColor(
                                    index + 1, widget.snap.length);
                                Constant.currentLoc = widget.snap[index + 1]
                                        ['name']
                                    .toString()
                                    .toUpperCase();
                                await addLocationLogs(
                                    widget.snap[index + 1]['name']
                                        .toString()
                                        .toUpperCase(),
                                    widget.floor,
                                    DateTime.now()
                                        .toLocal()
                                        .toString()
                                        .split(' ')[0]
                                        .toString(),
                                    DateTime.now()
                                        .toString()
                                        .split(' ')[1]
                                        .toString()
                                        .split('.')[0]);
                                widget.notifyParent!();
                                setState(() {});
                              },
                              child: Container(
                                width: 110,
                                margin: const EdgeInsets.all(5),
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Constant.colors[index + 1],
                                ),
                                child: Text(
                                  widget.snap[index + 1]['name'].toString(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(color: Colors.white,fontSize: 13),
                                ),
                              ),
                            )
                          : Container()
                      : Container(),
                  index < widget.snap.length - 2
                      ? widget.snap[index + 2]['floors'] == widget.floor
                          ? GestureDetector(
                              onTap: () async {
                                Constant.changeColor(
                                    index + 2, widget.snap.length);
                                Constant.currentLoc = widget.snap[index + 2]
                                        ['name']
                                    .toString()
                                    .toUpperCase();
                                await addLocationLogs(
                                    widget.snap[index + 2]['name']
                                        .toString()
                                        .toUpperCase(),
                                    widget.floor,
                                    DateTime.now()
                                        .toLocal()
                                        .toString()
                                        .split(' ')[0]
                                        .toString(),
                                    DateTime.now()
                                        .toString()
                                        .split(' ')[1]
                                        .toString()
                                        .split('.')[0]);
                                widget.notifyParent!();
                                setState(() {});
                              },
                              child: Container(
                                width: 110,
                                margin: const EdgeInsets.all(5),
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Constant.colors[index + 2],
                                ),
                                child: Text(
                                  widget.snap[index + 2]['name'].toString(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(color: Colors.white,fontSize: 13),
                                ),
                              ),
                            )
                          : Container()
                      : Container(),
                ],
              )
            : Container();
      },
    );
  }
}
