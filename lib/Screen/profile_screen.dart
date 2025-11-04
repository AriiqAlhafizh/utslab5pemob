import 'package:flutter/material.dart';
import '../Provider/app_state_provider.dart';
import 'package:provider/provider.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void _showChangeNameDialog(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    final provider = Provider.of<AppStateProvider>(context, listen: false);
    controller.text = provider.currentUsername;

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Ubah Nama Pengguna'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: "Masukkan nama baru"),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Batal'),
              onPressed: () => Navigator.pop(dialogContext),
            ),
            TextButton(
              child: const Text('Simpan'),
              onPressed: () {
                provider.setUsername(controller.text);
                Navigator.pop(dialogContext);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateProvider>(
      builder: (context, appState, child) {
        final currentUsername = appState.currentUsername;
        final currentHighscore = appState.currentHighscore;

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
                            flex: 2,
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
                                  Expanded(flex : 2 ,child: Text('Username :', style: TextStyle(fontFamily: 'BaskervvilleSC', fontSize: 17,),)),
                                  Expanded(flex : 2 ,child: Text(currentUsername, style: TextStyle(fontFamily: 'BaskervvilleSC', fontSize: 17,),)),
                                  Expanded(flex : 1 ,
                                    child: InkWell(
                                      onTap: () {_showChangeNameDialog(context);},
                                      child: Container(
                                        alignment: AlignmentGeometry.center,
                                        width: 150,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage('assets/images/NavbarKayu.png'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        child: Text('Edit', style: TextStyle(fontFamily: 'BaskervvilleSC', fontSize: 17, color: Colors.white),),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 00.0, horizontal: 20.0),
                              child: Row(
                                children: [
                                  Expanded(flex : 2 ,child: Text('HighScore :', style: TextStyle(fontFamily: 'BaskervvilleSC', fontSize: 17,),)),
                                  Expanded(flex : 3 ,child: Text(currentHighscore.toString(), style: TextStyle(fontFamily: 'BaskervvilleSC', fontSize: 20,),)),
                                ],
                              )
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
      },
    );
  }
}


