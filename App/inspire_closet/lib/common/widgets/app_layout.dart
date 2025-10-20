import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soft_edge_blur/soft_edge_blur.dart';

class AppLayout extends StatelessWidget {
  final Widget body;

  /// 顶部 AppBar 参数
  final Widget? title;
  final List<Widget>? actions;
  final Widget? leading;
  final bool showAppBar;

  /// 底部导航栏
  final Widget? bottomNavigationBar;

  /// 边缘模糊
  final List<EdgeBlur>? edgeBlurs;

  const AppLayout({
    super.key,
    required this.body,
    this.title,
    this.actions,
    this.leading,
    this.showAppBar = true,
    this.bottomNavigationBar,
    this.edgeBlurs,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: AdaptiveTheme.of(context).modeChangeNotifier,
      builder: (_, mode, child) {
        final isDark = mode == AdaptiveThemeMode.dark;
        return Stack(
          children: [
            /// 可滚动的内容 + 模糊层
            SoftEdgeBlur(
              edges:
                  edgeBlurs ??
                  [
                    EdgeBlur(
                      type: EdgeType.topEdge,
                      size: 140,
                      sigma: isDark ? 30 : 15,
                      tileMode: TileMode.repeated,
                      tintColor: isDark ? Colors.black54 : Colors.white38,

                      controlPoints: [
                        ControlPoint(
                          position: 0.5,
                          type: ControlPointType.visible,
                        ),
                        ControlPoint(
                          position: 1,
                          type: ControlPointType.transparent,
                        ),
                        ControlPoint(
                          position: 1.2,
                          type: ControlPointType.transparent,
                        ),
                      ],
                    ),
                  ],
              child: Scaffold(
                extendBody: true,
                extendBodyBehindAppBar: true,
                body: SafeArea(bottom: false, top: false, child: body),
                bottomNavigationBar: bottomNavigationBar,
              ),
            ),

            /// 顶层 AppBar，可选
            if (showAppBar)
              Positioned(
                top: -15,
                left: 0,
                right: 0,
                child: AnnotatedRegion<SystemUiOverlayStyle>(
                  value: SystemUiOverlayStyle.light,
                  child: AppBar(
                    systemOverlayStyle: isDark
                        ? SystemUiOverlayStyle.light
                        : SystemUiOverlayStyle.dark,
                    leadingWidth: 60,
                    leading: leading,
                    title: title,
                    actions: actions,
                    centerTitle: true,
                    backgroundColor: Colors.transparent,
                    surfaceTintColor: Colors.transparent,
                    elevation: 0,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
