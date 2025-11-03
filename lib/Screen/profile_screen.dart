import 'package:flutter/material.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/ProfileBG.png'),
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
                padding:EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/KertasGede.png'),
                    fit: BoxFit.contain,
                  ),
                ),
                child: Align(
                  child: Column(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/profile.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 00.0, horizontal: 20.0),
                          decoration: BoxDecoration(
                            // color: Colors.blue,
                          ),
                          child: Row(
                            children: [
                              Expanded(flex : 2 ,child: Text('Username')),
                              Expanded(flex : 3 ,child: Text('AnanthaDongo')),
                              Expanded(flex : 1 , child: Text('@')),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 00.0, horizontal: 20.0),
                          decoration: BoxDecoration(
                            // color: Colors.green,
                          ),
                          child: Row(
                            children: [
                              Expanded(flex : 2 ,child: Text('Highscore')),
                              Expanded(flex : 3 ,child: Text('12345')),
                            ],
                          ),
                        ),
                      ),
                    ],
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
      backgroundColor: Color(0xffe8b882),
    );
  }
}
