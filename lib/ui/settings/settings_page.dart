import 'package:flutter/material.dart';
import 'package:flutter_app/application.dart';
import 'package:flutter_app/translations.dart';
import 'package:flutter_app/ui/global/theme/app_themes.dart';
import 'package:flutter_app/ui/global/theme/block/bloc.dart';
import 'package:flutter_app/ui/global/theme/block/theme_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared_preferences_helper.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SettingsState();
}

class SettingsState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Translations.of(context).text('settings')),
      ),
      body: Column(
        children: <Widget>[
          FutureBuilder<bool>(
              future: SharedPreferencesHelper.getIsDarkTheme(),
              initialData: true,
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                return SwitchListTile(
                    title: Text(
                        Translations.of(context).text('settings_theme_change')),
                    value: snapshot.data,
                    onChanged: (value) {
                      setState(() {
                        SharedPreferencesHelper.setIsDarkTheme(value);
                        BlocProvider.of<ThemeBloc>(context).dispatch(
                            ThemeChanged(
                                theme: value
                                    ? AppTheme.DarkTheme
                                    : AppTheme.LightTheme));
                      });
                    },
                    secondary: const Icon(Icons.lightbulb_outline));
              }),
          FutureBuilder<String>(
              future: SharedPreferencesHelper.getSelectedLanguage(),
              initialData: 'en',
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                return ListTile(
                  leading: Icon(Icons.language),
                  title: Text(Translations.of(context)
                      .text('settings_language_change')),
                  trailing: DropdownButton(
                    value: snapshot.data,
                    items: applic.supportedLanguages.map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      applic.onLocaleChanged(new Locale(value, ''));
                      setState(() {
                        SharedPreferencesHelper.setSelectedLanguage(value);
                      });
                    },
                  ),
                  onTap: () {},
                );
              }),
        ],
      ),
    );
  }
}
