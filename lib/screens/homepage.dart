import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var jsonList;
  var url = 'https://reqres.in/api/users?page=2';
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      var response = await Dio().get(url);
      if (response.statusCode == 200) {
        setState(() {
          jsonList = response.data['data'] as List;
        });
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }



  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: jsonList?.length ?? 0,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${jsonList[index]['first_name']}'),
          );
        },
      ),
    );
  }
}
