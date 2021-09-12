import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:kevlar_yelek/connection.dart';
import 'package:kevlar_yelek/led.dart';
import 'package:kevlar_yelek/numaraG%C3%BCncelle.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kevlar Yelek',
      theme: ThemeData(
        primaryColor: Colors.green.shade900,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FutureBuilder(
        future: FlutterBluetoothSerial.instance.requestEnable(),
        builder: (context, future) {
          if (future.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Container(
                height: double.infinity,
                child: Center(
                  child: Icon(
                    Icons.bluetooth_disabled,
                    size: 200.0,
                    color: Colors.blue,
                  ),
                ),
              ),
            );
          } else if (future.connectionState == ConnectionState.done) {
            // return MyHomePage(title: 'Flutter Demo Home Page');
            return Home();
          } else {
            return Home();
          }
        },
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    var WColor;

    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("images/tsk_image.jpg"),
          fit: BoxFit.cover,
        )),
        // width: screenSize.width,
        // height: screenSize.height,
        // decoration: BoxDecoration(
        //   color: WColor.WGR_BLUE,
        //   image: DecorationImage(
        //     colorFilter: ColorFilter.mode(
        //         Colors.black.withOpacity(0.1), BlendMode.dstATop),
        //     image: AssetImage("assets/mainBackground.jpg"),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: Scaffold(
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(color: const Color(0xFF33691E)),
                  child: Text("Ayarlar"),
                ),
                ListTile(
                  title: Text("Telefon Numarasını Güncelle"),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NumaraGuncelle()));
                  },
                ),
                ListTile(
                  title: const Text("data2"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
          appBar: AppBar(
            title: Text('Bağlantı Sayfası'),
          ),
          body: SelectBondedDevicePage(
            onCahtPage: (device1) {
              BluetoothDevice device = device1;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ChatPage(server: device);
                  },
                ),
              );
            },
          ),
        ));
  }
}
