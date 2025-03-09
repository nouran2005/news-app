import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/resources/AppColor.dart';

class CustomDropdown extends StatelessWidget {
  final String title;
  final String value;
  final List<String> options;
  final ValueChanged<String?> onChanged;

  const CustomDropdown({
    super.key,
    required this.title,
    required this.value,
    required this.options,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5.h), 
          Container(
            width: double.infinity, 
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).colorScheme.primary),
              borderRadius: BorderRadius.circular(8.r),
              color: Colors.black54,
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                isExpanded: true,
                dropdownColor: ColorManager.lightGreyColor,
                value: value,
                items: options
                    .map((option) => DropdownMenuItem(
                          value: option,
                          child: Text(option, style: const TextStyle(color: ColorManager.lightPrimaryColor)),
                        ))
                    .toList(),
                alignment: Alignment.bottomCenter,
                onChanged: onChanged,
                
              ),
            ),
          ),
        ],
      ),
    );
  }
}
