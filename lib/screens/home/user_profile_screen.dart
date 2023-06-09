import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
// import 'package:http/http.dart';
import 'package:http/browser_client.dart';
import 'package:intl/intl.dart';
import 'package:zotfeast/config/color_constants.dart';
import 'package:zotfeast/config/constants.dart';
import 'package:zotfeast/components/rounded_rectangle.dart';
import 'package:zotfeast/services/auth.dart';
import 'package:zotfeast/models/user.dart';
import 'package:zotfeast/services/database.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:icalendar_parser/icalendar_parser.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:convert';

class UserProfileScreen extends StatefulWidget {
  UserProfileScreen(
      {Key? key, required User user, required DatabaseService dbService})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

Future<String> sendICSFileToBackend(
    Uint8List fileBytes, String fileName) async {
  final ics = String.fromCharCodes(fileBytes);

  final formatter = DateFormat('yyyyMMdd');
  final date = formatter.format(DateTime.now());
  final queryParameters = {
    'date': date,
  };

  final url =
      Uri.parse('http://zotfeast-backend.vercel.app/api/calendar/parse');
  final body = {'date': date, 'ics': ics};

  final response = await http.post(url,
      body: jsonEncode(body), headers: {'Content-Type': 'application/json'});

  final schedule = json.decode(response.body)['schedule'];

  if (response.statusCode == 200) {
    print('File uploaded successfully');
  } else {
    print('File upload failed');
  }

  return schedule;
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  List<PlatformFile>? _paths;

  final AuthService _auth = AuthService();

  final nameController = TextEditingController();
  late bool _hascar;

  late bool _isDarkMode;
  late bool _cookiesSaved;
  late bool _localStorageSaved;
  late bool _geolocationEnabled;
  late bool _isVegetarian;
  late bool _isVegan;
  late String _schedule;

  late User _user;
  @override
  void initState() {
    _user = widget._user;
    nameController.text = _user.name;
    _hascar = widget._user.hasCar;
    _isDarkMode = widget._user.isDarkMode;
    _cookiesSaved = widget._user.cookiesSaved;
    _localStorageSaved = widget._user.localStorageSaved;
    _geolocationEnabled = widget._user.geolocationEnabled;
    _isVegetarian = widget._user.isVegetarian;
    _isVegan = widget._user.isVegan;
    _schedule = widget._user.schedule;

    super.initState();
  }

  void pickFiles() async {
    try {
      _paths = (await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowMultiple: false,
        onFileLoading: (FilePickerStatus status) => print(status),
        allowedExtensions: ['ics'],
      ))
          ?.files;
    } catch (e) {
      print(e.toString());
    }
    if (!mounted) {
      return;
    }
    if (!mounted) {
      return;
    }
    setState(() {
      if (_paths != null) {
        if (_paths != null) {
          sendICSFileToBackend(_paths!.first.bytes!, _paths!.first.name)
              .then((result) {
            setState(() {
              _schedule = result;
            });
            print(_schedule);
            DatabaseService(uid: _user.uid).updateUserData(
                _user.name, _user.email,
                hasCar: _hascar,
                isDarkMode: _isDarkMode,
                cookiesSaved: _cookiesSaved,
                localStorageSaved: _localStorageSaved,
                geolocationEnabled: _geolocationEnabled,
                isVegetarian: _isVegetarian,
                isVegan: _isVegan,
                schedule: _schedule,
                task: _user.task);
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 5.0),
              Text(
                'Hey! \nIts You!',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  //fontFamily: 'PlayFairDisplay',
                ),
              ),
              SizedBox(height: 5.0),
              Center(
                child: Text("Name",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              SizedBox(height: 5.0),
              Center(
                child: RoundedRectangle(
                  borderRadiusAmt: 15.0,
                  containerColor: ColorConstants.zotfeastBrown,
                  paddingInset: const EdgeInsets.all(8.0),
                  childWidget: TextFormField(
                    decoration: simpleInputDecoration.copyWith(
                      hintText: 'Name',
                    ),
                    style: const TextStyle(
                      fontSize: 22.0,
                      color: Color(0xFFF8F2ED),
                    ),
                    validator: (val) => val != null && val.isEmpty
                        ? 'Please enter a valid name'
                        : null,
                    controller: nameController,
                  ),
                ),
              ),
              SizedBox(height: 5.0),
              TextButton(
                  child: Text(
                    'Confirm Changes',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  onPressed: () async => {
                        await DatabaseService(uid: _user.uid).updateUserData(
                            nameController.text, _user.email,
                            hasCar: _hascar,
                            isDarkMode: _isDarkMode,
                            cookiesSaved: _cookiesSaved,
                            localStorageSaved: _localStorageSaved,
                            geolocationEnabled: _geolocationEnabled,
                            isVegetarian: _isVegetarian,
                            isVegan: _isVegan,
                            schedule: _schedule,
                            task: _user.task)
                      }),
              SizedBox(height: 10.0),
              Center(
                child: Text("Import Schedule",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              SizedBox(height: 10.0),
              Center(
                child: RoundedRectangle(
                  borderRadiusAmt: 15.0,
                  containerColor: ColorConstants.zotfeastBrown,
                  paddingInset: const EdgeInsets.all(8.0),
                  childWidget: Row(children: [
                    Text("Select File",
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Color(0xFFF8F2ED),
                          //fontFamily: 'Lato'
                        ),
                        textAlign: TextAlign.left),
                    InkWell(
                      onTap: pickFiles,
                      child: Padding(
                        padding: EdgeInsets.only(left: 265),
                        child: Icon(
                          Icons.download,
                          size: 25,
                          color: Color(0xFFF8F2ED),
                        ),
                      ),
                    )
                  ]),
                ),
              ),
              SizedBox(height: 10.0),
              Center(
                child: Text("Preferences",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              SizedBox(height: 5.0),
              Center(
                child: RoundedRectangle(
                  borderRadiusAmt: 15.0,
                  containerColor: ColorConstants.zotfeastBrown,
                  paddingInset: const EdgeInsets.all(8.0),
                  childWidget: Column(children: [
                    CheckboxListTile(
                        title: Text('Has Car',
                            style: TextStyle(
                              fontSize: 22,
                              color: Color(0xFFF8F2ED),
                            )),
                        value: _hascar,
                        activeColor: Color(0xFFD2C3B3),
                        checkColor: Color(0xFFF8F2ED),
                        onChanged: (value) {
                          setState(() {
                            _hascar = !_hascar;
                          });
                        }),
                    CheckboxListTile(
                        title: Text('Dark Mode',
                            style: TextStyle(
                              fontSize: 22,
                              color: Color(0xFFF8F2ED),
                              //fontFamily: 'Lato'),
                            )),
                        value: _isDarkMode,
                        activeColor: Color(0xFFD2C3B3),
                        checkColor: Color(0xFFF8F2ED),
                        onChanged: (value) {
                          setState(() {
                            _isDarkMode = !_isDarkMode;
                          });
                        }),
                    CheckboxListTile(
                        title: Text('Save Cookies',
                            style: TextStyle(
                              fontSize: 22,
                              color: Color(0xFFF8F2ED),
                              //fontFamily: 'Lato'),
                            )),
                        value: _cookiesSaved,
                        activeColor: Color(0xFFD2C3B3),
                        checkColor: Color(0xFFF8F2ED),
                        onChanged: (value) {
                          setState(() {
                            _cookiesSaved = !_cookiesSaved;
                          });
                        }),
                    CheckboxListTile(
                        title: Text('Save Local Storage',
                            style: TextStyle(
                              fontSize: 22,
                              color: Color(0xFFF8F2ED),
                              //fontFamily: 'Lato'),
                            )),
                        value: _localStorageSaved,
                        activeColor: Color(0xFFD2C3B3),
                        checkColor: Color(0xFFF8F2ED),
                        onChanged: (value) {
                          setState(() {
                            _localStorageSaved = !_localStorageSaved;
                          });
                        }),
                    CheckboxListTile(
                        title: Text('Enable Geolocation',
                            style: TextStyle(
                              fontSize: 22,
                              color: Color(0xFFF8F2ED),
                              //fontFamily: 'Lato'),
                            )),
                        value: _geolocationEnabled,
                        activeColor: Color(0xFFD2C3B3),
                        checkColor: Color(0xFFF8F2ED),
                        onChanged: (value) {
                          setState(() {
                            _geolocationEnabled = !_geolocationEnabled;
                          });
                        }),
                    CheckboxListTile(
                        title: Text('Vegetarian',
                            style: TextStyle(
                              fontSize: 22,
                              color: Color(0xFFF8F2ED),
                              //fontFamily: 'Lato'),
                            )),
                        value: _isVegetarian,
                        activeColor: Color(0xFFD2C3B3),
                        checkColor: Color(0xFFF8F2ED),
                        onChanged: (value) {
                          setState(() {
                            _isVegetarian = !_isVegetarian;
                          });
                        }),
                    CheckboxListTile(
                        title: Text('Vegan',
                            style: TextStyle(
                              fontSize: 23,
                              color: Color(0xFFF8F2ED),
                              //fontFamily: 'Lato'),
                            )),
                        value: _isVegan,
                        activeColor: Color(0xFFD2C3B3),
                        checkColor: Color(0xFFF8F2ED),
                        onChanged: (value) {
                          setState(() {
                            _isVegan = !_isVegan;
                          });
                        }),
                    TextButton(
                        child: Text(
                          'Confirm Changes',
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        onPressed: () async => {
                              await DatabaseService(uid: _user.uid)
                                  .updateUserData(_user.name, _user.email,
                                      hasCar: _hascar,
                                      isDarkMode: _isDarkMode,
                                      cookiesSaved: _cookiesSaved,
                                      localStorageSaved: _localStorageSaved,
                                      geolocationEnabled: _geolocationEnabled,
                                      isVegetarian: _isVegetarian,
                                      isVegan: _isVegan,
                                      schedule: _schedule,
                                      task: _user.task)
                            }),
                  ]),
                ),
              ),
              SizedBox(height: 20.0),
              Center(
                child: TextButton(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 10.0),
                    child: Text(
                      'Logout',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                  onPressed: () async {
                    await _auth.signOut();
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: ColorConstants.zotfeastBrown),
                ),
              ),
              SizedBox(height: 20.0)
            ]));
  }
}
