import 'package:apiintegrationflutter/controller/homecontroller.dart';
import 'package:apiintegrationflutter/model/userModel.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: getUserList(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                var myuser = snapshot.data[index] as user;
                return ListTile(
                  title: Text("${myuser.name}"),
                  subtitle: Text("${myuser.email}"),
                  trailing: Text("${myuser.address?.city}"),
                );
              },
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
