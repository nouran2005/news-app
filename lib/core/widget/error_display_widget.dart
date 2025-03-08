import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/resources/assets_manager.dart';

class ErrorDisplayWidget extends StatefulWidget {
  final String errorMessage;
  final VoidCallback? onRetry;

  const ErrorDisplayWidget({
    super.key,
    required this.errorMessage,
    this.onRetry,
  });

  @override
  _ErrorDisplayWidgetState createState() => _ErrorDisplayWidgetState();
}

class _ErrorDisplayWidgetState extends State<ErrorDisplayWidget> {
  double imageSize = 50.w;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 200), () {
      if (mounted) {
        setState(() {
          imageSize = 150.w;
        });
      }
    });
  }

  String getFriendlyErrorMessage(String error) {
    if (error.contains("Failed host lookup")|| error.contains("Internet")) {
      return "No internet connection!";
    } else if (error.contains("SocketException")) {
      return "Network issue, please try again!";
    } else if (error.contains("TimeoutException")) {
      return "The server took too long to respond!";
    } else if (error.contains("DioException")) {
      return "An error occurred while connecting to the server. Please try again later.";
    } else {
      return "An unexpected error occurred: $error";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 600),
              curve: Curves.easeOutBack,
              width: imageSize,
              height: imageSize,
              child: Image.asset(
                ImageAssets.Error,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 15.h),
            Text(
              getFriendlyErrorMessage(widget.errorMessage), 
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            if (widget.onRetry != null) ...[
              SizedBox(height: 20.h),
              ElevatedButton(
                onPressed: widget.onRetry,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  foregroundColor:  Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  elevation: 5,
                  shadowColor: Colors.black26,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.refresh, size: 24.sp),
                    SizedBox(width: 8.w),
                    Text("Retry", style: TextStyle(fontSize: 16.sp)),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
