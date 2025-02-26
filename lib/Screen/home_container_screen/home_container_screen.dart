import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:teqinvalleyproject/Screen/home_container_screen/controller/home_container_controller.dart';
import 'package:teqinvalleyproject/widget/custom_bottom_bar.dart';

class HomeContainerScreen extends StatefulWidget {
  const HomeContainerScreen({super.key});

  @override
  State<HomeContainerScreen> createState() => _HomeContainerScreenState();
}

class _HomeContainerScreenState extends State<HomeContainerScreen> {
  var homeContainerController = Get.put(HomeContainerController1());

// LocationPermission? permission;
//   Position? currentPosition;

  // NotificationServices notificationServices = NotificationServices();
  String? address;
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addObserver(this); // Start listening to app lifecycle
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  @override
  @override
  Widget build(BuildContext context) {
    // Put the BottomBarController here
    BottomNavigationController bottomBarController =
        Get.put(BottomNavigationController());

    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: GetBuilder<BottomNavigationController>(
            init: BottomNavigationController(),
            builder: (controller) {
              // Render the current view based on the selected tab
              return controller.viewWidget;
            },
          ),
          bottomNavigationBar: Obx(() {
            // Conditionally show the bottom bar
            return bottomBarController.showBottomBar.value
                ? CustomBottomBar(
                    onChanged: (BottomMenuModel type) {
                      bottomBarController.onChange(type.widget);
                    },
                  )
                : SizedBox
                    .shrink(); // Return an empty widget when the bar is hidden
          }),
        ));
  }
}
