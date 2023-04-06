import 'package:fatima_admin/Helpers/CustomColors.dart';
import 'package:flutter/material.dart';

class WAAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget leading;
  final List<Widget> actions;

  const WAAppBar({
    Key? key,
    this.title = "",
    this.leading = const SizedBox.shrink(),
    this.actions = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: CustomColors.primary,
      leading: leading,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
