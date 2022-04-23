import 'package:flutter/material.dart';

class MeniItem extends StatefulWidget {
  final title;
  final icon;
  final onTap;
  MeniItem({this.onTap, required this.icon, required this.title});

  @override
  State<MeniItem> createState() => _MeniItemState();
}

class _MeniItemState extends State<MeniItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        onTap: widget.onTap,
        title: Text(
          widget.title,
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
        ),
        trailing: Icon(
          widget.icon,
          color: Colors.white,
          size: 25,
        ),
      ),
    );
  }
}
