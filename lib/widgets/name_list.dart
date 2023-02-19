import 'package:flutter/material.dart';
import 'package:offspace/models/names.dart';
import 'package:provider/provider.dart';

class NameList extends StatefulWidget {
  const NameList({super.key});

  @override
  State<NameList> createState() => _NameListState();
}

class _NameListState extends State<NameList> {
  @override
  Widget build(BuildContext context) {
    final names = Provider.of<List<Names>?>(context);

    return ListView.builder(
      itemCount: names?.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(names![index].name!),
      ),
    );
  }
}
