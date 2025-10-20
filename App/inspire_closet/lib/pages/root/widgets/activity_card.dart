import 'package:flutter/material.dart';
import 'package:inspire_closet/common/widgets/index.dart';

Widget activityCard() {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.indigo, Colors.blue],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      children: [
        Expanded(
          child: ListTile(
            title: Text("标题"),
            subtitle: Text("副标题"),
            textColor: Colors.white,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: AppButton(
            text: "按钮",
            borderRadius: BorderRadius.circular(50),
            onPressed: () {},
            filled: true,
            size: ButtonSize.small,
          ),
        ),
      ],
    ),
  );
}
