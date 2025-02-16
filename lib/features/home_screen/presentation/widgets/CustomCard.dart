import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/home_screen/data/models/Categories.dart';
import 'package:news_app/features/home_screen/presentation/widgets/ContentCategory.dart';

class NewsCategoryCard extends StatelessWidget {
  final CategoryModel categoryModel;
  final int index;
  final void Function(String , String) onTap;
  
  const NewsCategoryCard({
    required this.categoryModel,
    required this.index,
    super.key, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 0, 0, 0), 
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (index.isOdd) _buildImage(),
            ContentCategory(
              categoryModel: categoryModel,
              index: index,
              onTap: onTap
            ),
            if (index.isEven) _buildImage(), 
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30.r),
      child: Image.asset(
        categoryModel.imagePath,
        height: 150.h,
        width: 150.w,
        fit: BoxFit.cover,
      ),
    );
  }
}