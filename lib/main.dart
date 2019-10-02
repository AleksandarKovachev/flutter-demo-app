import 'package:flutter/material.dart';
import 'package:flutter_app/data/moor_database.dart';
import 'package:flutter_app/data/post_api_service.dart';
import 'package:flutter_app/translations.dart';
import 'package:flutter_app/ui/global/theme/block/bloc.dart';
import 'package:flutter_app/ui/home/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

void main() {
  _setupLogging();
  runApp(MyApp());
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}

class MyApp extends StatelessWidget {
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
    return Provider(
        builder: (_) => PostApiService.create(),
        dispose: (_, PostApiService service) => service.client.dispose(),
        child: Provider(
          builder: (_) => AppDatabase(),
          child: MaterialApp(
            title: 'Flutter Demo',
            theme: state.themeData,
            home: HomePage(),
            localizationsDelegates: [
              const TranslationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: [
              const Locale('en', ''),
              const Locale('bg', 'BG'),
            ],
          ),
        ));
  }
}
