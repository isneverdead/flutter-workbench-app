import 'package:flutter/material.dart';
import 'package:layout2/models/job.dart';
import 'package:layout2/providers/jobs.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddJobAdmin extends StatefulWidget {
  @override
  _AddJobAdminState createState() => _AddJobAdminState();
}

class _AddJobAdminState extends State<AddJobAdmin> {
  FocusNode myFocusNode;
  final _titleController = TextEditingController();
  // final _kendalaController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    void _showToast(String msg) {
      Fluttertoast.showToast(
          msg: '$msg',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Theme.of(context).primaryColor,
          textColor: Colors.grey[200],
          fontSize: 16.0);
    }

    final _highDevice = MediaQuery.of(context).size.height;
    var _2highDevice = MediaQuery.of(context).size.height / 2;
    var _4highDevice = MediaQuery.of(context).size.height / 4;
    var widthDevice = MediaQuery.of(context).size.width;
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
    final job = Provider.of<Jobs>(context);
    return Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      height: _highDevice * 0.9,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Container(
          decoration: BoxDecoration(
            // color: Colors.grey[400],
            boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(255, 0, 255, 109),
                  offset: Offset(0, -3),
                  blurRadius: 2.0,
                  spreadRadius: 1.0),
            ],
            gradient: LinearGradient(
                begin: Alignment(0, 1.9),
                end: Alignment(0, -1),
                colors: [
                  Color.fromARGB(220, 86, 204, 242),
                  Colors.white,
                ]),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          padding: EdgeInsets.only(
              top: _4highDevice * 0.2,
              left: _4highDevice * 0.1,
              right: _4highDevice * 0.1),
          // height: _2highDevice,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Add Task to User',
                style: TextStyle(
                    fontWeight: FontWeight.w800, fontSize: _4highDevice * 0.15),
              ),
              SizedBox(height: 10),
              Container(
                height: _4highDevice * 0.02,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    'Judul',
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: _4highDevice * 0.09),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  autofocus: true,
                  focusNode: myFocusNode,
                  controller: _titleController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Hari ini mau ngapain?'),
                ),
              ),
              SizedBox(height: 20),
              DropdownButton(
                items: ['A', 'B', 'C', 'D'].map((String value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    padding: EdgeInsets.symmetric(horizontal: 45, vertical: 15),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Theme.of(context).primaryColor, width: 2),
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.of(context).pop();
                      // myFocusNode.requestFocus();
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: _4highDevice * 0.1),
                    ),
                  ),
                  RaisedButton(
                    padding: EdgeInsets.symmetric(horizontal: 55, vertical: 15),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Theme.of(context).primaryColor,
                          // width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    color: Theme.of(context).primaryColor,
                    onPressed: () async {
                      print(_titleController.text);
                      job.addJobAdmin(
                          job: Job(
                              id: _titleController.text,
                              title: _titleController.text,
                              status: '',
                              kendala: 'tidak ada',
                              tanggal: ''),
                          token: '_token');
                      _showToast('${_titleController.text} added');
                      _titleController.clear();
                    },
                    child: Text(
                      'add',
                      style: TextStyle(
                          color: Theme.of(context).backgroundColor,
                          fontSize: _4highDevice * 0.1),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
            ],
          )),
    );
  }
}
