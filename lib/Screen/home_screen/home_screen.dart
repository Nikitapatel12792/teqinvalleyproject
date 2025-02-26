import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:teqinvalleyproject/Screen/profile_screen/profile_screen.dart';
import 'package:teqinvalleyproject/utils/custom_color.dart';
import 'package:teqinvalleyproject/utils/custom_text.dart';
import 'package:teqinvalleyproject/widget/custom_bottom_bar.dart';
import 'package:teqinvalleyproject/widget/custom_image.dart';
import 'package:teqinvalleyproject/widget/drawer_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: appColor,
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (context) => GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer(); // Opens Drawer
            },
            child: Icon(Icons.menu, color: white),
          ),
        ),
        title: Text("Hello, Juan Gomez",
            style: AppTextStyle.pw600.copyWith(color: white, fontSize: 16.px)),
        actions: [
          GestureDetector(
            onTap: () {
              final BottomNavigationController controller1 =
                  Get.put(BottomNavigationController());
              controller1.changeIndex(3);

              controller1.onChange(ProfileScreen());
            },
            child: Container(
              margin: EdgeInsets.only(right: 5.w),
              height: 30.px,
              width: 30.px,
              decoration: BoxDecoration(
                border: Border.all(color: white),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.person, color: white),
            ),
          )
        ],
      ),
      drawer: CustomDrawer(onClose: () {
        Get.back(); // Close drawer on tap
      }),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 2.h),

              _buildStatsCards(),
              SizedBox(height: 2.h),
              Text('Today Publishing Overview',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 2.h),
              // Stats Grid
              GridView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2.7,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  List<Map<String, dynamic>> stats = [
                    {'title': 'Scheduled', 'value': 0, 'icon': Icons.schedule},
                    {
                      'title': 'Published',
                      'value': 0,
                      'icon': Icons.check_circle
                    },
                    {'title': 'Failed', 'value': 0, 'icon': Icons.error},
                    {'title': 'Approved', 'value': 1, 'icon': Icons.verified},
                  ];

                  return Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(20.px),
                        boxShadow: [
                          BoxShadow(color: Colors.black54, blurRadius: 4)
                        ]),
                    padding: EdgeInsets.all(3.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(stats[index]['icon'], color: Colors.blue),
                        SizedBox(
                          width: 3.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              stats[index]['title'],
                              style: AppTextStyle.pw500
                                  .copyWith(color: black, fontSize: 14.px),
                            ),
                            Text(
                              '${stats[index]['value']} Previous ',
                              style: AppTextStyle.pw400
                                  .copyWith(color: black, fontSize: 12.px),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 2.h),
              Text('Statistics',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 2.h),
              _buildPieChart(),
              SizedBox(height: 2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Task",
                    style: AppTextStyle.pw600.copyWith(color: black),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_forward,
                        color: appColor,
                        size: 15.px,
                      ),
                      Text(
                        "View All",
                        style: AppTextStyle.pw400.copyWith(color: appColor),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (int i = 0; i < 5; i++) ...[
                      Container(
                        width: 50.w,
                        padding: EdgeInsets.all(3.w),
                        margin: EdgeInsets.all(2.w),
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(10.px),
                            boxShadow: [
                              BoxShadow(color: Colors.black54, blurRadius: 4)
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Task Title",
                              style: AppTextStyle.pw500.copyWith(color: black),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Divider(),
                            Text(
                              "Task Description",
                              style: AppTextStyle.pw400.copyWith(color: black),
                            ),
                            Text(
                              "Task Date",
                              style: AppTextStyle.pw400.copyWith(color: black),
                            ),
                            Text(
                              "Assign to:George Lazzer",
                              style: AppTextStyle.pw400.copyWith(color: black),
                            )
                          ],
                        ),
                      )
                    ]
                  ],
                ),
              ),
              SizedBox(height: 2.h),
              _buildRecentReports(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecentReports() {
    return Container(
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(10.px),
          boxShadow: [BoxShadow(color: Colors.black54, blurRadius: 4)]),
      padding: EdgeInsets.all(3.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Recent Reports',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Divider(),
          _buildReportItem('Ticket Analysis', '19 Feb 2025', "90%"),
          _buildReportItem('Customer Satisfaction', '16 Feb 2025', "80%"),
          _buildReportItem('Voice Performance', '16 Feb 2025', "70%"),
          _buildReportItem('SLA Analysis', '16 Feb 2025', "75%"),
        ],
      ),
    );
  }

  Widget _buildReportItem(String title, String date, per) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title, style: TextStyle(fontSize: 14)),
      subtitle: Text(date, style: TextStyle(color: Colors.grey)),
      trailing: Text(per,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildStatsCards() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _statCard("Total Posts", "120", Icons.post_add, Colors.blue),
        SizedBox(
          width: 2.w,
        ),
        _statCard("Total Users", "45K", Icons.people, Colors.green),
        SizedBox(
          width: 2.w,
        ),
        _statCard("Views", "1.2M", Icons.bar_chart, Colors.orange),
      ],
    );
  }

  Widget _statCard(String title, String count, IconData icon, Color color) {
    return Container(
      width: 28.w,
      padding: EdgeInsets.all(1.5.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.px),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 5),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 24.sp),
          SizedBox(height: 1.h),
          Text(title,
              style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold)),
          Text(count,
              style: TextStyle(
                  fontSize: 14.sp, fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );
  }

  /// 📌 Pie Chart for Statistics
  Widget _buildPieChart() {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PieChart(
            PieChartData(
              sections: [
                PieChartSectionData(
                    value: 40, title: '40%', color: Colors.blue, radius: 50),
                PieChartSectionData(
                    value: 30, title: '30%', color: Colors.red, radius: 50),
                PieChartSectionData(
                    value: 20, title: '20%', color: Colors.green, radius: 50),
                PieChartSectionData(
                    value: 10, title: '10%', color: Colors.orange, radius: 50),
              ],
              sectionsSpace: 2,
              centerSpaceRadius: 40,
            ),
          ),
        ),
      ],
    );
  }

  Widget InfoWidget({String? title}) {
    return Text(
      title ?? "",
      style: AppTextStyle.pw500.copyWith(color: black),
    );
  }

  Widget commaonWidget1({String? title}) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      margin: EdgeInsets.symmetric(horizontal: 1.w),
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.px),
          border: Border.all(color: Color(0xffbE4E2E2))),
      child: Column(
        children: [
          CustomImageView(
            imagePath: "assets/images/home2.png",
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            "Next-gen Artificial Intelligence",
            textAlign: TextAlign.center,
            style: AppTextStyle.pw600.copyWith(color: black),
          ),
          SizedBox(
            height: 1.h,
          ),
          Row(
            children: [
              Icon(
                Icons.check,
                color: appColor,
              ),
              Text(
                "Natural Language Processing",
                textAlign: TextAlign.center,
                style: AppTextStyle.pw400.copyWith(
                  color: black,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.check,
                color: appColor,
              ),
              Text(
                "Natural Language Processing",
                textAlign: TextAlign.center,
                style: AppTextStyle.pw400.copyWith(
                  color: black,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.check,
                color: appColor,
              ),
              Text(
                "Natural Language Processing",
                textAlign: TextAlign.center,
                style: AppTextStyle.pw400.copyWith(
                  color: black,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget commaonWidget({String? title}) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      margin: EdgeInsets.symmetric(horizontal: 1.w),
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.px),
          border: Border.all(color: Color(0xffbE4E2E2))),
      child: Column(
        children: [
          CustomImageView(
            imagePath: "assets/images/home.png",
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            title ?? "",
            style: AppTextStyle.pw600.copyWith(color: black),
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
            " Proin vehicula, mauris vel ",
            textAlign: TextAlign.center,
            style: AppTextStyle.pw400.copyWith(
              color: black,
            ),
          )
        ],
      ),
    );
  }
}
