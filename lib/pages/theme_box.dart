import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/themepage.dart/theme_proivder.dart';
import 'package:provider/provider.dart';

class NewBox extends StatelessWidget {
  final Widget? child;
  const NewBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    // is dark mode
    bool isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return Container(
      decoration:  BoxDecoration(color: Theme.of(context)
      // ignore: deprecated_member_use
      .colorScheme.background,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [BoxShadow(
        // Dark shadow on bottom right
        color: isDarkMode ? Colors.grey.shade500 : Colors.grey.shade800,
        blurRadius: 12,
        offset: Offset(1,1),
        ),
        // Light shadow on top left
        BoxShadow(
          color: isDarkMode ? Colors.black: Colors.white,
          blurRadius: 15,
          offset: Offset(-2,-2),
        )
      ]
      ),
      padding: EdgeInsets.all(12),
      child: child,
    );
  }
}