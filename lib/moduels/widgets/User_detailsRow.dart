// ignore_for_file: file_names

import 'package:flutter/material.dart';

class UserDetails extends StatelessWidget {
  const UserDetails(
      {super.key,
      required this.icon,
      required this.title,
      required this.subtitle,
      this.trailing,
      this.ontap});

  final IconData icon;
  final String title, subtitle;
  final Widget? trailing;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 28,
        color: const Color.fromRGBO(0, 101, 111, 1),
      ),
      title: Text(title, style: Theme.of(context).textTheme.titleMedium),
      subtitle: Text(subtitle, style: Theme.of(context).textTheme.labelMedium),
      trailing: trailing,
      onTap: ontap,
    );
  }
}
