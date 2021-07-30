import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'QRGenerator.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String code = "";
  String getcode = "";

  Future scanbarcode() async {
    getcode =
        await FlutterBarcodeScanner.scanBarcode("#009922", "CANCEL", true);
    setState(() {
      code = getcode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("QR Scanner"),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: "Scan QR",
                child: Container(
                  width: ((MediaQuery.of(context).size.width) / 2) - 45,
                  height: 50,
                  child: OutlineButton(
                    focusColor: Colors.red,
                    highlightColor: Colors.blue,
                    hoverColor: Colors.lightBlue[100],
                    splashColor: Colors.blue,
                    borderSide: BorderSide(
                      width: 3,
                      color: Colors.blue,
                    ),
                    shape: StadiumBorder(),
                    child: Text(
                      "Scan QR",
                      style: TextStyle(fontSize: 17),
                    ),
                    onPressed: () {
                      scanbarcode();
                    },
                  ),
                ),
              ),
              Text(code),
              SizedBox(
                width: 25,
              ),
              Container(
                width: ((MediaQuery.of(context).size.width) / 2) - 45,
                height: 50,
                child: OutlineButton(
                  focusColor: Colors.red,
                  highlightColor: Colors.blue,
                  hoverColor: Colors.lightBlue[100],
                  splashColor: Colors.blue,
                  borderSide: BorderSide(
                    width: 3,
                    color: Colors.blue,
                  ),
                  shape: StadiumBorder(),
                  child: Text(
                    "Generate QR",
                    style: TextStyle(fontSize: 17),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => QRGenerator()));
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
