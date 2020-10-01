import 'package:flutter/material.dart';
import 'package:layout2/pages/find_members_page.dart';
import 'package:layout2/providers/jobs.dart';
import 'package:provider/provider.dart';

class AddTeam extends StatefulWidget {
  static const routeName = '/add-team';
  @override
  _AddTeamState createState() => _AddTeamState();
}

class _AddTeamState extends State<AddTeam> {
  FocusNode myFocusNode;
  final _titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Jobs>(context);

    final _highDevice = MediaQuery.of(context).size.height;
    var _2highDevice = MediaQuery.of(context).size.height / 2;
    var _4highDevice = MediaQuery.of(context).size.height / 4;
    var _widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Container(
          color: Colors.transparent,
          height: _highDevice,
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                padding: EdgeInsets.only(
                    top: _4highDevice * 0.25,
                    left: _widthDevice * 0.08,
                    right: _widthDevice * 0.08),
                height: _highDevice,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // SizedBox(height: _4highDevice * 0.),
                    Column(
                      children: [
                        Text(
                          'Buat Team',
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: _4highDevice * 0.15),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 15),
                          // width: _2highDevice * 0.8,
                          height: 4,
                          color: Color(0xffBACFEB),
                        ),
                        Row(
                          children: [
                            Text(
                              'Nama Team',
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
                                hintText: 'Masukkan Nama Team'),
                          ),
                        ),
                        Container(
                          width: _widthDevice * 0.9,
                          margin: EdgeInsets.only(top: _4highDevice * 0.1),
                          child: RaisedButton(
                            padding: EdgeInsets.symmetric(
                                horizontal: 45, vertical: 15),
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 2),
                                borderRadius: BorderRadius.circular(10)),
                            color: Theme.of(context).primaryColor,
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(FindMembers.routeName);
                              // myFocusNode.requestFocus();
                            },
                            child: Text(
                              'Tambah Anggota',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: _4highDevice * 0.1),
                            ),
                          ),
                        ),
                        Container(
                          width: _widthDevice * 0.9,
                          margin: EdgeInsets.only(top: _4highDevice * 0.1),
                          child: RaisedButton(
                            padding: EdgeInsets.symmetric(
                                horizontal: 45, vertical: 15),
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 2),
                                borderRadius: BorderRadius.circular(10)),
                            color: Theme.of(context).primaryColor,
                            onPressed: () {
                              Navigator.of(context).pop();
                              // myFocusNode.requestFocus();
                            },
                            child: Text(
                              'Tambah Tugas',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: _4highDevice * 0.1),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: _widthDevice * 0.4,
                            child: RaisedButton(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Theme.of(context).primaryColor,
                                      width: 2),
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
                          ),
                          Container(
                            width: _widthDevice * 0.4,
                            child: RaisedButton(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    // width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              color: Theme.of(context).primaryColor,
                              onPressed: () async {},
                              child: Text(
                                'Simpan',
                                style: TextStyle(
                                    color: Theme.of(context).backgroundColor,
                                    fontSize: _4highDevice * 0.1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
