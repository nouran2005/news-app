import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/resources/AppColor.dart';
import 'package:news_app/core/resources/assets_manager.dart';
import 'package:news_app/features/home_screen/presentation/widgets/CustomDropdown.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({
    Key? key,
    required this.onPress,
  }) : super(key: key);
  final void Function() onPress;
  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
    String selectedTheme = "Light";
    String selectedLanguage = "English";
    bool isThemeExpanded = false;
  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            padding: REdgeInsets.symmetric(
              vertical: 100.h,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Text("Today's News", style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontFamily: "Great Vibes"),),
          ),
          Expanded(child:
          Container(
            color: Theme.of(context).colorScheme.onPrimary,
             child: Column(
              children: [
                Padding(
            padding: REdgeInsets.symmetric(horizontal: 2.w, vertical: 4.h),
            child: ListTile(
              leading: Image.asset(
                IconsAssets.icHome, 
                color: ColorManager.lightPrimaryColor,
                height: 25.h,
              ),
              title: Text("Go To Home",
                  style: Theme.of(context).textTheme.titleSmall),
              onTap: () {
                widget.onPress();
              },
            ),
          ),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 16.w),
            child: Divider(color: ColorManager.lightPrimaryColor, thickness: 1 , )
            ),
            CustomDropdown(
            title: "Theme",
            value: selectedTheme,
            options: ["Light", "Dark", "System"],
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  selectedTheme = value;
                  //AppLocalizations.of(context)!.value;
                });
              }
            },
          ),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 16.w),
            child: Divider(color: ColorManager.lightPrimaryColor, thickness: 1 , )
            ),
            CustomDropdown(
            title: "Language",
            value: selectedLanguage,
            options: ["English", "Arabic"],
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  selectedLanguage = value;
                });
              }
            },
          ),
              ],
             ),
            ),
          )
      ]
    );
  }
}




