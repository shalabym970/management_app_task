import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../color_manager.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final Color backgroundColor;
  final Color itemColor;
  final List<CustomBottomNavigationItem> children;
  final Function(int) onChange;
  final int currentIndex;

  const CustomBottomNavigationBar(
      {super.key,
      required this.backgroundColor,
      required this.itemColor,
      this.currentIndex = 0,
      required this.children,
      required this.onChange});

  @override
  CustomBottomNavigationBarState createState() =>
      CustomBottomNavigationBarState();
}

class CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  void _changeIndex(int index) {
    widget.onChange(index);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, ),
          child: Container(
            height: 88.h,
            decoration: BoxDecoration(
              color: widget.backgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.r),
                topRight: Radius.circular(24.r),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 4,
                  blurRadius: 9,
                  offset: const Offset(0, 3), // Offset for the shadow (x, y)
                ),
              ],
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: widget.children.sublist(0, 2).map((item) {
                      int index = widget.children.indexOf(item);
                      return GestureDetector(
                        onTap: () {
                          _changeIndex(index);
                        },
                        child: buildNavItem(item, index),
                      );
                    }).toList(),
                  ),
                  // Spacer
                  // SizedBox(width: 50.w), // Adjust width as necessary
                  Row(
                    children: widget.children.sublist(2, 4).map((item) {
                      int index = widget.children.indexOf(item);
                      return GestureDetector(
                        onTap: () {
                          _changeIndex(index);
                        },
                        child: buildNavItem(item, index),
                      );
                    }).toList(),
                  ),
                ]),
          ),
        ),
        Positioned(
          top: -20.h, // Adjust this value to position the button correctly
          child: FloatingActionButton(
            onPressed: () {
              // Handle button press
            },
            child: Icon(
              Icons.add,
              color: AppColors.white,
            ),
            backgroundColor: AppColors.black,
            elevation: 2,
          ),
        ),
      ],
    );
  }

  Widget buildNavItem(CustomBottomNavigationItem item, int index) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 27.h),
      alignment: Alignment.center,
      child: SvgPicture.asset(
        widget.currentIndex == index
            ? item.enableSvgImage
            : item.disableSvgImage,
        width: 24.w,
        height: 24.h,
      ),
    );
  }
}

class CustomBottomNavigationItem {
  final String enableSvgImage;
  final String disableSvgImage;

  CustomBottomNavigationItem({
    required this.enableSvgImage,
    required this.disableSvgImage,
  });
}
