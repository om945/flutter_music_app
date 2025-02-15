import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/themepage.dart/theme_proivder.dart';
import 'package:provider/provider.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Container(
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Dark Mode"),

            CupertinoSwitch(value: Provider.of
            <ThemeProvider>(context,listen: false).isDarkMode, 
            onChanged: (value) => Provider.of
            <ThemeProvider>(context,listen: false).toggleTheme())
          ],
        ),
      ),
    );
  }
}