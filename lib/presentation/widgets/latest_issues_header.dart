import 'package:comics_app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class LatestIssuesHeader extends StatelessWidget {
  const LatestIssuesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          const Divider(),
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
                onPressed: () {},
              ),
              CustomOutlinedButton(
                label: 'Grid',
                icon: Icons.grid_view,
                onPressed: () {},
              ),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}
