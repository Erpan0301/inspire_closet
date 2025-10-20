import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

import '../index.dart';

/// 公共底部导航栏
class AppBottomNavbar extends StatelessWidget {
  /// 当前选中的索引（外部控制）
  final int currentIndex;

  /// 切换 tab 回调
  final ValueChanged<int> onTabChange;

  const AppBottomNavbar({
    super.key,
    required this.currentIndex,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: AdaptiveTheme.of(context).modeChangeNotifier,
      builder: (_, mode, __) {
        final isDark = mode == AdaptiveThemeMode.dark;

        final bgColor = isDark ? const Color(0xFF1C1C1E) : Colors.white;
        final borderColor = isDark
            ? Colors.white.withValues(alpha: 0.1)
            : Colors.black.withValues(alpha: 0.05);
        final inactiveColor = isDark ? Colors.white70 : Colors.black87;
        final activeColor = isDark ? Colors.black : Colors.white;
        final tabBgColor = isDark ? Colors.white : AppColors.primary;

        return Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
          ).add(const EdgeInsets.only(bottom: 20)),
          decoration: BoxDecoration(
            color: bgColor,
            border: Border.all(color: borderColor, width: 0.5),
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.18),
                blurRadius: 15,
                offset: const Offset(0, 15),
              ),
            ],
          ),
          padding: const EdgeInsets.all(12),
          child: GNav(
            selectedIndex: currentIndex,
            onTabChange: onTabChange,
            rippleColor: Colors.grey.withValues(alpha: 0.3),
            hoverColor: Colors.grey.withValues(alpha: 0.1),
            gap: 8,
            activeColor: activeColor, // 选中时 icon & 文字颜色
            iconSize: 24,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: const Duration(milliseconds: 400),
            tabBackgroundColor: tabBgColor, // ✅ 选中时背景色
            color: inactiveColor, // 未选中时颜色
            tabs: const [
              GButton(icon: Icons.home, text: '首页'),
              GButton(icon: Icons.star, text: '收藏'),
              GButton(icon: Icons.search, text: '搜索'),
              GButton(icon: Icons.person, text: '我'),
            ],
          ),
        );
      },
    );
  }
}
