import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/home_screen/data/models/Categories.dart';

// ignore: must_be_immutable
class ContentCategory extends StatelessWidget {
  ContentCategory({
    Key? key,
    required this.categoryModel,
    required this.index,
    required this.onTap,
  }) : super(key: key);
  final CategoryModel categoryModel;
  final int index;
  final void Function(String, String) onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){onTap(categoryModel.id, categoryModel.title);},
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              categoryModel.title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 30.h),
            SizedBox(
        height: 50.h, 
        width: 145.w, 
        child: Stack(
          children: [
            
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimary,  
                  borderRadius: BorderRadius.circular(30.r), 
                ),
                alignment: index.isEven ? Alignment.center : Alignment.centerLeft,
                padding: index.isEven ? EdgeInsets.only(left: 30.w) : EdgeInsets.only(left: 20.w),
                child: Text(
                  "View All",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
      
            
            Align(
              alignment: index.isOdd ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                width: 48.w,
                height: 48.h,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,  
                  shape: BoxShape.circle, 
                ),
                child:index.isOdd ? Icon(Icons.arrow_forward_ios, size: 20, color:Theme.of(context).colorScheme.secondary,) : Icon(Icons.arrow_back_ios, size: 20, color: Theme.of(context).colorScheme.secondary),
              ),
            ),
          ],
        ),
      ),
          ],
        ),
      ),
    );
  }
}
