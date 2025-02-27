import 'package:flutter/material.dart';
import 'package:frontend/modules/theme/view_model/theme_view_model.dart';
import 'package:provider/provider.dart';

class ThemeButtom extends StatelessWidget {
  const ThemeButtom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.watch<ThemeViewModel>().isDarkMode;
    return IconButton.filledTonal(
      onPressed: () {
        context.read<ThemeViewModel>().changeTheme();
      },
      icon: Icon(
        isDarkMode ? Icons.light_mode : Icons.dark_mode,
      ),
    );
  }
}
