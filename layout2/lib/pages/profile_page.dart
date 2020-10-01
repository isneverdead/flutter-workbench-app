import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:layout2/pages/edit_profile_page.dart';
import 'package:layout2/pages/login_page.dart';
import 'package:layout2/providers/auth.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  static const routeName = '/profile';

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
                  SizedBox(height: 20),
// profile section
                  Container(
                    height: _highDevice * 0.7,
                    // color: Colors.red,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 0,
                          child: Container(
                            height: _2highDevice * 1.2,
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
                                Column(children: [
                                  SizedBox(height: 50),
                                  Text(
                                    'John Doe',
                                    style: TextStyle(
                                        fontSize: _4highDevice * 0.13,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    '270 Point',
                                    style: TextStyle(
                                      fontSize: _4highDevice * 0.09,
                                      // fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 50),
                                  Container(
                                    width: _2highDevice * 0.75,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: _4highDevice,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Nama Pengguna',
                                                style: TextStyle(
                                                  fontSize: _4highDevice * 0.1,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.grey[700],
                                                ),
                                              ),
                                              Text(
                                                'Nama',
                                                style: TextStyle(
                                                  fontSize: _4highDevice * 0.1,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.grey[700],
                                                ),
                                              ),
                                              Text(
                                                'Email',
                                                style: TextStyle(
                                                  fontSize: _4highDevice * 0.1,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.grey[700],
                                                ),
                                              ),
                                              Text(
                                                'Kata Sandi',
                                                style: TextStyle(
                                                  fontSize: _4highDevice * 0.1,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.grey[700],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: _4highDevice,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'john123',
                                                style: TextStyle(
                                                  fontSize: _4highDevice * 0.1,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.grey[700],
                                                ),
                                              ),
                                              Text(
                                                'John Doe',
                                                style: TextStyle(
                                                  fontSize: _4highDevice * 0.1,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.grey[700],
                                                ),
                                              ),
                                              Container(
                                                width: _4highDevice * 0.75,
                                                child: Text(
                                                  'johndoe@gmail.com',
                                                  style: TextStyle(
                                                    fontSize:
                                                        _4highDevice * 0.09,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.grey[700],
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                '********',
                                                style: TextStyle(
                                                  fontSize: _4highDevice * 0.1,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.grey[700],
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ]),
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
                                          color: Color(0xff333333),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Text(
                                            'Edit',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: _4highDevice * 0.09),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pushNamed(
                                                EditProfilePage.routeName);
                                          },
                                        ),
                                      ),
                                      Container(
                                        width: _4highDevice * 0.7,
                                        height: _4highDevice * 0.15,
                                        child: RaisedButton(
                                          color: Color(0xffEB5757),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Text(
                                            'Logout',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: _4highDevice * 0.09),
                                          ),
                                          onPressed: () {
                                            auth.logout();
                                            Navigator.of(context)
                                                .pushReplacementNamed(
                                                    LoginPage.routeName);
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
                              margin:
                                  EdgeInsets.only(bottom: _4highDevice * 0.1),
                              height: _4highDevice * 0.6,
                              width: _4highDevice * 0.6,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(100)),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(100),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        'http://nwsid.net/wp-content/uploads/2015/05/dummy-profile-pic.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )

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
