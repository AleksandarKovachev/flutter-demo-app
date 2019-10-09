import 'package:flutter/material.dart';
import 'package:flutter_app/core/widgets/loading_widget.dart';
import 'package:flutter_app/core/widgets/message_display.dart';
import 'package:flutter_app/features/cat_fact/presentation/bloc/bloc.dart';
import 'package:flutter_app/features/cat_fact/presentation/widgets/cat_fact_display.dart';
import 'package:flutter_app/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatFactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return buildBody(context);
  }

  BlocProvider<CatFactBloc> buildBody(BuildContext context) {
    return BlocProvider(
      builder: (_) => sl<CatFactBloc>(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: BlocBuilder<CatFactBloc, CatFactState>(
            builder: (context, state) {
              if (state is Loading) {
                return LoadingWidget();
              } else if (state is Loaded) {
                return CatFactDisplay(catFacts: state.catFacts);
              } else if (state is Error) {
                return MessageDisplay(
                  message: state.message,
                );
              } else {
                BlocProvider.of<CatFactBloc>(context).dispatch(CatFactEvent());
                return MessageDisplay(
                  message: 'Loading cat facts!',
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
