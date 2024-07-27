import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;
import 'package:watch_app_ui/watch_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  final List<WatchData> watches = [
    WatchData(
      imagePath: "assets/watch1.png",
      name: "Grand Seiko",
      description: "Heritage",
      price: "5,200",
    ),
    WatchData(
      imagePath: "assets/watch2.png",
      name: "Breitling",
      description: "TOP TIME B01",
      price: "18,400",
    ),
    WatchData(
      imagePath: "assets/watch3.png",
      name: "Hublot",
      description: "Luxury Watch",
      price: "14,600",
    ),
    WatchData(
      imagePath: "assets/watch4.png",
      name: "Breitling",
      description: "Superocean Heritage Automatic 42",
      price: "5,600",
    ),
    WatchData(
      imagePath: "assets/watch5.png",
      name: "Breitling",
      description: "Super Chronomat",
      price: "12,900",
    ),
  ];
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget buildWatchContainer(String path, int index) {
    return GestureDetector(
      onTap: () {
        _pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 2000),
          curve: Curves.easeInOutCubicEmphasized,
        );
      },
      child: Container(
        height: 60.h,
        width: 60.w,
        decoration: BoxDecoration(
          color: Colors.green.shade50,
          borderRadius: BorderRadius.circular(6),
          border: _currentPage == index
              ? Border.all(color: Colors.black, width: 2)
              : null,
        ),
        child: Image.asset(path),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffADC4CE),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 14.0.w, vertical: 40.0.h),
                  child: Row(
                    children: [
                      Container(
                        height: 40.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(6),
                        ),
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
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50.h),
                SizedBox(
                  height: 200.h,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        "assets/cushion.png",
                        color: Colors.black87,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                      PageView.builder(
                        controller: _pageController,
                        itemCount: watches.length,
                        onPageChanged: (index) {
                          setState(() {
                            _currentPage = index;
                          });
                        },
                        itemBuilder: (context, index) {
                          return AnimatedBuilder(
                            animation: _pageController,
                            builder: (context, child) {
                              double value = 1.0;
                              if (_pageController.position.haveDimensions) {
                                value = (_pageController.page! - index)
                                    .clamp(-1, 1);
                              }
                              return Transform(
                                transform: Matrix4.identity()
                                  ..setEntry(3, 2, 0.001)
                                  ..rotateY(value * -math.pi / 2)
                                  ..translate(value * 200.w),
                                alignment: value >= 0
                                    ? Alignment.centerLeft
                                    : Alignment.centerRight,
                                child: child,
                              );
                            },
                            child: Image.asset(
                              watches[index].imagePath,
                              fit: BoxFit.contain,
                              width: 250.w,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 40.0.h,
                  ),
                  child: SizedBox(
                    height: 60.0.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: watches.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                          child: buildWatchContainer(
                              watches[index].imagePath, index),
                        );
                      },
                    ),
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
                            watches[_currentPage].name,
                            style: TextStyle(fontSize: 24.sp),
                          ),
                          Text(
                            watches[_currentPage].description,
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        "\$${watches[_currentPage].price}",
                        style: TextStyle(fontSize: 24.sp),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 14.0.w, vertical: 12.0.h),
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
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        backgroundColor: Colors.black87,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
