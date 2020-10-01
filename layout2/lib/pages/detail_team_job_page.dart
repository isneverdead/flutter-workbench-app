import 'dart:async';

import 'package:flutter/material.dart';
import 'package:layout2/models/job.dart';
import 'package:layout2/providers/jobs.dart';
import 'package:layout2/providers/team.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum _deleteStage { stage1, stage2, stage3 }

class DetailTeamJobPage extends StatefulWidget {
  static const routeName = '/detail-team-job';
  @override
  _DetailTeamJobPageState createState() => _DetailTeamJobPageState();
}

class _DetailTeamJobPageState extends State<DetailTeamJobPage> {
  bool _confirmDeleteButton = false;
  bool _showConfirmDeleteModal = false;

  var _stage = _deleteStage.stage1;

  final _titleController = TextEditingController();
  final _kendalaController = TextEditingController();
  void showToast(String msg) {
    Fluttertoast.showToast(
        msg: '$msg',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Theme.of(context).primaryColor,
        textColor: Colors.grey[200],
        fontSize: 16.0);
  }

  void _toggleDeleteButtom() {
    switch (_stage) {
      case (_deleteStage.stage1):
        showToast('Tekan sekali lagi untuk Cancel Job');
        setState(() {
          _stage = _deleteStage.stage2;
          // _showConfirmDeleteModal = true;
        });
        print('langkah 1 ===== $_stage');
        // print(_stage);
        Timer(Duration(milliseconds: 1500), () {
          setState(() {
            _stage = _deleteStage.stage1;
            // _showConfirmDeleteModal = false;

            print('kembali ke 1');
          });
        });
        break;
      case (_deleteStage.stage2):
        Timer(Duration(milliseconds: 1500), () {
          setState(() {
            _stage = _deleteStage.stage1;
            print('kembali ke 1');
          });
        });
        Navigator.of(context).pop();
        setState(() {
          _stage = _deleteStage.stage3;
          // _showConfirmDeleteModal = false;
          // showToast('Tekan sekali lagi untuk Cancel Job');
        });
        print('langkah 2 ===== $_stage');
        // print(_stage);

        break;
      case (_deleteStage.stage3):
        // print('langkah 3 ===== $_stage');
        // setState(() {
        //   _stage = _deleteStage.stage1;
        //   _showConfirmDeleteModal = false;
        // });
        // print('kembali ke 1');
        // print(_stage);
        break;
      default:
    }
  }

  // void loadJob() {
  //   final job = Provider.of<Jobs>(context);

  //   _titleController.text = job.loadedPostById.values.toList()[0].title;
  //   _kendalaController.text = job.loadedPostById.values.toList()[0].kendala;
  // }

  @override
  Widget build(BuildContext context) {
    final _highDevice = MediaQuery.of(context).size.height;
    var _2highDevice = MediaQuery.of(context).size.height / 2;
    var _4highDevice = MediaQuery.of(context).size.height / 4;
    final args = ModalRoute.of(context).settings.arguments;
    final team = Provider.of<Team>(context);

    _titleController.text = team.loadedPostById.values.toList()[0].title;
    _kendalaController.text = team.loadedPostById.values.toList()[0].kendala;
    _titleController.selection = TextSelection.fromPosition(
        TextPosition(offset: _titleController.text.length));
    _kendalaController.selection = TextSelection.fromPosition(
        TextPosition(offset: _kendalaController.text.length));

    return Scaffold(
      // resizeToAvoidBottomPadding: true,
      // appBar: AppBar(
      //   title: Text('Home'),
      //   centerTitle: true,
      // ),
      backgroundColor: Colors.grey[300],
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Container(
          color: Colors.transparent,
          padding: EdgeInsets.only(
              left: _4highDevice * 0.1, right: _4highDevice * 0.1),
          child: Center(
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: _4highDevice * 0.25),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: _4highDevice * 0.3,
                                height: _4highDevice * 0.3,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: IconButton(
                                  iconSize: _4highDevice * 0.17,
                                  color: Theme.of(context).backgroundColor,
                                  icon: Icon(Icons.arrow_back_ios),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                              Container(
                                width: _4highDevice * 0.3,
                                height: _4highDevice * 0.3,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: IconButton(
                                  iconSize: _4highDevice * 0.21,
                                  color: Theme.of(context).backgroundColor,
                                  icon: Icon(Icons.save),
                                  onPressed: () {
                                    showToast('Job berhasil diubah');
                                    team.updateJob(
                                        team.loadedPostById.values
                                            .toList()[0]
                                            .id,
                                        Job(
                                            id: team.loadedPostById.values
                                                .toList()[0]
                                                .id,
                                            title: _titleController.text,
                                            status: team.loadedPostById.values
                                                .toList()[0]
                                                .status,
                                            kendala: _kendalaController.text,
                                            tanggal: ''));

                                    FocusScopeNode currentFocus =
                                        FocusScope.of(context);

                                    if (!currentFocus.hasPrimaryFocus) {
                                      currentFocus.unfocus();
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
// app bar
                        SizedBox(height: 10),
                        Container(
                          margin: EdgeInsets.only(bottom: _4highDevice * 0.03),
                          child: Text(
                            'Detail',
                            style: TextStyle(
                                fontSize: _4highDevice * 0.13,
                                fontWeight: FontWeight.w800,
                                color: Colors.grey[800]),
                          ),
                        ),
// name card
                        SizedBox(height: 10),
                        Container(
                          height: _4highDevice * 0.02,
                          decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        SizedBox(height: 20),
                        // SizedBox(height: 18),
                        Container(
                          child: Row(
                            children: [
                              Text(
                                'Touch to edit',
                                style: TextStyle(
                                    fontSize: _4highDevice * 0.07,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.grey[600]),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),

                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: TextField(
                            controller: _titleController,
                            onChanged: (value) {
                              print(value);
                            },
                            decoration: InputDecoration(
                                border: InputBorder.none, hintText: 'Judul'),
                          ),
                        ),

                        SizedBox(height: 20),
                        Container(
                          margin: EdgeInsets.only(bottom: _4highDevice * 0.03),
                          child: Text(
                            'Kendala',
                            style: TextStyle(
                                fontSize: _4highDevice * 0.1,
                                fontWeight: FontWeight.w800,
                                color: Colors.grey[800]),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: TextField(
                            controller: _kendalaController,
                            // onChanged: (value) {
                            //   team.findById(
                            //       team.loadedPostById.values.toList()[0].id);
                            // },
                            minLines: 5,
                            maxLines: 5,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Tulis Kendalanya disini'),
                          ),
                        ),

                        // end column
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: _4highDevice * 0.09),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: _stage == _deleteStage.stage2
                                    ? Colors.transparent
                                    : Colors.grey[500],
                              ),
                              borderRadius: BorderRadius.circular(10),
                              color: _stage == _deleteStage.stage2
                                  ? Colors.red
                                  : Colors.transparent,
                            ),
                            width: _4highDevice * 0.28,
                            child: IconButton(
                              color: _stage == _deleteStage.stage2
                                  ? Colors.white
                                  : Colors.red,
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                _toggleDeleteButtom();
                                if (_stage == _deleteStage.stage3) {
                                  team.deleteJob(team.loadedPostById.values
                                      .toList()[0]
                                      .id);
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: _2highDevice * 0.7,
                            height: _4highDevice * 0.27,
                            child: RaisedButton(
                              color: Color(0xff00FF6C),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                'Selesai Tugas',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: _4highDevice * 0.1),
                              ),
                              onPressed: () {
                                showToast('Job Selesai');
                                team.updateJob(
                                    team.loadedPostById.values.toList()[0].id,
                                    Job(
                                      id: team.loadedPostById.values
                                          .toList()[0]
                                          .id,
                                      title: team.loadedPostById.values
                                          .toList()[0]
                                          .title,
                                      status: '1',
                                      kendala: team.loadedPostById.values
                                          .toList()[0]
                                          .kendala,
                                      tanggal: '',
                                    ));

                                // team.findById(
                                //     team.loadedPostById.values.toList()[0].id);
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                    bottom: _4highDevice,
                    child: Container(
                      alignment: Alignment.center,
                      // color: Colors.red,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedOpacity(
                            opacity: _showConfirmDeleteModal ? 0.6 : 0.0,
                            duration: Duration(milliseconds: 500),
                            child: Container(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              width: _4highDevice * 1.1,
                              height: _4highDevice * 0.3,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color.fromRGBO(0, 0, 0, 80)),
                              child: Text(
                                'Tekan sekali lagi untuk menghapus',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: _4highDevice * 0.09),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: _4highDevice * 0.2,
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
