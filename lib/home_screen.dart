import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.0.w, vertical: 40.0.h),
            child: Row(
              children: [
                Container(
                  height: 40.h,
                  width: 50.w,
                  decoration: BoxDecoration(
                      color: Colors.black,
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
                      color: Colors.black,
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
          Image.asset(
            "assets/cushion.png",
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.0.w, vertical: 40.0.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(6)),
                  child: SvgPicture.asset("assets/watch1.svg"),
                ),
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(6)),
                  child: SvgPicture.asset("assets/watch2.svg"),
                ),
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(6)),
                  child: SvgPicture.asset("assets/watch1.svg"),
                ),
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(6)),
                  child: SvgPicture.asset("assets/watch2.svg"),
                ),
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(6)),
                  child: SvgPicture.asset("assets/watch1.svg"),
                ),
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
            padding: EdgeInsets.symmetric(horizontal: 14.0.w, vertical: 10.0.h),
            child: SizedBox(
              height: 40.h,
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                label: Text("Add to Cart"),
                icon: Icon(Icons.shopping_bag_outlined),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    backgroundColor: Colors.black87,
                    foregroundColor: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
