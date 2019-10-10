import 'package:flutter/material.dart';
import 'package:flutter_app/core/widgets/loading_widget.dart';
import 'package:flutter_app/core/widgets/message_display.dart';
import 'package:flutter_app/features/animal_image/presentation/bloc/bloc.dart';
import 'package:flutter_app/features/animal_image/presentation/widgets/widgets.dart';
import 'package:flutter_app/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimalImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return buildBody(context);
  }

  BlocProvider<AnimalImageBloc> buildBody(BuildContext context) {
    return BlocProvider(
      builder: (_) => sl<AnimalImageBloc>(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              BlocBuilder<AnimalImageBloc, AnimalImageState>(
                builder: (context, state) {
                  if (state is Loading) {
                    return LoadingWidget();
                  } else if (state is Loaded) {
                    return AnimalImageDisplay(animalImage: state.animalImage);
                  } else if (state is Error) {
                    return MessageDisplay(
                      message: state.message,
                    );
                  }
                  return MessageDisplay(
                    message: 'Choose an animal to show you an image of it!',
                  );
                },
              ),
              SizedBox(height: 20),
              // Bottom half
              AnimalImageControls()
            ],
          ),
        ),
      ),
    );
  }
}
