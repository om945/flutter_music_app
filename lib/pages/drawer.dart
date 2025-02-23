import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/about_page.dart';
import 'package:flutter_application_1/pages/setting.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // ignore: deprecated_member_use
      backgroundColor: Theme.of(context).colorScheme.background,
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(child: Center(
              child: Icon(Icons.music_note,size: 100,
              color: Theme.of(context).colorScheme.secondary,),
            ),),
            Padding(
              padding: const EdgeInsets.only(left: 25,top: 25),
              child: ListTile(
                      title: Text("Home"),
                      leading: Icon(Icons.home),   
                      onTap: () {
                        Navigator.pop(context);
                      }         
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25,top: 25),
              child: ListTile(
                      title: Text("Settings"),
                      leading: Icon(Icons.settings),   
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Setting()));
                      }         
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25,top: 25),
              child: ListTile(
                      title: Text("About"),
                      leading: Icon(Icons.info),   
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => AboutPage()));
                      }         
              ),
            )
          ],
        ),
      ),
      );
  }
}