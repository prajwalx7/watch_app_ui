import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedWatch = ""; // Empty string for no watch selected initially

  void selectWatch(String watchAsset) {
    setState(() {
      selectedWatch = watchAsset;
    });
  }

  Widget buildWatchContainer(String watchAsset) {
    return GestureDetector(
      onTap: () => selectWatch(watchAsset),
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Image.asset(watchAsset),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 14.0.w, vertical: 40.0.h),
              child: Row(
                children: [
                  Container(
                    height: 40.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(6)),
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: 40.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(6)),
                    child: const Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 80.h),
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  "assets/cushion.png",
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                if (selectedWatch.isNotEmpty)
                  Image.asset(
                    selectedWatch,
                    fit: BoxFit.contain,
                    width: 250.w,
                  ),
              ],
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 14.0.w, vertical: 40.0.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildWatchContainer("assets/watch1.png"),
                  buildWatchContainer("assets/watch2.png"),
                  buildWatchContainer("assets/watch3.png"),
                  buildWatchContainer("assets/watch4.png"),
                  buildWatchContainer("assets/watch5.png"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.0.w),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Rolex",
                        style: TextStyle(fontSize: 24.sp),
                      ),
                      Text(
                        "Data",
                        style: TextStyle(
                            fontSize: 18.sp, color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    "\$500",
                    style: TextStyle(fontSize: 24.sp),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 14.0.w, vertical: 12.0.h),
              child: SizedBox(
                height: 40.h,
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  label: Text(
                    "Add to Cart",
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  icon: const Icon(Icons.shopping_bag_outlined),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r)),
                      backgroundColor: Colors.black87,
                      foregroundColor: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
