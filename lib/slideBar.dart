import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:application_tamrin_1/bloc/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'menuItem.dart';
import 'package:bloc/bloc.dart';
import 'bloc/navigation_bloc.dart';

class slideBar extends StatefulWidget {
  const slideBar({Key? key}) : super(key: key);

  @override
  State<slideBar> createState() => _slideBarState();
}

class _slideBarState extends State<slideBar>
    with SingleTickerProviderStateMixin {
  bool isSlideBarOpen = false;

  late AnimationController _animationController;
  @override
  void initState() {
    
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 700));
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 700),
      left: isSlideBarOpen ? 65 : screenWidth - 35,
      child: Row(
        children: [
          Container(
            width: screenWidth - 100,
            height: screenHeight,
            color: Colors.blue,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                ListTile(
                  title: const Text(
                    "My App ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w800),
                  ),
                  subtitle: Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: const Text(
                      "nmahdi600@gmail.com",
                      style: TextStyle(
                        color: Color(0xff9bb8ff),
                        fontSize: 12,
                      ),
                    ),
                  ),
                  leading: const CircleAvatar(
                    child: Icon(
                      Icons.perm_identity,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                Divider(
                  height: 65,
                  color: Colors.white.withOpacity(0.5),
                  indent: 26,
                ),
                MeniItem(icon: Icons.home, title: "Home"),
                MeniItem(
                  icon: Icons.shopping_basket,
                  title: "My Order",
                ),
                MeniItem(icon: Icons.card_giftcard, title: "Wish List",
                onTap: () {
                    // context.bloc<NavigationBloc>().add(NavigationEvents.MyOrderPageClickEvent);
                  },
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isSlideBarOpen = !isSlideBarOpen;
              });
            },
            child: Container(
              padding: EdgeInsets.only(
                  bottom: (MediaQuery.of(context).size.height / 1.2)),
              child: Align(
                alignment: const Alignment(0, -0.8),
                child: ClipPath(
                  clipper: CustomMenuClipper(),
                  child: Container(
                    width: 35,
                    height: 110,
                    alignment: Alignment.center,
                    child: AnimatedIcon(
                        color: Color(0xff1bb5fd),
                        size: 25,
                        icon: !isSlideBarOpen
                            ? AnimatedIcons.menu_close
                            : AnimatedIcons.close_menu,
                        progress: _animationController.view),
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(width, 0);
    path.quadraticBezierTo(width, 8, width - 10, 16);
    path.quadraticBezierTo(0, width, 0, height / 2);
    path.quadraticBezierTo(0, height - width, width - 10, height - 16);
    path.quadraticBezierTo(width, height - 8, width, height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
