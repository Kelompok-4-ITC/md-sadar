import 'package:flutter/material.dart';

class CustomScaffold {
  static Widget defaultScaffold({
    required BuildContext context,
    String? label,
    Widget? content,
    AppBar? customAppBar,
  }) {
    return Scaffold(
      appBar: label != null
          ? AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.keyboard_arrow_left,
                  size: 35,
                ),
              ),
              title: Text(
                label,
                style: const TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              centerTitle: true,
            )
          : customAppBar,
      body: content,
    );
  }
}
