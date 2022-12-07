import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Uncomment lines 3 and 6 to view the visual layout at runtime.
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
  // debugPaintSizeEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Center(
      child: Container(
        padding: const EdgeInsets.all(32),
        child: Row(
          children: [
            Expanded(
              /*1*/
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /*2*/
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: const Text(
                      'Ứng dụng CNTT VNPT Sơn La',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            /*3*/
          ],
        ),
      ),
    );
    final Uri _url = Uri.parse('https://quytm.000webhostapp.com/login/');
    Future<void> _launchUrl() async {
      if (!await launchUrl(_url)) {
        throw 'Could not launch $_url';
      }
    }

    Widget buttonSection = Center(
      child: Container(
        padding: const EdgeInsets.all(40),
        child: ElevatedButton(
          onPressed: _launchUrl,
          child: const Text('Truy cập'),
        ),
      ),
    );
    Widget creditSection = const Center(
      child: Text('Copyright © VNPT Sơn La'),
    );

    Widget list = CustomScrollView(
      shrinkWrap: true,
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.only(left: 40),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                const Text("BẢO DƯỠNG HẠ TẦNG"),
                const Text('Media'),
                const Text('Quản lý phương tiện'),
                const Text('Báo Cáo Phát Triển Thuê Bao'),
                const Text('CACTI'),
                const Text('Khảo sát CNTT'),
              ],
            ),
          ),
        ),
      ],
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VNPT Sơn La',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('VNPT Sơn La'),
        ),
        body: Column(
          children: [
            Image.asset(
              'images/vnpt.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            list,
            buttonSection,
            const Spacer(),
            Expanded(
                child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: creditSection)),
          ],
        ),
      ),
    );
  }
}
