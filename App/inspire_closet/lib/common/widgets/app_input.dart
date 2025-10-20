import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

import '../index.dart';

class AppInput extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;

  const AppInput({super.key, required this.hint, this.controller});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: AdaptiveTheme.of(context).modeChangeNotifier,
      builder: (_, mode, child) {
        final isDark = mode == AdaptiveThemeMode.dark;
        final theme = Theme.of(context);

        return Container(
          decoration: BoxDecoration(
            color: isDark ? theme.colorScheme.surface : AppColors.card(context),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              if (isDark)
                BoxShadow(
                  color: Colors.white.withValues(alpha: 0.03),
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                )
              else
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 4,
                  offset: const Offset(0, 6),
                ),
            ],
          ),
          child: TextField(
            controller: controller,
            style: theme.textTheme.bodyMedium,
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: theme.hintColor),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: isDark
                      ? theme.dividerColor.withValues(alpha: 0.6)
                      : AppColors.border,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.primary, width: 1),
              ),
            ),
          ),
        );
      },
    );
  }
}
