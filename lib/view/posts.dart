import 'package:apiintegrationflutter/controller/homecontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PostsView extends StatefulWidget {
  const PostsView({super.key});

  @override
  State<PostsView> createState() => _PostsViewState();
}

class _PostsViewState extends State<PostsView> {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts"),
      ),
      body: Column(
        children: [
          TextField(
            controller: titleController,
          ),
          TextField(
            controller: bodyController,
          ),
          ElevatedButton(
              onPressed: () {
                AddPostCall({
                  "title": titleController.text,
                  "body": bodyController.text,
                  "userId": 1,
                });
              },
              child: Text("Add Post"))
        ],
      ),
    );
  }

  AddPostCall(data) async {
    AlertDialog alert = AlertDialog(
      content: Row(children: [
        const CircularProgressIndicator(
          backgroundColor: Colors.red,
        ),
        Container(margin: EdgeInsets.only(left: 7), child: Text("Loading...")),
      ]),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
    var response = await addPost(data); //API call
    Navigator.pop(context);

    var result = "";
    if (response.statusCode == 200 || response.statusCode == 201) {
      result = "Post created successfully! ${response.statusCode}";
    } else {
      result = "Something went wrong! ${response.statusCode}";
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(result),
    ));
  }
}
