import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return Container(
      height: 60,
      color: widget.backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: widget.children.map((item) {
          var color = item.color;
          var icon = item.icon;

          int index = widget.children.indexOf(item);
          return GestureDetector(
            onTap: () {
              _changeIndex(index);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: widget.currentIndex == index
                  ? MediaQuery.of(context).size.width / widget.children.length +
                      20
                  : 50,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              margin: EdgeInsets.symmetric(vertical: 10.h),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: widget.currentIndex == index
                      ? color.withOpacity(0.2)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Icon(
                    icon,
                    size: 24,
                    color: widget.currentIndex == index
                        ? color
                        : color.withOpacity(0.5),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class CustomBottomNavigationItem {
  final IconData icon;
  final Color color;

  CustomBottomNavigationItem({required this.icon, required this.color});
}
