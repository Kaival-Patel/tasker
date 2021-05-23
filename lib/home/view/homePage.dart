import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasker/constants/Widgets/customSpacer.dart';
import 'package:tasker/constants/Widgets/outlinebutton.dart';
import 'package:tasker/constants/Widgets/raisedbutton.dart';
import 'package:tasker/responsive.dart';
import 'package:tasker/theme/themeAssets.dart';
import 'package:tasker/theme/themeChanger.dart';
import 'package:tasker/theme/themeColors.dart';
import 'package:tasker/theme/themeData.dart';

class HomePage extends StatelessWidget {
  static String route = "/home";
  BuildContext pageCtx;
  TextStyle headlineStyle;
  TextStyle headlineStyle6;
  TextStyle headlineStyle3;
  ThemeChanger themeProvider;
  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of<ThemeChanger>(context);
    headlineStyle = Theme.of(context).textTheme.headline4;
    headlineStyle6 = Theme.of(context).textTheme.headline6;
    headlineStyle3 = Theme.of(context).textTheme.headline3;
    pageCtx = context;
    return Scaffold(body: _body(context));
  }

  _appBar(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Responsive(
            mobile: _mobileAppBar(),
            tablet: _tabletAppBar(),
            desktop: _desktopAppBar()),
      ),
    );
  }

  _mobileAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: Align(
            alignment: Alignment.topLeft,
            child: _loginButton(),
          ),
        ),
        Expanded(
          flex: 2,
          child: Align(
            alignment: Alignment.topCenter,
            child: Row(
              children: [
                Image.asset(
                  ThemeAssets.appIcon,
                  height: 30,
                  width: 40,
                  alignment: Alignment.center,
                ),
                customSpacer(r: 3),
                Text(
                  "TASKER",
                  style: headlineStyle6,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              children: [_registerButton(), _themeChangerIcon()],
            ),
          ),
        )
      ],
    );
  }

  _tabletAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              ThemeAssets.appIcon,
              height: 30,
              width: 40,
              alignment: Alignment.center,
            ),
            customSpacer(r: 5),
            Text(
              "TASKER",
              style: headlineStyle6,
            ),
          ],
        ),
        Row(
          children: [
            _loginButton(),
            _registerButton(),
            _themeChangerIcon(),
          ],
        ),
      ],
    );
  }

  _desktopAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              ThemeAssets.appIcon,
              height: 30,
              width: 40,
              alignment: Alignment.center,
            ),
            customSpacer(r: 5),
            Text(
              "TASKER",
              style: headlineStyle6,
            ),
          ],
        ),
        Row(
          children: [
            _loginButton(),
            _registerButton(),
            _themeChangerIcon(),
          ],
        ),
      ],
    );
  }

  _loginButton() {
    return SizedBox(
        height: 30,
        width: 90,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: appOutlineButton(
              color: Theme.of(pageCtx).primaryColor,
              text: "Login",
              onTap: () {}),
        ));
  }

  _registerButton() {
    return SizedBox(
        height: 30,
        width: 120,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: appRaisedButton(
              color: Theme.of(pageCtx).primaryColor,
              text: "Register",
              onTap: () {}),
        ));
  }

  _themeChangerIcon() {
    return IconButton(
      tooltip: "Change Theme",
        icon: Icon(
          themeProvider.getThemeMode == ThemeMode.dark
              ? Icons.wb_sunny
              : Icons.nightlight_round,
          color: themeProvider.getThemeMode == ThemeMode.dark
              ? Colors.yellow
              : Colors.blue,
        ),
        onPressed: () {
          themeProvider.toggleTheme();
        });
  }

  _body(BuildContext context) {
    return Responsive(
        mobile: _mobileBody(), tablet: _tabletBody(), desktop: _desktopBody());
  }

  _mobileBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _appBar(pageCtx),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _bannerSection(),
                  customSpacer(b: 20),
                  _addTaskSection(),
                  customSpacer(b: 20),
                  _teamViewSection(),
                  customSpacer(b: 20),
                  _contactUsSection(),
                ],
              ),
            ),
          ),
        ),
        _footer()
      ],
    );
  }

  _tabletBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _appBar(pageCtx),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _bannerSection(),
                  customSpacer(b: 30),
                  _addTaskSection(),
                  customSpacer(b: 30),
                  _teamViewSection(),
                  customSpacer(b: 30),
                  _contactUsSection(),
                ],
              ),
            ),
          ),
        ),
        _footer()
      ],
    );
  }

  _desktopBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _appBar(pageCtx),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _bannerSection(),
                  customSpacer(b: 40),
                  Padding(
                    padding: EdgeInsets.only(left: 100),
                    child: _addTaskSection(),
                  ),
                  customSpacer(b: 40),
                  Padding(
                    padding: EdgeInsets.only(left: 100),
                    child: _teamViewSection(),
                  ),
                  customSpacer(b: 40),
                  Padding(
                    padding: EdgeInsets.only(left: 150),
                    child: _contactUsSection(),
                  ),
                  
                ],
              ),
            ),
          ),
        ),
        _footer()
      ],
    );
  }

  _bannerSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Free To-Do Creator",
          style: headlineStyle3,
        ),
        Text(
          "Collaborate and do together",
          style: TextStyle(fontSize: 15, color: Colors.grey),
        ),
        customSpacer(b: 10),
        _startDoingBtn()
      ],
    );
  }

  _startDoingBtn() {
    return appRaisedButton(
        color: Theme.of(pageCtx).primaryColor,
        text: "Start Doing",
        onTap: () {});
  }

  _addTaskSection() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Add Task",
                  style: headlineStyle,
                ),
                Text(
                  "Simply add the task or your next goal",
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                customSpacer(b: 10),
                _addFirstTaskBtn()
              ],
            ),
          ),
          Expanded(
              flex: 2,
              child: Image.asset(
                ThemeAssets.todo,
                height: 240,
                width: 240,
                fit: BoxFit.contain,
              ))
        ],
      ),
    );
  }

  _addFirstTaskBtn() {
    return appRaisedButton(
        color: Theme.of(pageCtx).primaryColor,
        text: "Add First Task",
        onTap: () {});
  }

  _teamViewSection() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              flex: 2,
              child: Image.asset(
                ThemeAssets.teamView,
                height: 240,
                width: 240,
                fit: BoxFit.contain,
              )),
          customSpacer(r: 10),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Team View",
                  style: headlineStyle,
                ),
                Text(
                  "Invite your team members and collaboratively manage the tasks",
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                customSpacer(b: 10),
                _teamViewBtn()
              ],
            ),
          ),
        ],
      ),
    );
  }

  _teamViewBtn() {
    return appRaisedButton(
        color: Theme.of(pageCtx).primaryColor,
        text: "Start Tasking now",
        onTap: () {});
  }

  _contactUsSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex:2,
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    ThemeAssets.appIcon,
                    height: 30,
                    width: 40,
                    alignment: Alignment.center,
                  ),
                  customSpacer(r: 5),
                  Text(
                    "TASKER",
                    style: headlineStyle,
                  ),
                ],
              ),
              Row(
                children: [
                  Text("Free and simple tasking app",style: TextStyle(fontSize: 15, color: Colors.grey),),
                ],
              )
            ],
          ),
        ),
        Expanded(
          flex:2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Contact us"),
              Text("Instagram",style: TextStyle(fontSize: 15, color: Colors.grey),),
              Text("Blog",style: TextStyle(fontSize: 15, color: Colors.grey),)
              
            ],
          ),
        )
      ],
    );
  }

  _footer() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 80,
        color: Colors.grey,
        child: Center(
          child: Text("Copyright 2021 Tasker. All rights reserved"),
        ),
      ),
    );
  }
}
