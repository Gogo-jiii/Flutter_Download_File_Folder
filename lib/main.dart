import 'dart:html' as html;
import 'dart:io';
import 'dart:typed_data';
import 'package:archive/archive.dart';
import 'package:archive/archive_io.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
            child: Row(
          children: [
            ElevatedButton(
                onPressed: () {
                  downloadFile();
                },
                child: const Text("Download File")),
            const SizedBox(
              width: 32,
            ),
            ElevatedButton(
                onPressed: () {
                  downloadFolder();
                },
                child: const Text("Download Folder")),
          ],
        )));
  }

  void downloadFile() {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Downloading...")));

    // Get the path for the file
    String path =
        'assets/files/my_file.txt'; // Change this to the path of your file

    // Create a URL for the file
    html.AnchorElement anchorElement = html.AnchorElement(href: path);
    anchorElement.setAttribute("download", "");
    anchorElement.click();
  }

  void downloadFolder() async{
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Downloading...")));
    String path =
        'assets/files/my_folder.zip';
    html.window.open(path, "text");
  }

}
