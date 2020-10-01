import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:layout2/pages/edit_profile_page.dart';
import 'package:layout2/pages/login_page.dart';
import 'package:layout2/providers/auth.dart';
import 'package:provider/provider.dart';

class FindMembers extends StatefulWidget {
  static const routeName = '/find-members';

  @override
  _FindMembersState createState() => _FindMembersState();
}

class _FindMembersState extends State<FindMembers> {
  PickedFile userPhoto;

  bool _isUserPhoto = false;
  bool _isPasswordHidden = true;
  bool _showUserPasswordField = false;
  void _togglePassword() {
    _isPasswordHidden = !_isPasswordHidden;
  }

  @override
  Widget build(BuildContext context) {
    final _highDevice = MediaQuery.of(context).size.height;
    var _2highDevice = MediaQuery.of(context).size.height / 2;
    var _4highDevice = MediaQuery.of(context).size.height / 4;
    var _widthDevice = MediaQuery.of(context).size.width;
    final auth = Provider.of<Auth>(context);
    return Scaffold(
      body: Container(
        height: _highDevice,
        child: SingleChildScrollView(
          child: GestureDetector(
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);

              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            child: Container(
              color: Colors.transparent,
              padding: EdgeInsets.symmetric(horizontal: _4highDevice * 0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // App Bar
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
                              // job.updateJob(
                              //     job.loadedPostById.values
                              //         .toList()[0]
                              //         .id,
                              //     Job(
                              //         id: job.loadedPostById.values
                              //             .toList()[0]
                              //             .id,
                              //         title: _titleController.text,
                              //         isCompleted: job
                              //             .loadedPostById.values
                              //             .toList()[0]
                              //             .isCompleted,
                              //         kendala: _kendalaController.text));

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
                  SizedBox(height: 20),
// profile section
                  Container(
                    height: _highDevice * 0.7,
                    // color: Colors.red,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Container(
                          width: _widthDevice * 0.9,
                          height: _4highDevice * 0.4,
                          padding: EdgeInsets.only(
                              left: _widthDevice * 0.05,
                              right: _widthDevice * 0.05),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: _4highDevice * 0.3,
                                height: _4highDevice * 0.3,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        'http://nwsid.net/wp-content/uploads/2015/05/dummy-profile-pic.png'),
                                  ),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    'data',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: _4highDevice * 0.12),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
// profile section
// Photo Profile Picker
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
