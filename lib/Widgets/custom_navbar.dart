import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomNavbar extends StatelessWidget {
  final int currentIndex;

  const CustomNavbar({super.key, required this.currentIndex});

  bool _isTabActive(int index) => index == currentIndex;
  double _getButtonWidth(int index) => _isTabActive(index) ? 140 : 130;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      top: false,
      child: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children:[
          Image.asset(
            'assets/images/PapanKayuShort.png',
            width: screenWidth,
            height: 100,
            fit: BoxFit.none,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNavItem(
                context,
                index: 0,
                path: '/home',
                iconPath: 'assets/images/kertasKecil.png',
              ),

              _buildNavItem(
                context,
                index: 1,
                path: '/profile',
                iconPath: 'assets/images/kertasKecil.png',
              ),
            ],
          ),
        ],
      ),
    );
  }


  Widget _buildNavItem(BuildContext context, {required int index, required String path, required String iconPath}) {
    final isActive = _isTabActive(index);
    final width = _getButtonWidth(index);

    return InkWell(
      onTap: () {
        context.go(path);
      },
      child: Transform.translate(
        offset: Offset(0, isActive ? -10 : 0),
        child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Image.asset(
                iconPath,
                width: width,
                height: width,
                fit: BoxFit.fill,
              ),
            ]
        ),
      ),
    );
  }
}