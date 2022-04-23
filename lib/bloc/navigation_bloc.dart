import 'package:application_tamrin_1/pages/homePage.dart';
import 'package:application_tamrin_1/pages/myOrderPage.dart';
import 'package:application_tamrin_1/pages/wishListPage.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

enum NavigationEvents {
  homePageClickEvent,
  MyOrderPageClickEvent,
  WishListPageClickEvent,
}

class NavigationBloc extends Bloc<NavigationEvents, Widget> {
  NavigationBloc() : super(homePage());

  @override
  Stream<Widget> maoEventToState(NavigationEvents event) async* {
    if (event == NavigationEvents.homePageClickEvent) {
      yield homePage();
    } else if (event == NavigationEvents.WishListPageClickEvent) {
      yield wishList();
    } else if (event == NavigationEvents.MyOrderPageClickEvent) {
      yield myOrderPage();
    }
  }
}
