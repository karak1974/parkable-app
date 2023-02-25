import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class Palette { 
  static const MaterialColor dark = const MaterialColor( 
    0xffffffff,//100% 
    const <int, Color>{ 
      50: const Color(0xffe6e6e6),//10% 
      100: const Color(0xffcccccc),//20% 
      200: const Color(0xffb3b3b3),//30% 
      300: const Color(0xff999999),//40% 
      400: const Color(0xff808080),//50% 
      500: const Color(0xff666666),//60% 
      600: const Color(0xff4c4c4c),//70% 
      700: const Color(0xff333333),//80% 
      800: const Color(0xff191919),//90%
      900: const Color(0xff10172A),//base 
    }, 
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parkable',
      theme: ThemeData(
        primarySwatch: Palette.dark,
        scaffoldBackgroundColor: Palette.dark[900],
      ),
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
          : SafeArea(
              top: true,
              left: false,
              right: false,
              bottom: false,
              child: WebView(
                initialUrl: url,
                userAgent: "Mozilla/5.0 (platform; rv:geckoversion) Gecko/geckotrail Firefox/110",
                javascriptMode: JavascriptMode.unrestricted,
              ),
            ),
    );
  }
}
