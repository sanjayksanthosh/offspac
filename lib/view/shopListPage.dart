import 'package:flutter/material.dart';
import 'package:offspace/widgets/searchField.dart';
import 'package:offspace/widgets/topAppBar.dart';

class ShoplistPage extends StatelessWidget {
  const ShoplistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            child: Column(
          children: [TopAppBar()],
        )),
      ),
    );
  }
}
