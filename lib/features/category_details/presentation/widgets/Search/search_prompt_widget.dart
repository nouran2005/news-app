import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPromptWidget extends StatelessWidget {
  const SearchPromptWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: Center(
        child: Text(
          "Search for articles...",
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
