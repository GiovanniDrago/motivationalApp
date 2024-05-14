import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 148, 87, 87)),
        useMaterial3: true,
      ),
      home: Home(),
    ));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text('Text test'),
          ElevatedButton(
              onPressed: () => {},
              child: Text('btn to click'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.amber)),
          Container(
            color: Colors.cyan,
            padding: EdgeInsets.all(12),
            child: Text('Hi everyone'),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: Text('+'),
        backgroundColor: Colors.green,
      ),
    );
  }
}
