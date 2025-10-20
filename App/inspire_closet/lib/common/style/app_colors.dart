import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

/// Shadcn UI 风格颜色配置 (支持亮/暗模式)
class AppColors {
  // 静态颜色常量 - 用于主题定义
  static const Color primary = Color(0xFF111827);
  static const Color primaryForeground = Color(0xFFFFFFFF);
  static const Color secondary = Color(0xFFF3F4F6);
  static const Color secondaryForeground = Color(0xFF111827);
  static const Color destructive = Color(0xFFEF4444);
  static const Color destructiveForeground = Color(0xFFFFFFFF);
  static const Color border = Color(0xFFE5E7EB);

  // 动态颜色方法 - 根据上下文返回相应颜色
  static Color primaryDynamic(BuildContext context) =>
      _isDark(context) ? const Color(0xFFFFFFFF) : const Color(0xFF111827);
  static Color primaryForegroundDynamic(BuildContext context) =>
      _isDark(context) ? const Color(0xFF111827) : const Color(0xFFFFFFFF);

  // 次色
  static Color secondaryDynamic(BuildContext context) =>
      _isDark(context) ? const Color(0xFF1F2937) : const Color(0xFFF3F4F6);
  static Color secondaryForegroundDynamic(BuildContext context) =>
      _isDark(context) ? const Color(0xFFFFFFFF) : const Color(0xFF111827);

  // 强调色
  static Color accent(BuildContext context) =>
      _isDark(context) ? const Color(0xFF60A5FA) : const Color(0xFF3B82F6);
  static Color accentForeground(BuildContext context) =>
      _isDark(context) ? const Color(0xFF111827) : const Color(0xFFFFFFFF);

  // 错误色
  static Color destructiveDynamic(BuildContext context) =>
      _isDark(context) ? const Color(0xFFF87171) : const Color(0xFFEF4444);
  static Color destructiveForegroundDynamic(BuildContext context) =>
      _isDark(context) ? const Color(0xFF111827) : const Color(0xFFFFFFFF);

  // 卡片 / 输入框 / 边框
  static Color card(BuildContext context) =>
      _isDark(context) ? const Color(0xFF1C1C1E) : const Color(0xFFFFFFFF);
  static Color input(BuildContext context) =>
      _isDark(context) ? const Color(0xFF2C2C2E) : const Color(0xFFF9FAFB);
  static Color borderDynamic(BuildContext context) =>
      _isDark(context) ? const Color(0xFF2D2D2D) : const Color(0xFFE5E7EB);
  static Color ring(BuildContext context) =>
      _isDark(context) ? const Color(0xFF60A5FA) : const Color(0xFF3B82F6);

  // 背景 & 前景
  static Color background(BuildContext context) =>
      _isDark(context) ? const Color(0xFF18181B) : const Color(0xFFF9FAFB);
  static Color foreground(BuildContext context) =>
      _isDark(context) ? const Color(0xFFF8FAFC) : const Color(0xFF111827);

  // 文本
  static Color secondaryText(BuildContext context) =>
      _isDark(context) ? const Color(0xFF9CA3AF) : const Color(0xFF6B7280);
  static Color titleText(BuildContext context) =>
      _isDark(context) ? const Color(0xFFFFFFFF) : const Color(0xFF111827);

  /// 判断是否暗色模式
  static bool _isDark(BuildContext context) {
    return AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark;
  }
}
