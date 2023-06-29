// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sistema_peccioli/page/home_page.dart';
import 'package:sistema_peccioli/repository/repositories.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => Repository(),
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Rubik',
        ),
        home: HomePage(),
      ),
    );
  }
}
