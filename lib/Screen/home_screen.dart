import 'package:flutter/material.dart';
import 'package:utslab5pemob/Widgets/custom_navbar.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/HomeBG.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: SizedBox.shrink(),
            ),
            Expanded(
              flex: 8,
              child: Container(
                margin: EdgeInsets.only(right: 20.0, bottom: 30.0) ,
                alignment: AlignmentGeometry.bottomRight,
                // decoration: BoxDecoration(
                //   color: Colors.red,
                // ),
                child:
                    Container(
                      alignment: Alignment.bottomCenter,
                      width: 200,
                      height: 150,
                      // decoration: BoxDecoration(
                      //   color: Colors.blue,
                      // ),
                      child: InkWell(
                        onTap: () {
                          print('tombol Play');
                        },
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Image.asset(
                              'assets/images/playButton.png',
                              width: 200,
                              height: 150,
                              fit: BoxFit.contain,
                            ),
                            Text('Play'),
                          ],
                        ),
                      ),
                    )
              ),
            ),
            Expanded(
              flex: 2,
              child: CustomNavbar(),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xffe8b882),
    );
  }
}
