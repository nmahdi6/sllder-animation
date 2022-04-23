import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/navigation_bloc.dart';
import 'pages/homePage.dart';
import 'slideBar.dart';

class slideBarLayout extends StatefulWidget {
  const slideBarLayout({Key? key}) : super(key: key);

  @override
  State<slideBarLayout> createState() => _slideBarLayoutState();
}

class _slideBarLayoutState extends State<slideBarLayout> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: BlocProvider<NavigationBloc>(
            create: ((context) => NavigationBloc()),
            child: SafeArea(
              child: Stack(
                children: <Widget>[
                  BlocBuilder<NavigationBloc, Widget>(
                      builder: (context, Widget widget) {
                    return widget;
                  }),
                  slideBar(),
                ],
              ),
            ),
          ),
        ));
  }
}
