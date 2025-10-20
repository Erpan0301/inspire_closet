import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/index.dart';
import 'index.dart';
import 'widgets/activity_card.dart';

class RootPage extends GetView<RootController> {
  const RootPage({super.key});

  // 主视图
  Widget _buildView() {
    return ListView(
      padding: EdgeInsets.all(12).add(
        EdgeInsetsGeometry.only(
          bottom: 100,
          top: Get.mediaQuery.padding.top + kToolbarHeight,
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: AppInput(hint: '请输入内容'),
        ),

        SizedBox(
          width: Get.width,
          child: AppButton(text: '按钮', onPressed: () {}),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: activityCard(),
        ),

        AppTextButton(text: 'Text Button', onPressed: () {}),

        AppCard(
          cardTitle: const Text(
            "Booking Detail",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          cardActions: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
          cardContent: const Text(
            "Heidi's Kitchen & Cafe\nBahnhofpl. 7, Zürich",
          ),
          cardFooter: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppTextButton(
                onPressed: () {},
                text: "Cancel",
                size: ButtonSize.small,
              ),
              const SizedBox(width: 8),
              AppButton(
                onPressed: () {},
                text: 'Confirm',
                size: ButtonSize.small,
              ),
            ],
          ),
        ),
        for (int i = 0; i < 5; i++)
          AppCard(
            cardTitle: Text("Title $i"),
            cardContent: Text("Content $i"),
            cardFooter: Text("Footer $i"),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RootController>(
      init: RootController(),
      id: "root",
      builder: (_) {
        return AppLayout(
          body: _buildView(),

          /// 外部传入 AppBar 配置
          title: const Text("Inspire Closet"),
          leading: IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
          actions: [
            IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          ],

          /// 外部传入底部导航栏
          bottomNavigationBar: AppBottomNavbar(
            currentIndex: controller.state.count,
            onTabChange: controller.increment,
          ),
        );
      },
    );
  }
}
