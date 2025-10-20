import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../index.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final bgColor = AppColors.background(context);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            bgColor,
            bgColor,
            bgColor,
            bgColor,
            bgColor.withValues(alpha: 0.8),
            bgColor.withValues(alpha: 0.4),
            bgColor.withValues(alpha: 0.0),
          ],
        ),
      ),
      child: AppBar(
        title: Text("Inspire Closet"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.white10,
        elevation: 0,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(Get.mediaQuery.padding.top - 24);
}
