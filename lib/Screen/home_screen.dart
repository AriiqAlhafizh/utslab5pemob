import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe8b882),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/HomeBG.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const Expanded(
              flex: 2,
              child: SizedBox.shrink(),
            ),
            Expanded(
              flex: 8,
              child: Container(
                margin: const EdgeInsets.only(right: 20.0, bottom: 30.0),
                alignment: Alignment.bottomRight,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  width: 200,
                  height: 150,
                  child: InkWell(
                    onTap: () {
                      print('tombol Play ditekan');
                      context.push('/quiz');
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
                        const Text('Play', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Expanded(
              flex: 2,
              child: SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}