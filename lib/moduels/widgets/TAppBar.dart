// ignore_for_file: file_names

import 'package:flutter/material.dart';

class TAppBar extends StatefulWidget implements PreferredSizeWidget {
  const TAppBar({
    super.key,
    this.title,
    this.actions,
    this.loadingIcon,
    this.loadingOnPressed,
    this.showBackArrow = false,
    this.stack,
  });

  final Widget? title;
  final List<Widget>? actions;
  final bool showBackArrow;
  final IconData? loadingIcon;
  final VoidCallback? loadingOnPressed;
  final Widget? stack;

  @override
  State<TAppBar> createState() => _TAppBarState();

  @override
  Size get preferredSize => throw UnimplementedError();
}

class _TAppBarState extends State<TAppBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        leading: widget.showBackArrow
            ? IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_left,
                  size: 45,
                  color: Colors.grey,
                ))
            : widget.loadingIcon != null
                ? IconButton(
                    onPressed: widget.loadingOnPressed,
                    icon: Icon(
                      widget.loadingIcon,
                      size: 15,
                      color: Colors.black,
                    ))
                : null,
        title: widget.title,
        actions: widget.actions,
      ),
    );
  }

  State<StatefulWidget> createState() {
    throw UnimplementedError();
  }
}
