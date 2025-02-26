import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:teqinvalleyproject/Screen/home_screen/home_screen.dart';
import 'package:teqinvalleyproject/Screen/profile_screen/profile_screen.dart';
import 'package:teqinvalleyproject/utils/custom_color.dart';
import 'package:teqinvalleyproject/utils/custom_text.dart';

// Bottom menu model
class BottomMenuModel {
  final IconData icon;
  final String label;
  final Widget widget;

  BottomMenuModel(
      {required this.icon, required this.label, required this.widget});
}

// Bottom navigation controller with GetX
class BottomNavigationController extends GetxController {
  var selectedIndex = 0.obs; // Observable index
  var showBottomBar = true.obs;
  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  Widget viewWidget = HomeScreen();
  void onChange(Widget type) {
    viewWidget = type;
    // Toggle the bottom bar visibility based on the selected screen
    showBottomBar.value = true; // Show the bottom bar for other screens
    update();
  }
}

class CustomBottomBar extends StatefulWidget {
  final Function(BottomMenuModel) onChanged;

  CustomBottomBar({super.key, required this.onChanged});

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  final BottomNavigationController controller =
      Get.put(BottomNavigationController());
  int temp = 0;

  @override
  Widget build(BuildContext context) {
    // Define the bottom menu items
    final List<BottomMenuModel> bottomMenuItems = [
      BottomMenuModel(
          icon: Icons.home_outlined, label: 'Home', widget: HomeScreen()),
      BottomMenuModel(
          icon: Icons.post_add, label: 'Post', widget: HomeScreen()),
      BottomMenuModel(
          icon: Icons.message_outlined, label: 'Message', widget: HomeScreen()),
      BottomMenuModel(
          icon: Icons.settings_outlined,
          label: 'Setting',
          widget: ProfileScreen()),
    ];

    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black54,
                blurRadius: 2,
                spreadRadius: -2,
                offset: Offset(0, -2))
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: BottomAppBar(
          color: white,
          shape: CircularNotchedRectangle(),
          padding: EdgeInsets.zero,
          // padding: EdgeInsets.only(top: 1.5.h,left: 3.w,right: 3.w),// Optional for notch effect
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(bottomMenuItems.length, (index) {
              // Leave space for cart icon in the middle
              return Obx(() {
                // Adjust selected index logic for non-cart items
                int adjustedIndex = index;
                bool isSelected = controller.selectedIndex.value == index;
                print(isSelected);
                print(controller.selectedIndex.value);
                return GestureDetector(
                    onTap: () {
                      print(index);
                      controller.changeIndex(index);

                      controller.onChange(bottomMenuItems[index].widget);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          bottomMenuItems[adjustedIndex].icon,
                          size: 25,
                          color: controller.selectedIndex.value == index
                              ? appColor
                              : black,
                        ),
                        SizedBox(width: 3.w),
                        Text(bottomMenuItems[adjustedIndex].label,
                            style: AppTextStyle.pw500.copyWith(
                                fontSize: 14.px,
                                color: controller.selectedIndex.value == index
                                    ? appColor
                                    : black)),
                      ],
                    ));
              });
            }),
          ),
        ),
      ),
    );
  }
}
