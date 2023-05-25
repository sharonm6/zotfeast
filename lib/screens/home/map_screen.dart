import 'package:flutter/material.dart';
import 'package:zotfeast/config/color_constants.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
    // return Scaffold(
    // appBar: AppBar(
    //   title: Text('Where are you going today'),
    //   centerTitle: true,
    //   backgroundColor: ColorConstants.zotfeastBrown,
    // ),//AppBar
    // body: Center(
    //   child: Image(
    //     image: NetworkImage('https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.yumpu.com%2Fen%2Fdocument%2Fview%2F5685316%2Fuci-campus-map-uc-irvine-today&psig=AOvVaw0SYMVr0aMmIQSfvjEsm3Mc&ust=1684617854895000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCNCsy9qogv8CFQAAAAAdAAAAABAd')
    //   ),//Image
    // ),//Center
    // ); //Scaffold
  }
}
