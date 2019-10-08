import 'package:flutter/material.dart';
import 'package:flutter_app/core/service/post_api_service.dart';
import 'package:flutter_app/core/service/number_trivia_service.dart';
import 'package:flutter_app/data/moor_database.dart';
import 'package:flutter_app/translations.dart';
import 'package:flutter_app/ui/global/theme/block/bloc.dart';
import 'package:flutter_app/ui/home/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

import 'injection_container.dart' as di;
import 'shared_preferences_helper.dart';

typedef void LocaleChangeCallback(Locale locale);

void main() async {
  _setupLogging();
  await di.init();
  runApp(MyApp());
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SpecificLocalizationDelegate _localeOverrideDelegate;

  @override
  void initState() {
    super.initState();
    Translations.onLocaleChanged = onLocaleChange;
    _localeOverrideDelegate =
        new SpecificLocalizationDelegate(Locale('en', ''));
    _setLocale();
  }

  onLocaleChange(Locale locale) {
    setState(() {
      _localeOverrideDelegate = new SpecificLocalizationDelegate(locale);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: _buildWithTheme,
      ),
    );
  }

  Widget _buildWithTheme(BuildContext context, ThemeState state) {
    return MultiProvider(
      providers: [
        Provider(
          builder: (_) => PostApiService.create(),
          dispose: (_, PostApiService service) => service.client.dispose(),
        ),
        Provider(
          builder: (_) => NumberTriviaService.create(),
          dispose: (_, NumberTriviaService service) => service.client.dispose(),
        ),
        Provider(
          builder: (_) => AppDatabase(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: state.themeData,
        home: HomePage(),
        localizationsDelegates: [
          _localeOverrideDelegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: Translations.supportedLocales(),
      ),
    );
  }

  _setLocale() async {
    String locale = await SharedPreferencesHelper.getSelectedLanguage();
    Translations.onLocaleChanged(Locale(locale, ''));
  }
}
