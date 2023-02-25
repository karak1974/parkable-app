import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parkable',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final url = 'https://parkable.sooki.dev/';
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    launchURL();
  }

  Future<void> launchURL() async {
    if (await canLaunch(url)) {
      setState(() {
        _isLoading = false;
      });
    } else {
      throw 'Nem sikerült megnyitni: $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : WebView(
              initialUrl: url,
              javascriptMode: JavascriptMode.unrestricted,
            ),
    );
  }
}
