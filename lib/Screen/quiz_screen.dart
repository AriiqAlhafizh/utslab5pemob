import 'package:flutter/material.dart';


class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 5.0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/ProfileBG.png'),
                    fit: BoxFit.fitHeight,
                  ),
                  color: Colors.red,
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child:
                    Container(
                      alignment: AlignmentGeometry.center,
                      width: 380,
                      height: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/kertasPipihPol.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Text('berapa IQ Bintang?'),
                    ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 5.0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/PapanKayuShort.png'),
                    fit: BoxFit.none,
                  ),
                  color: Colors.green,
                ),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        alignment: AlignmentGeometry.center,
                        width: 400,
                        height: 75,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/kertasPipihPol.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Text('2 juta'),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        alignment: AlignmentGeometry.center,
                        width: 400,
                        height: 75,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/kertasPipihPol.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Text('- 2 juta'),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        alignment: AlignmentGeometry.center,
                        width: 400,
                        height: 75,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/kertasPipihPol.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Text('100'),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        alignment: AlignmentGeometry.center,
                        width: 400,
                        height: 75,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/kertasPipihPol.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Text('0'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      backgroundColor: Color(0xffe8b882),
    );
  }
}