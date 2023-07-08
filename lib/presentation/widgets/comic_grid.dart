import 'package:flutter/material.dart';

class ComicGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 50,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 20,
        mainAxisExtent: 225,
      ),
      itemBuilder: (context, index) {
        return Container(
          child: const Column(
            children: <Widget>[
              Placeholder(
                fallbackHeight: 125,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'DeadPool: Secret Agent',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'DeadPool #3',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'October 03, 2018',
                style: TextStyle(
                  color: Colors.grey,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
