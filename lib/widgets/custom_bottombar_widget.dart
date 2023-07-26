// ignore_for_file: library_private_types_in_public_api

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../view_models/bottom_navigation_view_model.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({super.key});

  @override
  _CustomBottomBarState createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: const Color(0xFFFAFAFA),
        // color: AppTheme.primaryColor.withOpacity(0.8),
        boxShadow: [
          BoxShadow(
            blurRadius: 24,
            color: Colors.black.withOpacity(0.1),
          ),
        ],
      ),
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 90, sigmaY: 90),
        child: const Material(
          type: MaterialType.transparency,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              BBarIcon(
                title: "",
                iconData: Icons.dashboard_rounded,
                selectedIcon: Icons.dashboard_rounded,
                index: 0,
              ),
              BBarIcon(
                title: "",
                iconData: Icons.dashboard_rounded,
                selectedIcon: Icons.notifications,
                index: 1,
              ),
              BBarIcon(
                title: "",
                iconData: Icons.dashboard_rounded,
                selectedIcon: Icons.verified_user_rounded,
                index: 2,
              ),
              BBarIcon(
                title: "",
                iconData: Icons.dashboard_rounded,
                selectedIcon: Icons.verified_user_rounded,
                index: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BBarIcon extends StatefulWidget {
  final int index;
  final String title;
  final IconData iconData;
  final IconData selectedIcon;

  const BBarIcon({
    Key? key,
    required this.title,
    required this.iconData,
    required this.selectedIcon,
    required this.index,
  }) : super(key: key);
  @override
  _BBarIconState createState() => _BBarIconState();
}

class _BBarIconState extends State<BBarIcon> {
  @override
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 4,
      height: 65,
      child: Consumer<BottomNavigationViewModel>(
        builder: (context, value, _) {
          return InkResponse(
            onTap: () {
              value.homeViewIndex = widget.index;
              value.update();
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: widget.index == value.homeViewIndex

                      ? Icon(
                    widget.selectedIcon,
                    key: const Key("selected"),
                    color: Colors.teal,
                    size: 28,
                  )
                      : Icon(
                    widget.iconData,
                    key: const Key("unselected"),
                    color: Colors.grey.withOpacity(0.5),
                    // color: AppTheme.lightGreyColor,
                    size: 28,
                  ),
                ),
                const SizedBox(height: 4),
                // Text(
                //   widget.title,
                //   style: TextStyle(
                //     color: widget.index == value.homeViewIndex
                //         ? AppTheme.secondaryColor
                //         : AppTheme.lightGreyColor,
                //   ),
                // )
              ],
            ),
          );
        },
      ),
    );
  }
}
