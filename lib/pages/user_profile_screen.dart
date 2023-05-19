import 'package:flutter/material.dart';

class UserProfileScreen extends StatefulWidget {
  UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {  

  bool _checkbox = false;
  bool _checkbox_hascar = false;
  bool _checkbox_darkmode = false;
  bool _checkbox_savecookies = false;
  bool _checkbox_savelocalstorage = false;
  bool _checkbox_geolocation = false;
  bool _checkbox_vegetarian = false;
  bool _checkbox_vegan = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F2ED),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
            InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.only(right:1),
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
                fontFamily: 'PlayFairDisplay',
              ),
            ),
            SizedBox(height:5.0),
            
            Center(
              child: Text("Name",
              style:TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              )),
            ),
            SizedBox(height:5.0),
      
            Center(
              child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Container(
                  color: Color(0xFFD2C3B3),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(children: [
                      Text("Alice Johnson",
                          style: TextStyle(
                            fontSize: 22.0, 
                            color: Color(0xFFF8F2ED),
                            fontFamily: 'Lato'
                            ),
                          textAlign: TextAlign.left),
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.only(left:230),
                          child: Icon(
                        Icons.mode_edit_outline_outlined,
                        size: 25,
                        color: Color(0xFFF8F2ED),
                          ),
                        ),
                      )
                    ]),
                  )),
            ),
        ),
        SizedBox(height:10.0),

        Center(
              child: Text("Import Schedule",
              style:TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              )),
            ),
      
            SizedBox(height:10.0),
            Center(
              child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Container(
                  color: Color(0xFFD2C3B3),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(children: [
                      Text("Select File",
                          style: TextStyle(
                            fontSize: 22.0, 
                            color: Color(0xFFF8F2ED),
                            fontFamily: 'Lato'
                            ),
                          textAlign: TextAlign.left),
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.only(left:265),
                          child: Icon(
                        Icons.download,
                        size: 25,
                        color: Color(0xFFF8F2ED),
                          ),
                        ),
                      )
                    ]),
                  )),
            ),
        ),
            SizedBox(height:10.0),
            Center(
              child: Text("Preferences",
              style:TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              )),
            ),
            SizedBox(height:5.0),
            Center(
              child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Container(
                  color: Color(0xFFD2C3B3),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        CheckboxListTile(
                          title: Text('Has Car',
                          style: TextStyle(
                            fontSize:22,
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
                          }
                        ),
                        CheckboxListTile(
                          title: Text('Dark Mode',
                          style: TextStyle(
                            fontSize:22,
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
                          }
                        ),
                        CheckboxListTile(
                          title: Text('Save Cookies',
                          style: TextStyle(
                            fontSize:22,
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
                          }
                        ),
                        CheckboxListTile(
                          title: Text('Save Local Storage',
                          style: TextStyle(
                            fontSize:22,
                            color: Color(0xFFF8F2ED),
                           //fontFamily: 'Lato'),
                          )),
                          value: _checkbox_savelocalstorage,
                          activeColor: Color(0xFFD2C3B3),
                         checkColor: Color(0xFFF8F2ED),
                          onChanged: (value) {
                            setState(() {
                              _checkbox_savelocalstorage = !_checkbox_savelocalstorage;
                          }); 
                          }
                        ),
                        CheckboxListTile(
                          title: Text('Enable Geolocation',
                          style: TextStyle(
                            fontSize:22,
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
                          }
                        ),
                        CheckboxListTile(
                          title: Text('Vegetarian',
                          style: TextStyle(
                            fontSize:22,
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
                          }
                        ),
                        // CheckboxListTile(
                        //   title: Text('Vegan',
                        //   style: TextStyle(
                        //     fontSize:23,
                        //     color: Color(0xFFF8F2ED),
                        //    //fontFamily: 'Lato'),
                        //   )),
                        //   value: _checkbox_vegan,
                        //   activeColor: Color(0xFFD2C3B3),
                        //  checkColor: Color(0xFFF8F2ED),
                        //   onChanged: (value) {
                        //     setState(() {
                        //       _checkbox_vegan= !_checkbox_vegan;
                        //   }); 
                        //   }
                        // ),
                    ]),
                  )),
            ),
            ),
          ]
        )
          ),
        );
  }
}
