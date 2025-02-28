// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:news_app/features/home_screen/data/models/Categories.dart';
import 'package:news_app/features/home_screen/presentation/widgets/CustomCard.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({
    Key? key,
    required this.onTap,
  }) : super(key: key);
  final void Function(String, String) onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Choose your interests \nfor personalized news updates.',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: 29.h),

          
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: CategoryModel.AllCategories.length,
              itemBuilder: (context, index) => NewsCategoryCard(
                onTap: onTap,
                categoryModel: CategoryModel.AllCategories[index],
                index: index,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
