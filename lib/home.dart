import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:bethel/user_model.dart';
import 'package:bethel/utils/database_helper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ready"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            tooltip: 'Logout',
            onPressed: () async {
              final box = GetStorage();
              box.write('loggedIn', false);
              Navigator.pushNamed(context, "/");
            },
          ),
        ],
      ),
      body: FutureBuilder<User>(
        future: DatabaseHelper.instance.getUser(),
        builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.fast_forward,
                    color: Colors.green,
                    size: 100.0,
                  ),
                  Text("Just Listen"),
                ],
              ),
            );
          }
          return snapshot.data != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.fast_forward,
                      color: Colors.green,
                      size: 100.0,
                    ),
                    Text("Shuffle Play"),
                  ],
                )
              : Center(
                  child: Text(
                    "No Data",
                  ),
                );
        },
      ),
    );
  }
}
