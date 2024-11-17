import 'package:flutter/material.dart';
import 'package:money_investment_track/Presentation/pages/drawerScreen/about_developer.dart';
import 'package:money_investment_track/Presentation/pages/drawerScreen/tutorial.dart';
import 'package:money_investment_track/Presentation/widgets/back_button.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: ListView(
        children: [
          BackButtonWidget(
            isColorChange: true,
            currencyName: "About App",
            onNavigate: () {
              Navigator.of(context).pop();
            },
          ),
          // Wrap the Column inside an Expanded widget to center it properly
          SizedBox(
            height: 100,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                margin: EdgeInsets.symmetric(horizontal: 50),
                color: Colors.white,
                child: ListTile(
                  leading: Icon(
                    Icons.person,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  title: Center(
                    child: Text(
                      "App Creator",
                      style: TextStyle(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          fontFamily: "Jersey",
                          fontSize: 20),
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => AboutDeveloper(),));
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30), // Add space between cards
              Card(
                margin: EdgeInsets.symmetric(horizontal: 50),
                color: Colors.white,
                child: ListTile(
                    leading: Icon(
                      Icons.book,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    title: Center(
                        child: Text(
                      "User Guides",
                      style: TextStyle(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          fontFamily: "Jersey",
                          fontSize: 20),
                    )),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                    )),
              ),
              SizedBox(height: 30), // Add space between cards
              Card(
                margin: EdgeInsets.symmetric(horizontal: 50),
                color: Colors.white,
                child: ListTile(
                    leading: Icon(
                      Icons.tv,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    title: Center(
                      child: Text(
                        "Tutorials",
                        style: TextStyle(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            fontFamily: "Jersey",
                            fontSize: 20),
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Tutorial(),),);
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
