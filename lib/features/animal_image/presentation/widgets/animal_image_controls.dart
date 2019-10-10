import 'package:flutter/material.dart';
import 'package:flutter_app/features/animal_image/presentation/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimalImageControls extends StatefulWidget {
  const AnimalImageControls({
    Key key,
  }) : super(key: key);

  @override
  _AnimalImageControlsState createState() => _AnimalImageControlsState();
}

class _AnimalImageControlsState extends State<AnimalImageControls> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: RaisedButton(
                child: Text('Dog'),
                color: Theme.of(context).accentColor,
                textTheme: ButtonTextTheme.primary,
                onPressed: () {
                  BlocProvider.of<AnimalImageBloc>(context)
                      .dispatch(DogImage());
                },
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: RaisedButton(
                child: Text('Fox'),
                onPressed: () {
                  BlocProvider.of<AnimalImageBloc>(context)
                      .dispatch(FoxImage());
                },
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: RaisedButton(
                child: Text('Cat'),
                onPressed: () {
                  BlocProvider.of<AnimalImageBloc>(context)
                      .dispatch(CatImage());
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}
