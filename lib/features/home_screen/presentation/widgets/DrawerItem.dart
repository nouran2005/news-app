import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({super.key, required this.icon, required this.title, required this.ontap});
  final IconData icon ;
  final String title ;
  final GestureTapCallback ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Padding(
              padding: REdgeInsets.only(left: 16),
              child: Row(
                children: [
                  Icon(
                    icon,
                    color: Theme.of(context).colorScheme.secondary,
                    size: 30.sp,
                    ),
                    SizedBox(width: 16.w,),
                    Text(title , style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.black),)
                ],
              ),
            ),
    );
  }
}