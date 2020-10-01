import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:layout2/pages/login_page.dart';
import 'package:layout2/providers/auth.dart';
import 'package:provider/provider.dart';

class EditProfilePage extends StatefulWidget {
  static const routeName = '/edit-profile';

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
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
    var widthDevice = MediaQuery.of(context).size.width;
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Container(
                        //   width: _4highDevice * 0.3,
                        //   height: _4highDevice * 0.3,
                        //   decoration: BoxDecoration(
                        //     color: Theme.of(context).primaryColor,
                        //     borderRadius: BorderRadius.circular(15),
                        //   ),
                        //   child: IconButton(
                        //     iconSize: _4highDevice * 0.17,
                        //     color: Theme.of(context).backgroundColor,
                        //     icon: Icon(Icons.arrow_back_ios),
                        //     onPressed: () {
                        //       Navigator.of(context).pop();
                        //     },
                        //   ),
                        // ),
                        // Container(
                        //   width: _4highDevice * 0.3,
                        //   height: _4highDevice * 0.3,
                        //   decoration: BoxDecoration(
                        //     color: Theme.of(context).primaryColor,
                        //     borderRadius: BorderRadius.circular(15),
                        //   ),
                        //   child: IconButton(
                        //     iconSize: _4highDevice * 0.21,
                        //     color: Theme.of(context).backgroundColor,
                        //     icon: Icon(Icons.save),
                        //     onPressed: () {
                        //       // job.updateJob(
                        //       //     job.loadedPostById.values
                        //       //         .toList()[0]
                        //       //         .id,
                        //       //     Job(
                        //       //         id: job.loadedPostById.values
                        //       //             .toList()[0]
                        //       //             .id,
                        //       //         title: _titleController.text,
                        //       //         isCompleted: job
                        //       //             .loadedPostById.values
                        //       //             .toList()[0]
                        //       //             .isCompleted,
                        //       //         kendala: _kendalaController.text));

                        //       FocusScopeNode currentFocus = FocusScope.of(context);

                        //       if (!currentFocus.hasPrimaryFocus) {
                        //         currentFocus.unfocus();
                        //       }
                        //     },
                        //   ),
                        // ),
                      ],
                    ),
                  ),
// app bar
                  // SizedBox(height: 20),
// profile section
                  Container(
                    height: _highDevice * 0.9,
                    // color: Colors.red,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 0,
                          child: Container(
                            height: _highDevice * 0.8,
                            width: _2highDevice * 0.9,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey[500],
                                      offset: Offset(0, 1.5),
                                      blurRadius: 2.0,
                                      spreadRadius: 1.0),
                                ],
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: _highDevice * 0.65,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(height: 50),
                                        Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                  margin: EdgeInsets.only(
                                                      bottom:
                                                          _4highDevice * 0.05,
                                                      top: _4highDevice * 0.05),
                                                  child: Text(
                                                    'Username',
                                                    style: TextStyle(
                                                        fontSize:
                                                            _4highDevice * 0.09,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  )),
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                width: widthDevice * 0.7,
                                                height: _4highDevice * 0.2,
                                                child: TextField(
                                                  // controller:
                                                  //     _usernameController,
                                                  decoration: InputDecoration(
                                                    fillColor:
                                                        Color(0xffC4C4C4),
                                                    filled: true,
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          width: 2,
                                                          color: Colors
                                                              .transparent),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          width: 2,
                                                          color: Colors
                                                              .transparent),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                  margin: EdgeInsets.only(
                                                      bottom:
                                                          _4highDevice * 0.05,
                                                      top: _4highDevice * 0.05),
                                                  child: Text(
                                                    'Nama',
                                                    style: TextStyle(
                                                        fontSize:
                                                            _4highDevice * 0.09,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  )),
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                width: widthDevice * 0.7,
                                                height: _4highDevice * 0.2,
                                                child: TextField(
                                                  // controller:
                                                  //     _usernameController,
                                                  decoration: InputDecoration(
                                                    fillColor:
                                                        Color(0xffC4C4C4),
                                                    filled: true,
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          width: 2,
                                                          color: Colors
                                                              .transparent),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          width: 2,
                                                          color: Colors
                                                              .transparent),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                  margin: EdgeInsets.only(
                                                      bottom:
                                                          _4highDevice * 0.05,
                                                      top: _4highDevice * 0.05),
                                                  child: Text(
                                                    'Email',
                                                    style: TextStyle(
                                                        fontSize:
                                                            _4highDevice * 0.09,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  )),
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                width: widthDevice * 0.7,
                                                height: _4highDevice * 0.2,
                                                child: TextField(
                                                  // controller:
                                                  //     _usernameController,
                                                  decoration: InputDecoration(
                                                    fillColor:
                                                        Color(0xffC4C4C4),
                                                    filled: true,
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          width: 2,
                                                          color: Colors
                                                              .transparent),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          width: 2,
                                                          color: Colors
                                                              .transparent),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                  margin: EdgeInsets.only(
                                                      bottom:
                                                          _4highDevice * 0.05,
                                                      top: _4highDevice * 0.05),
                                                  child: Text(
                                                    'Kata Sandi Baru',
                                                    style: TextStyle(
                                                        fontSize:
                                                            _4highDevice * 0.09,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  )),
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                width: widthDevice * 0.7,
                                                height: _4highDevice * 0.2,
                                                child: TextField(
                                                  // controller:
                                                  //     _usernameController,
                                                  decoration: InputDecoration(
                                                    fillColor:
                                                        Color(0xffC4C4C4),
                                                    filled: true,
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          width: 2,
                                                          color: Colors
                                                              .transparent),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          width: 2,
                                                          color: Colors
                                                              .transparent),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                  margin: EdgeInsets.only(
                                                      bottom:
                                                          _4highDevice * 0.05,
                                                      top: _4highDevice * 0.05),
                                                  child: Text(
                                                    'Konfirmasi kata sandi',
                                                    style: TextStyle(
                                                        fontSize:
                                                            _4highDevice * 0.09,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  )),
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                width: widthDevice * 0.7,
                                                height: _4highDevice * 0.2,
                                                child: TextField(
                                                  // controller:
                                                  //     _usernameController,
                                                  decoration: InputDecoration(
                                                    fillColor:
                                                        Color(0xffC4C4C4),
                                                    filled: true,
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          width: 2,
                                                          color: Colors
                                                              .transparent),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          width: 2,
                                                          color: Colors
                                                              .transparent),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ]),
                                ),
                                Container(
                                  width: _2highDevice * 0.75,
                                  margin: EdgeInsets.only(
                                      bottom: _4highDevice * 0.05),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: _4highDevice * 0.7,
                                        height: _4highDevice * 0.15,
                                        child: RaisedButton(
                                          color: Color(0xffEB5757),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Text(
                                            'Batal',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: _4highDevice * 0.09),
                                          ),
                                          onPressed: () {
                                            // auth.logout();
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ),
                                      Container(
                                        width: _4highDevice * 0.7,
                                        height: _4highDevice * 0.15,
                                        child: RaisedButton(
                                          color: Color(0xff27AE60),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Text(
                                            'Selesai',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: _4highDevice * 0.09),
                                          ),
                                          onPressed: () {
                                            auth.logout();
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            margin: EdgeInsets.only(bottom: _4highDevice * 0.1),
                            height: _4highDevice * 0.6,
                            width: _4highDevice * 0.6,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(100)),
                            child: _isUserPhoto
                                ? Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(100),
                                      image: DecorationImage(
                                        image: FileImage(File(userPhoto.path)),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )
                                : IconButton(
                                    color: Colors.white,
                                    icon: Icon(
                                      Icons.add,
                                      size: _4highDevice * 0.3,
                                    ),
                                    onPressed: () async {
                                      var image = await ImagePicker().getImage(
                                          source: ImageSource.gallery);
                                      setState(() {
                                        userPhoto = image;
                                        _isUserPhoto = true;
                                      });
                                    }),
                            // color: Colors.grey,
                          ),
                        )
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
