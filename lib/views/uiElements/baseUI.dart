import 'package:flutter/material.dart';

class BaseUi extends StatelessWidget {
  final Widget child;
  final Widget? floatingActionButton;
  final AppBar? appBar;
  final Color? color;
  final bool? bottom;
  final bool? allowBackButton;
  final bool? safeTop;
  final String? backgroundImage;
  final bool hasBackgroundImage;

  const BaseUi({
    required this.child,
    super.key,
    this.allowBackButton,
    this.floatingActionButton,
    this.appBar,
    this.color,
    this.bottom,
    this.safeTop,
    this.backgroundImage,
    this.hasBackgroundImage = false,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return allowBackButton ?? true;
        },
        child: hasBackgroundImage == true
            ? Scaffold(
                appBar: appBar,
                body: SafeArea(
                  top: safeTop ?? false,
                  bottom: bottom ?? false,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          backgroundImage!,
                        ),
                      ),
                    ),
                    child: child,
                  ),
                ),
                floatingActionButton: floatingActionButton,
              )
            : Scaffold(
                extendBodyBehindAppBar: true,
                appBar: appBar,
                body: SafeArea(
                  bottom: false,
                  top: safeTop ?? false,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: color ?? Colors.transparent,
                    child: child,
                  ),
                ),
                floatingActionButton: floatingActionButton,
              ));
  }
}
