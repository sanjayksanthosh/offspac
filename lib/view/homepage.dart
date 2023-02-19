import 'package:flutter/material.dart';
import 'package:offspace/models/names.dart';
import 'package:offspace/view-model/auth.dart';
import 'package:offspace/view-model/database.dart';
import 'package:offspace/widgets/categoryTile.dart';
import 'package:offspace/widgets/topAppBar.dart';
import 'package:provider/provider.dart';
import 'package:offspace/widgets/name_list.dart';

import '../widgets/drawer.dart';
import '../widgets/searchField.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Names>?>.value(
      value: DatabaseServices().names,
      initialData: null,
      child: Scaffold(
        drawer: Drawer(child: Build_drawer()),
        appBar: AppBar(
          // title: Text('Homepage'),
          actions: [],
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TopAppBar(),
              SizedBox(height: 20),
              Text(
                "Category",
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 100,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Row(
                          children: [
                            CategoryTile(),
                            SizedBox(
                              width: 20,
                            )
                          ],
                        )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
