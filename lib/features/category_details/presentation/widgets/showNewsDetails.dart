import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/category_details/domain/entities/ArticlesEntity/ArticleEntity.dart';
import 'package:news_app/features/category_details/presentation/widgets/url_launcher.dart';

class ShowNewsDetails extends StatelessWidget {
  final ArticleEntity article;

  const ShowNewsDetails({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600.h,
      decoration: BoxDecoration(
        color: Colors.black.withAlpha(230),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
                child: Image.network(
                  article.urlToImage ?? "",
                  height: 250.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 250.h,
                    width: double.infinity,
                    color: Colors.grey[800],
                    child: Icon(Icons.broken_image, size: 40.sp, color: Colors.white),
                  ),
                ),
              ),
            
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(15.w),
                  decoration: BoxDecoration(
                    color: Colors.black.withAlpha(200),
                  ),
                  child: Text(
                    article.title ?? "No Title",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.w),
              child: SingleChildScrollView(
                child: Text(
                  article.description ?? "No Description Available",
                  style: TextStyle(fontSize: 16.sp, color: Colors.white),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.w),
            child: ElevatedButton(
              onPressed: () => UrlLauncher.launchURL(context, article.url, true),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                padding: EdgeInsets.symmetric(vertical: 15.h),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
              ),
              child: Center(child: Text("View Full Article", style: TextStyle(fontSize: 16.sp))),
            ),
          ),
        ],
      ),
    );
  }

}
