import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("url_launcher"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () async {
                  const url = "https://www.google.com";
                  if (await canLaunchUrlString(url)) {
                    launchUrlString(url);
                  }
                },
                child: Text("Apri link")),
            SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () async {
                  const url = "tel:3491337819";
                  if (await canLaunchUrlString(url)) {
                    launchUrlString(url);
                  }
                },
                child: Text("Effettua Chiamata")),
            SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () async {
                  const url = "https://www.google.com";
                  if (await canLaunchUrlString(url)) {
                    launchUrlString(url);
                  }
                },
                child: Text("Invia SMS")),
            SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () async {
                  final Uri emailLaunchUri = Uri(
                    scheme: 'mailto',
                    path: 'giovanni.rigoni@smartmobile.it',
                  );
                  await launchUrl(emailLaunchUri);
                },
                child: Text("Invia Mail")),
          ],
        ),
      ),
    );
  }
}
