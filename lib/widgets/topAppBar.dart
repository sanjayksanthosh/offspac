import 'package:flutter/material.dart';
import 'package:offspace/widgets/searchField.dart';

class TopAppBar extends StatelessWidget {
  const TopAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(child: Icon(Icons.menu)),
        SearchField(),
      ],
    );
  }
}
