import 'package:flutter/material.dart';
import 'package:zotfeast/config/color_constants.dart';
import 'package:zotfeast/components/rounded_rectangle.dart';
import 'package:zotfeast/services/auth.dart';
import 'package:zotfeast/models/user.dart';

class UserProfileScreen extends StatefulWidget {
  UserProfileScreen({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final AuthService _auth = AuthService();

  bool _checkbox = false;
  bool _checkbox_hascar = false;
  bool _checkbox_darkmode = false;
  bool _checkbox_savecookies = false;
  bool _checkbox_savelocalstorage = false;
  bool _checkbox_geolocation = false;
  bool _checkbox_vegetarian = false;
  bool _checkbox_vegan = false;

  late User _user;
  @override
  void initState() {
    _user = widget._user;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
            padding: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.only(right: 1),
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 25,
                        color: Color(0xFFB5A599),
                      ),
                    ),
                  ),
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
                      childWidget: Row(children: [
                        Text(_user.name,
                            style: TextStyle(
                              fontSize: 22.0,
                              color: Color(0xFFF8F2ED),
                              //fontFamily: 'Lato'
                            ),
                            textAlign: TextAlign.left),
                        InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.only(left: 230),
                            child: Icon(
                              Icons.mode_edit_outline_outlined,
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
                          onTap: () {},
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
                                  //fontFamily: 'Lato'),
                                )),
                            value: _checkbox_hascar,
                            activeColor: Color(0xFFD2C3B3),
                            checkColor: Color(0xFFF8F2ED),
                            onChanged: (value) {
                              setState(() {
                                _checkbox_hascar = !_checkbox_hascar;
                              });
                            }),
                        CheckboxListTile(
                            title: Text('Dark Mode',
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Color(0xFFF8F2ED),
                                  //fontFamily: 'Lato'),
                                )),
                            value: _checkbox_darkmode,
                            activeColor: Color(0xFFD2C3B3),
                            checkColor: Color(0xFFF8F2ED),
                            onChanged: (value) {
                              setState(() {
                                _checkbox_darkmode = !_checkbox_darkmode;
                              });
                            }),
                        CheckboxListTile(
                            title: Text('Save Cookies',
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Color(0xFFF8F2ED),
                                  //fontFamily: 'Lato'),
                                )),
                            value: _checkbox_savecookies,
                            activeColor: Color(0xFFD2C3B3),
                            checkColor: Color(0xFFF8F2ED),
                            onChanged: (value) {
                              setState(() {
                                _checkbox_savecookies = !_checkbox_savecookies;
                              });
                            }),
                        CheckboxListTile(
                            title: Text('Save Local Storage',
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Color(0xFFF8F2ED),
                                  //fontFamily: 'Lato'),
                                )),
                            value: _checkbox_savelocalstorage,
                            activeColor: Color(0xFFD2C3B3),
                            checkColor: Color(0xFFF8F2ED),
                            onChanged: (value) {
                              setState(() {
                                _checkbox_savelocalstorage =
                                    !_checkbox_savelocalstorage;
                              });
                            }),
                        CheckboxListTile(
                            title: Text('Enable Geolocation',
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Color(0xFFF8F2ED),
                                  //fontFamily: 'Lato'),
                                )),
                            value: _checkbox_geolocation,
                            activeColor: Color(0xFFD2C3B3),
                            checkColor: Color(0xFFF8F2ED),
                            onChanged: (value) {
                              setState(() {
                                _checkbox_geolocation = !_checkbox_geolocation;
                              });
                            }),
                        CheckboxListTile(
                            title: Text('Vegetarian',
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Color(0xFFF8F2ED),
                                  //fontFamily: 'Lato'),
                                )),
                            value: _checkbox_vegetarian,
                            activeColor: Color(0xFFD2C3B3),
                            checkColor: Color(0xFFF8F2ED),
                            onChanged: (value) {
                              setState(() {
                                _checkbox_vegetarian = !_checkbox_vegetarian;
                              });
                            }),
                        CheckboxListTile(
                            title: Text('Vegan',
                                style: TextStyle(
                                  fontSize: 23,
                                  color: Color(0xFFF8F2ED),
                                  //fontFamily: 'Lato'),
                                )),
                            value: _checkbox_vegan,
                            activeColor: Color(0xFFD2C3B3),
                            checkColor: Color(0xFFF8F2ED),
                            onChanged: (value) {
                              setState(() {
                                _checkbox_vegan = !_checkbox_vegan;
                              });
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
                ])));
  }
}
