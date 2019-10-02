import 'package:flutter/material.dart';
import 'package:flutter_app/translations.dart';
import 'package:flutter_app/ui/global/theme/app_themes.dart';
import 'package:flutter_app/ui/global/theme/block/bloc.dart';
import 'package:flutter_app/ui/global/theme/block/theme_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SettingsState();
}

class SettingsState extends State<SettingsPage> {
  bool isDarkTheme;

  @override
  void initState() {
    super.initState();
    isDarkTheme = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SwitchListTile(
        title: Text(Translations.of(context).text('settings_theme_change')),
        value: isDarkTheme,
        onChanged: (value) {
          setState(() {
            isDarkTheme = value;
            BlocProvider.of<ThemeBloc>(context).dispatch(ThemeChanged(
                theme: value ? AppTheme.DarkTheme : AppTheme.LightTheme));
          });
        },
        secondary: const Icon(Icons.lightbulb_outline),
      ),
    );
  }
}
