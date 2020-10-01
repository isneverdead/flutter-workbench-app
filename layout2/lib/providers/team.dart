import 'package:flutter/material.dart';
import '../models/job.dart';
import './auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Tim {
  final String namaTeam;
  final String idTeam;
  final String tugas;
  Tim({@required this.namaTeam, @required this.idTeam, @required this.tugas});
}

class Team with ChangeNotifier {
  Team() {
    getToken();
  }
  var userData;
  var _token;
  Future<void> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // print('tokennnnnnn');

    _token = prefs.getString('userToken');
    // userData = jsonDecode(loadedData);
    // print('user Data = $userData');
    // userData = json.decode({
    //   'token': loadedData});
  }

  Map<String, Job> _team = {
    'satu': Job(
        id: 'satu',
        title: 'WorkBench App Team',
        status: '',
        kendala: 'tidak ada',
        tanggal: '2020-11-20T00:00:00.000+00:00'),
    // 'dua': Job(
    //     id: 'dua',
    //     title: 'bikin app drawer',
    //     status: '',
    //     kendala: 'tidak ada',
    //     tanggal: ''),
    // 'tiga': Job(
    //     id: 'tiga',
    //     title: 'adding logic',
    //     status: '',
    //     kendala: 'tidak ada',
    //     tanggal: ''),
    // 'empat': Job(
    //     id: 'empat',
    //     title: 'bikin add job',
    //     status: '',
    //     kendala: 'tidak ada',
    //     tanggal: ''),
    // 'lima': Job(
    //     id: 'lima',
    //     title: 'bikin delete button',
    //     status: '',
    //     kendala: 'tidak ada',
    //     tanggal: ''),
    // 'enam': Job(
    //     id: 'enam',
    //     title: 'fixing bug',
    //     status: '',
    //     kendala: 'tidak ada',
    //     tanggal: ''),
    // 'tujuh': Job(
    //     id: 'tujuh',
    //     title: 'adjusting color',
    //     status: '',
    //     kendala: 'tidak ada',
    //     tanggal: ''),
  };
  Map<String, Job> get team {
    return {..._team};
  }

  Map<String, Job> _member = {
    'satu': Job(
        id: 'satu',
        title: 'Reyhan',
        status: '',
        kendala: 'tidak ada',
        tanggal: '2020-11-20T00:00:00.000+00:00'),
    'dua': Job(
        id: 'dua',
        title: 'Akbar rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr',
        status: '',
        kendala: 'tidak ada',
        tanggal: ''),
    'tiga': Job(
        id: 'tiga',
        title: 'Ghulam',
        status: '',
        kendala: 'tidak ada',
        tanggal: ''),
    // 'empat': Job(
    //     id: 'empat',
    //     title: 'bikin add job',
    //     status: '',
    //     kendala: 'tidak ada',
    //     tanggal: ''),
    // 'lima': Job(
    //     id: 'lima',
    //     title: 'bikin delete button',
    //     status: '',
    //     kendala: 'tidak ada',
    //     tanggal: ''),
    // 'enam': Job(
    //     id: 'enam',
    //     title: 'fixing bug',
    //     status: '',
    //     kendala: 'tidak ada',
    //     tanggal: ''),
    // 'tujuh': Job(
    //     id: 'tujuh',
    //     title: 'adjusting color',
    //     status: '',
    //     kendala: 'tidak ada',
    //     tanggal: ''),
  };
  Map<String, Job> get member {
    return {..._member};
  }

  Map<String, Tim> _teams = {};
  Map<String, Tim> get teams {
    return {..._teams};
  }

  Map<String, Job> _filteredJobs = {};

  Map<String, Job> get filteredJobs {
    return {..._filteredJobs};
  }

  // Future<void> fillFilteredJobsByStatus(String filter) async {
  //   _filteredJobs.clear();
  //   _jobs.forEach((key, value) {
  //     if (value.status == filter) {
  //       _filteredJobs.putIfAbsent(
  //           key,
  //           () => Job(
  //               id: value.id,
  //               title: value.title,
  //               status: value.status,
  //               tanggal: value.tanggal,
  //               kendala: value.kendala));
  //     }
  //   });
  //   notifyListeners();
  // }

  static const uri = 'http://9cd1e54dc762.ngrok.io';
  Future<void> fetchJob() async {
    const url = '$uri/api/teamusers';
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $_token'
    };
    final response = await http.get(
      url,
      headers: requestHeaders,
    );

    final extractedData = json.decode(response.body)['data'];
    if (extractedData == null) {
      return;
    }
    // print(extractedData);
    // final Map<String, Post> loadedPost = {};
    for (var item in extractedData) {
      _teams.putIfAbsent(
          '${item['id']}',
          // '${item['id']}${item['user_id']}',
          () => Tim(
              idTeam: item['id'].toString(),
              namaTeam: item['nama_team'],
              tugas: item['nama_tugas']));
    }
    notifyListeners();
    // print('fetch job user data ==== $userData');
    // print('${response.body}');
    // print(jobs);
  }

  Future<void> deleteJob(String id) async {
    // _jobs.remove(id);
    final url = '$uri/api/jobs/$id';
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $_token'
    };
    try {
      final response = await http.delete(url, headers: requestHeaders);
      print(response.body);
    } catch (e) {
      throw e;
    }
    await fetchJob();
    print('===== delete job ');
    notifyListeners();
  }

  Future<void> addJob({Job job, String token}) async {
    // _jobs.putIfAbsent(
    //     job.id,
    //     () => Job(
    //         id: job.id,
    //         title: job.title,
    //         status: '3',
    //         tanggal: '',
    //         kendala: job.kendala));
    const url = '$uri/api/jobs/create';
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $_token'
    };
    print('===== ${job.title}');
    try {
      final response = await http.post(url,
          headers: requestHeaders,
          body: json.encode({
            'kegiatan': job.title,
            'kendala': job.kendala,
            'status_id': '3',
          }));
      print(response.body);
    } catch (e) {
      throw e;
    }
    await fetchJob();
    // print('=== job with id : ${job.id} is added');
    notifyListeners();
  }

  Future<void> updateJob(String id, Job job) async {
    // _jobs.update(id, (value) => job);
    // _loadedPostById.update(id, (value) => job);
    final url = '$uri/api/jobs/$id';

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $_token'
    };

    print('===== ${job.title}');
    print('===== ${job.status}');

    try {
      final response = await http.put(url,
          headers: requestHeaders,
          body: json.encode({
            'kegiatan': job.title,
            'kendala': job.kendala,
            'status_id': job.status,
          }));
      print(response.body);
    } catch (e) {
      throw e;
    }

    // print('=== job with id : ${job.id} is added');
    await fetchJob();
    notifyListeners();
  }

  Map<String, Job> get loadedPostById {
    return {..._loadedPostById};
  }

  Map<String, Job> _loadedPostById = {
    // 'satu': Job(
    //     id: 'satu', title: 'ngoding', isCompleted: false, kendala: 'tidak ada'),
  };
  // Map<String, Job> findById(String id) {
  //   // loadedPostById.putIfAbsent(key, () => null)
  //   // lists.removeWhere((key, value) => key != id);
  //   _loadedPostById.clear();
  //   teams.forEach((key, value) {
  //     if (key == id) {
  //       print('=== inputing $id di team');
  //       _loadedPostById.putIfAbsent(
  //           '${value.id}',
  //           () => Tim(namaTeam: value., idTeam: null, tugas: null));
  //     }
  //     notifyListeners();
  //   });
  //   // print(loadedPostById.keys);

  //   return loadedPostById;
  // }
}
