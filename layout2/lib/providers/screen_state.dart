import 'package:flutter/material.dart';

enum Show { Tugas, Team }

class ScreenState with ChangeNotifier {
  String _homePageView = 'home widget';
  String get homePageView {
    return _homePageView;
  }

  void changeHomePageView(String content) {
    _homePageView = content;
    notifyListeners();
  }

  // home page widget
  String _listContent = 'team';
  String get listContent {
    return _listContent;
  }

  void changeListContent(String content) {
    _listContent = content;
    notifyListeners();
  }

  // home page team widget
  String _detailTeamListContent = 'progres';
  String get detailTeamListContent {
    return _detailTeamListContent;
  }

  void changedetailTeamListContent(String content) {
    _detailTeamListContent = content;
    notifyListeners();
  }

  String _detailTeamMembers = 'hide members';
  String get detailTeamMembers {
    return _detailTeamMembers;
  }

  void changedetailTeamMembers(String content) {
    _detailTeamMembers = content;
    notifyListeners();
  }
}
