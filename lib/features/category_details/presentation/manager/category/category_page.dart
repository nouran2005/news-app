import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'category_cubit.dart';
import 'category_navigator.dart';

class CategoryArguments {
  String param;

  CategoryArguments({
    required this.param,
  });
}

class CategoryPage extends StatelessWidget {
  final CategoryArguments arguments;

  const CategoryPage({
    Key? key,
    required this.arguments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return CategoryCubit(
          navigator: CategoryNavigator(context: context),
        );
      },
      child: const CategoryChildPage(),
    );
  }
}

class CategoryChildPage extends StatefulWidget {
  const CategoryChildPage({Key? key}) : super(key: key);

  @override
  State<CategoryChildPage> createState() => _CategoryChildPageState();
}

class _CategoryChildPageState extends State<CategoryChildPage> {
  late final CategoryCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of(context);
    _cubit.loadInitialData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: _buildBodyWidget(),
      ),
    );
  }

  Widget _buildBodyWidget() {
    return Container();
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }
}
