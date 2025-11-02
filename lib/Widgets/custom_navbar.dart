import 'package:flutter/material.dart';

class CustomNavbar extends StatelessWidget {
  const CustomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
        top: false,
        child: Stack(
            alignment: AlignmentGeometry.bottomCenter,
            clipBehavior: Clip.none,
            children:[
              Image.asset(
                'assets/images/NavbarKayu.png',
                width: screenWidth,
                height: 100,
                fit: BoxFit.cover,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      print('tombol home');
                    },
                    child: Stack(
                        clipBehavior: Clip.none,
                        alignment: AlignmentGeometry.bottomCenter,
                        children: [
                          Image.asset(
                            'assets/images/kertasKecil.png',
                            width: 100,
                            height: 100,
                            fit: BoxFit.fill,
                          ),
                        ]
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print('tombol PROFILE');
                    },
                    child: Stack(
                        alignment: AlignmentGeometry.center,
                        children: [
                          Image.asset(
                            'assets/images/kertasKecil.png',
                            width: 100,
                            height: 100,
                            fit: BoxFit.fill,
                          ),
                        ]
                    ),
                  ),
                ],
              ),
            ],
          ),
    );
  }
}
