import 'package:comics_app/presentation/blocs/layout_bloc/layout_bloc.dart';
import 'package:comics_app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LatestIssuesHeader extends StatelessWidget {
  const LatestIssuesHeader({super.key});

  void changeLayoutMode(BuildContext context, [bool isGridMode = true]) {
    context.read<LayoutBloc>().add(ChangeLayout(isGridMode));
  }

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
                selectedColor: context.select((LayoutBloc layout) =>
                    layout.state.isGridLayoutMode ? Colors.grey : null),
                onPressed: () => changeLayoutMode(context, false),
              ),
              CustomOutlinedButton(
                label: 'Grid',
                icon: Icons.grid_view,
                selectedColor: context.select((LayoutBloc layout) =>
                    layout.state.isGridLayoutMode ? null : Colors.grey),
                onPressed: () => changeLayoutMode(context),
              ),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}
