import 'package:flutter/material.dart';
import 'package:nhom6_shopping_app/Screens/Login/login_screen.dart';
import 'package:nhom6_shopping_app/json/constant.dart';
import 'package:nhom6_shopping_app/pages/favourite_page.dart';
import 'package:nhom6_shopping_app/pages/home_page.dart';
import 'package:nhom6_shopping_app/pages/order_page.dart';
import 'package:nhom6_shopping_app/pages/root_app.dart';
import 'package:nhom6_shopping_app/pages/settings.dart';
import 'package:nhom6_shopping_app/theme/colors.dart';

class MorePage extends StatefulWidget {
  @override
  _MorePageState createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
          child: Row(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(profileUrl), fit: BoxFit.cover)),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  Text(
                    "Uyen",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "4 Orders",
                    style: TextStyle(fontSize: 15, color: grey),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Divider(
          color: grey.withOpacity(0.9),
        ),
        ListTile(
          title: Text(
            'Home',
          ),
          trailing: Icon(Icons.keyboard_arrow_right_sharp),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RootApp(),
              ),
            );
          },
        ),
        Divider(
          color: grey.withOpacity(0.9),
        ),
        ListTile(
          title: Text('Favourite'),
          trailing: Icon(Icons.keyboard_arrow_right_sharp),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FavouritePage(),
              ),
            );
          },
        ),
        Divider(
          color: grey.withOpacity(0.9),
        ),
        ListTile(
          title: Text('My orders'),
          trailing: Icon(Icons.keyboard_arrow_right_sharp),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OrderPage(),
              ),
            );
          },
        ),
        Divider(
          color: grey.withOpacity(0.9),
        ),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: (size.width - 100) / 2,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    // padding: const EdgeInsets.all(16.0),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingsPage()),
                    );
                  },
                  child: Text(
                    "Settings",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              ),
              Container(
                width: (size.width - 100) / 2,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    // padding: const EdgeInsets.all(16.0),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Text(
                    "Sign Out",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
