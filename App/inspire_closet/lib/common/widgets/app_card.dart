import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import '../index.dart';

class AppCard extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;

  final Widget? cardTitle;
  final Widget? cardActions;
  final Widget? cardContent;
  final Widget? cardFooter;

  const AppCard({
    super.key,
    this.padding = const EdgeInsets.all(16),
    this.margin = const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
    this.cardTitle,
    this.cardActions,
    this.cardContent,
    this.cardFooter,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: AdaptiveTheme.of(context).modeChangeNotifier,
      builder: (_, mode, __) {
        final isDark = mode == AdaptiveThemeMode.dark;
        final theme = Theme.of(context);

        // 卡片颜色
        final backgroundColor = isDark
            ? theme.colorScheme.surfaceVariant.withOpacity(0.7) // 深色下用偏灰的卡片
            : Colors.white; // 浅色下纯白卡片更干净

        // 边框颜色
        final borderColor = isDark
            ? theme.dividerColor.withOpacity(0.2) // 深色低透明度边框
            : AppColors.border;

        // 阴影
        final boxShadow = isDark
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25), // 微弱暗阴影
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ]
            : [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ];

        return Container(
          margin: margin,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: borderColor, width: 0.8),
            boxShadow: boxShadow,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 顶部标题 & 操作按钮
              if (cardTitle != null || cardActions != null)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (cardTitle != null)
                        Expanded(
                          child: DefaultTextStyle.merge(
                            style: theme.textTheme.titleMedium,
                            child: cardTitle!,
                          ),
                        ),
                      if (cardActions != null) cardActions!,
                    ],
                  ),
                ),

              // 内容
              if (cardContent != null)
                Padding(
                  padding: padding,
                  child: DefaultTextStyle.merge(
                    style: theme.textTheme.bodyMedium,
                    child: cardContent!,
                  ),
                ),

              // 底部
              if (cardFooter != null)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    border: Border(top: BorderSide(color: borderColor)),
                  ),
                  child: DefaultTextStyle.merge(
                    style: theme.textTheme.bodySmall,
                    child: cardFooter!,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
