import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  final String title;

  const CustomAppbar({Key? key, required this.title}) : super(key: key);

  @override
  PreferredSize build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: AppBar(
        centerTitle: true,
        shape: const Border(
          bottom: BorderSide(
            color: Color(0xff454c54),
            width: 1,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(title),
      ),
    );
  }
}
