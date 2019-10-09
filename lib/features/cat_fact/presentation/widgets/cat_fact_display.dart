import 'package:flutter/material.dart';
import 'package:flutter_app/features/cat_fact/domain/entities/cat_fact.dart';

class CatFactDisplay extends StatelessWidget {
  final List<CatFact> catFacts;

  const CatFactDisplay({
    Key key,
    @required this.catFacts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: catFacts.length,
        padding: EdgeInsets.all(8),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            child: ListTile(
              title: Text(
                catFacts[index].text,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
      ),
    );
  }
}
