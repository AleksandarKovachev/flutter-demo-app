import 'package:equatable/equatable.dart';
import 'package:flutter_app/ui/global/theme/app_themes.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ThemeEvent extends Equatable {
  const ThemeEvent(List<AppTheme> list) : super();
}

class ThemeChanged extends ThemeEvent {
  final AppTheme theme;

  ThemeChanged({
    @required this.theme,
  }) : super([theme]);

  @override
  List<Object> get props => [theme];
}
