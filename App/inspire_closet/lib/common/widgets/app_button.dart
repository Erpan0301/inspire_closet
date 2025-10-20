import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum ButtonSize { small, medium, large }

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool filled; // true = 实心, false = outline
  final ButtonSize size;
  final BorderRadiusGeometry? borderRadius;
  final TextStyle? textStyle;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.filled = true,
    this.size = ButtonSize.medium,
    this.borderRadius,
    this.textStyle,
  });

  EdgeInsetsGeometry get _padding {
    switch (size) {
      case ButtonSize.small:
        return const EdgeInsets.symmetric(horizontal: 12, vertical: 8);
      case ButtonSize.medium:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 12);
      case ButtonSize.large:
        return const EdgeInsets.symmetric(horizontal: 20, vertical: 16);
    }
  }

  double get _fontSize {
    switch (size) {
      case ButtonSize.small:
        return 12;
      case ButtonSize.medium:
        return 15;
      case ButtonSize.large:
        return 17;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: AdaptiveTheme.of(context).modeChangeNotifier,
      builder: (_, mode, __) {
        final isDark = mode == AdaptiveThemeMode.dark;

        final bgColor = filled
            ? (isDark ? Colors.white : Colors.black)
            : Colors.transparent;
        final fgColor = filled
            ? (isDark ? Colors.black : Colors.white)
            : (isDark ? Colors.white : Colors.black);
        final borderColor = filled
            ? Colors.transparent
            : Colors.grey.withOpacity(0.3);

        return ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: bgColor,
            foregroundColor: fgColor,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(8),
              side: BorderSide(color: borderColor, width: 1),
            ),
            padding: _padding,
          ),
          child: Text(
            text,
            style:
                textStyle ??
                TextStyle(
                  fontSize: _fontSize,
                  fontWeight: FontWeight.w500,
                  color: fgColor,
                ),
          ),
        );
      },
    );
  }
}

/// Icon Button
class AppIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final ButtonSize size;
  final bool filled;

  const AppIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.size = ButtonSize.medium,
    this.filled = true,
  });

  double get _buttonSize {
    switch (size) {
      case ButtonSize.small:
        return 32;
      case ButtonSize.medium:
        return 44;
      case ButtonSize.large:
        return 52;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: AdaptiveTheme.of(context).modeChangeNotifier,
      builder: (_, mode, __) {
        final isDark = mode == AdaptiveThemeMode.dark;

        final bgColor = filled
            ? (isDark ? Colors.white : Colors.black)
            : Colors.transparent;
        final iconColor = filled
            ? (isDark ? Colors.black : Colors.white)
            : (isDark ? Colors.white : Colors.black);
        final borderColor = filled
            ? Colors.transparent
            : Colors.grey.withOpacity(0.3);

        return InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(_buttonSize / 2),
          child: Container(
            height: _buttonSize,
            width: _buttonSize,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(_buttonSize / 2),
              border: Border.all(color: borderColor, width: 1),
            ),
            child: Icon(icon, color: iconColor, size: _buttonSize * 0.6),
          ),
        );
      },
    );
  }
}

class AppTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonSize size;
  final TextStyle? textStyle;

  const AppTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.size = ButtonSize.medium,
    this.textStyle,
  });

  EdgeInsetsGeometry get _padding {
    switch (size) {
      case ButtonSize.small:
        return const EdgeInsets.symmetric(horizontal: 8, vertical: 4);
      case ButtonSize.medium:
        return const EdgeInsets.symmetric(horizontal: 12, vertical: 6);
      case ButtonSize.large:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 8);
    }
  }

  double get _fontSize {
    switch (size) {
      case ButtonSize.small:
        return 12;
      case ButtonSize.medium:
        return 15;
      case ButtonSize.large:
        return 17;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: AdaptiveTheme.of(context).modeChangeNotifier,
      builder: (_, mode, __) {
        final isDark = mode == AdaptiveThemeMode.dark;
        final fgColor = isDark ? Colors.white : Colors.black;

        return CupertinoButton(
          onPressed: onPressed,
          padding: _padding,
          child: Text(
            text,
            style:
                textStyle ??
                TextStyle(
                  fontSize: _fontSize,
                  fontWeight: FontWeight.w500,
                  color: fgColor,
                ),
          ),
        );
      },
    );
  }
}
