import 'package:corona_fighter/src/utils/shadows.dart';
import 'package:flutter/material.dart';

class CustomExpansionTile extends StatelessWidget {
  final List<Widget> children;
  final IconData icon;
  final String title;

  const CustomExpansionTile(
      {Key key, this.children, @required this.icon, @required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);
    return Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [Shadows.cardShadow]),
        child: Theme(
            data: theme,
            child: ExpansionTile(
                key: key,
                leading: Icon(icon),
                title: Text(title),
                children: children.toList())));
  }
}
