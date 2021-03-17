import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_one/domains/thing.dart';
import 'package:project_one/models/things_model.dart';
import 'package:project_one/widgets/things_app_bar.dart';
import 'package:provider/provider.dart';

class ThingsOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          ThingsAppBar(
            title: 'Things',
          ),
          SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => _MyListItem(index),
                  childCount: 10))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Provider.of<ThingsModel>(context, listen: false)
            .addThing(Thing(id: 'asdf', name: 'asdf', description: 'asdf')),
      ),
    );
  }
}

class _MyListItem extends StatelessWidget {
  final int index;

  _MyListItem(this.index, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme.headline6;

    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/details/${index}'),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: LimitedBox(
            maxHeight: 80,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(index.toString(), style: textTheme),
                    ),
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    Expanded(
                      child: Text(index.toString(),
                          style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
