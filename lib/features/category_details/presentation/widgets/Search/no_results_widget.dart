import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoResultsWidget extends StatelessWidget {
  const NoResultsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "No articles found.",
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          color: Colors.redAccent,
        ),
      ),
    );
  }
}
