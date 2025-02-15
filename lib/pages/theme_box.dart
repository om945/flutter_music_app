import 'package:flutter/material.dart';

class NewBox extends StatelessWidget {
  final Widget? child;
  const NewBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(color: Theme.of(context)
      .colorScheme.background,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [BoxShadow(
        // Dark shadow on bottom right
        color: Colors.grey.shade500,
        blurRadius: 15,
        offset: Offset(4,4),
        ),
        // Light shadow on top left
        BoxShadow(
          color: Colors.white,
          blurRadius: 15,
          offset: Offset(-4,-4),
        )
      ]
      ),
      padding: EdgeInsets.all(12),
      child: child,
    );
  }
}