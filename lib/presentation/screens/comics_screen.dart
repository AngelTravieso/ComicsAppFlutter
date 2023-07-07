import 'package:comics_app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ComicsScreen extends StatefulWidget {
  const ComicsScreen({super.key});

  @override
  State<ComicsScreen> createState() => _ComicsScreenState();
}

class _ComicsScreenState extends State<ComicsScreen> {
  bool isListView = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'ComicBook',
                    style: GoogleFonts.kanit().copyWith(
                      fontSize: 40,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  height: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
                      'Latest Issues',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        height: 0.5,
                      ),
                    ),
                    const Spacer(),
                    CustomOutlinedButton(
                      label: 'List',
                      icon: Icons.list,
                      onPressed: () {
                        setState(() {
                          isListView = true;
                        });
                      },
                    ),
                    CustomOutlinedButton(
                      label: 'Grid',
                      icon: Icons.grid_view,
                      onPressed: () {
                        setState(() {
                          isListView = false;
                        });
                      },
                    ),
                  ],
                ),
                const Divider(
                  height: 2,
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: isListView ? _ListComicView() : _GridComicView(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ListComicView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 50,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Container(
            width: 100,
            height: 100,
            child: const Placeholder(),
          ),
          title: const Text(
            'DeadPool: Secret Agent',
            textAlign: TextAlign.center,
          ),
          subtitle: const Text(
            'October 03, 2018',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          onTap: () {},
        );
      },
    );
  }
}

class _GridComicView extends StatelessWidget {
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
