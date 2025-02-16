// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CategoryDetailsWidget extends StatelessWidget {
  const CategoryDetailsWidget({
    Key? key,
    required this.categoryID,
  }) : super(key: key);
  final String categoryID;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('CategoryDetailsWidget'),
    );
  }
}
