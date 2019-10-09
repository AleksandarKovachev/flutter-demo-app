import 'package:flutter/material.dart';
import 'package:flutter_app/core/widgets/loading_widget.dart';
import 'package:flutter_app/core/widgets/message_display.dart';
import 'package:flutter_app/features/nuber_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:flutter_app/features/nuber_trivia/presentation/bloc/number_trivia_state.dart';
import 'package:flutter_app/features/nuber_trivia/presentation/widgets/widgets.dart';
import 'package:flutter_app/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NumberTriviaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return buildBody(context);
  }

  BlocProvider<NumberTriviaBloc> buildBody(BuildContext context) {
    return BlocProvider(
      builder: (_) => sl<NumberTriviaBloc>(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              SizedBox(height: 10),
              // Top half
              BlocBuilder<NumberTriviaBloc, NumberTriviaState>(
                builder: (context, state) {
                  if (state is Loading) {
                    return LoadingWidget();
                  } else if (state is Loaded) {
                    return TriviaDisplay(numberTrivia: state.trivia);
                  } else if (state is Error) {
                    return MessageDisplay(
                      message: state.message,
                    );
                  }
                  return MessageDisplay(
                    message: 'Start searching!',
                  );
                },
              ),
              SizedBox(height: 20),
              // Bottom half
              TriviaControls()
            ],
          ),
        ),
      ),
    );
  }
}
