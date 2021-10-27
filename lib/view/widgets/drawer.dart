import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:adventuregame/view/screens/favorite_game.dart';
import 'package:share/share.dart';

class Drawerbar extends StatelessWidget {
  const Drawerbar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Drawer(
      
        child: ListView(
          children: <Widget>[
          const  Center(
              child: UserAccountsDrawerHeader(
                
                accountName: Text("Adventure Game", ),
                accountEmail: Text(""),
                currentAccountPicture: CircleAvatar(
                backgroundImage:  AssetImage("assets/logo.png"),
                ),
              ),
            ),
           
            ListTile(
              title: Text("Rating"),
              onTap: () {},
              trailing: Icon(Icons.rate_review),
            ),
            ListTile(
              title: Text("Contect us"),
              trailing: Icon(Icons.contact_page),
              onTap: () {},
            ),
            ListTile(
              title: Text("Share"),
              trailing: Icon(Icons.share),
              onTap: () {
                Share.share(
                    'check out Game Maniya https://play.google.com/store/apps/details?id=com.kurm.game',
                    subject: 'Look what I made!');
              },
            ),
          ],
        ),
      );
     
  }
}