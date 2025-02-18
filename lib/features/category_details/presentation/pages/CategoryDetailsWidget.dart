import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/category_details/presentation/pages/newsListWidget.dart';

class CategoryDetailsWidget extends StatelessWidget {
  const CategoryDetailsWidget({
    Key? key,
    required this.categoryID,
  }) : super(key: key);

  final String categoryID;
  static const List<String> sources = [
    "ABC News", "Aftenposten", "ANSA.it", "Ary News", "Axios"
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: sources.length,
      child:Column(
          children: [
            TabBar(
              isScrollable: true,
              dividerHeight: 0,
              indicatorPadding: EdgeInsets.zero, 
              labelColor: Colors.black,
              unselectedLabelStyle: TextStyle(fontSize: 14, color: const Color.fromARGB(255, 0, 0, 0)),
              labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 2.5.w, color:Theme.of(context).colorScheme.secondary),
                insets: REdgeInsets.symmetric(horizontal: 2), 
              ),
              labelPadding: REdgeInsets.only(left: 0 , right: 20),
              tabs: sources.map((source) => Tab(text: source)).toList(),
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
                  child: TabBarView(
                    children: 
                            sources.map((Source) => NewsListWidget())
                            .toList() 
                        
                  ),
                ),
          ],
        ),
      
    );
  }
}