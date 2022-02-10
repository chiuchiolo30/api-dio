import 'package:api_dio/api/dio.dart';
import 'package:api_dio/api/http_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'API DIO',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'API DIO'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,   
        title: Text(widget.title),
      ),
      body: Center(       
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(       
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
             OutlinedButton(
               onPressed: () async {
                 await ApiDio().request('https://jsonplaceholder.typicode.com/posts', 
                  method: HttpMethod.post,
                  body: {
                    "title": 'foo',
                    "body": 'bar',
                    "userId": 1,
                  });
                 
               }, 
               child: Row(
                 children: const [
                   Expanded(child:  Text('POST', textAlign: TextAlign.center,)),
                 ],
               )
            ),
             OutlinedButton(
               onPressed: () async {
                  await ApiDio().request('https://jsonplaceholder.typicode.com/posts/1', 
                  method: HttpMethod.put,
                  body: {
                    "title": 'foo',
                    "body": 'bar',
                    "userId": 1,
                  });
               }, 
               child: Row(
                 children: const [
                   Expanded(child:  Text('PUT', textAlign: TextAlign.center,)),
                 ],
               )
            ),
             OutlinedButton(
               onPressed: () async{
                //  await ApiDio().request('pokemon/');
                 await ApiDio().request('pokemon/',queryParameters: {"offset":20, "limit":20});
                 
               }, 
               child: Row(
                 children: const [
                   Expanded(child:  Text('GET', textAlign: TextAlign.center,)),
                 ],
               )
            ),
           
             OutlinedButton(
               onPressed: () async {
                  await ApiDio().request('https://jsonplaceholder.typicode.com/posts/1', 
                  method: HttpMethod.patch,
                  body: {
                    "title": 'foo'                   
                  });
                 
               }, 
               child: Row(
                 children: const [
                   Expanded(child:  Text('PATH', textAlign: TextAlign.center,)),
                 ],
               )
            ),
             OutlinedButton(
               onPressed: () async{
                 await ApiDio().request('https://jsonplaceholder.typicode.com/posts/1', 
                  method: HttpMethod.delete,
                 );
               }, 
               child: Row(
                 children: const [
                   Expanded(child:  Text('DELETE', textAlign: TextAlign.center,)),
                 ],
               )
            ),
           
            ],
          ),
        ),
      ),
     
    );
  }
}
