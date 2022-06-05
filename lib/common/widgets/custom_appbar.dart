import 'package:flutter/material.dart';
import 'package:tabata/theme/colors.dart';

class CustomAppbar extends StatelessWidget {
  final String title;
  IconButton? rightButton;

  CustomAppbar({Key? key, required this.title, this.rightButton})
      : super(key: key);

  @override
  PreferredSize build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: AppBar(
        centerTitle: true,
        shape: const Border(
          bottom: BorderSide(
            color: tabataGrey,
            width: 1,
          ),
        ),
        backgroundColor: Colors.transparent,
        actions: [if (rightButton != null) rightButton!],
        elevation: 0,
        title: Text(title),
      ),
    );
  }
}
