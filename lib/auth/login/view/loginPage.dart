import 'package:flutter/material.dart';
import 'package:tasker/auth/login/controller/firebaseAuth.dart';
import 'package:tasker/constants/Widgets/customSpacer.dart';
import 'package:tasker/constants/Widgets/loader.dart';
import 'package:tasker/constants/Widgets/raisedbutton.dart';
import 'package:tasker/constants/Widgets/themeChangerIcon.dart';
import 'package:tasker/home/view/homePage.dart';
import 'package:tasker/responsive.dart';
import 'package:tasker/routes/routeFunctions.dart';
import 'package:tasker/theme/themeAssets.dart';

class LoginPage extends StatefulWidget {
  static String route = "/login";
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  BuildContext pageContext;
  TextStyle headlineStyle;
  TextStyle headlineStyle6;
  TextStyle headlineStyle3;
  TextStyle subtitleText;
  TextStyle hintText;
  TextEditingController emailCTRL = TextEditingController();
  TextEditingController pwdCTRL = TextEditingController();
  bool isPwdVisible = false, isLogging = false;
  GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    pageContext = context;
    headlineStyle = Theme.of(context)
        .textTheme
        .headline5
        .copyWith(fontWeight: FontWeight.bold);
    headlineStyle6 = Theme.of(context).textTheme.headline6;
    headlineStyle3 = Theme.of(context).textTheme.headline3;
    subtitleText = Theme.of(context)
        .textTheme
        .subtitle1
        .copyWith(color: Colors.grey, fontSize: 15);
    hintText =
        Theme.of(context).textTheme.subtitle2.copyWith(color: Colors.grey);
    return Scaffold(
      body: _body(),
    );
  }

  _body() {
    return Responsive(
      mobile: _mobileBody(),
      tablet: _tabletBody(),
      desktop: _desktopBody(),
    );
  }

  _mobileBody() {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _appBar(),
        customSpacer(b: 100),
        Center(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _loginForm(width: size.width),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _tabletBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _appBar(),
        customSpacer(b: 100),
        Center(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _loginForm(width: 400),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _desktopBody() {
    return Column(
      children: [
        _appBar(),
        customSpacer(b: 100),
        Center(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _loginForm(width: 500),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _appBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            RouteTo().pushNameReplaced(
                context: pageContext, routeName: LoginPage.route);
          },
          child: Row(
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
        ),
        Row(
          children: [ThemeChangerIcon()],
        ),
      ],
    );
  }

  _loginForm({@required double width}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Login",
              style: headlineStyle,
            ),
            customSpacer(b: 10),
            Text(
              "Sign into your account by entering your credentials below",
              style: subtitleText,
            ),
            customSpacer(b: 10),
            _form(width)
          ],
        ),
      ),
    );
  }

  _form(double width) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _emailField(width),
          customSpacer(b: 30),
          _passwordField(width),
          customSpacer(b: 30),
          _forgetPassword(),
          customSpacer(b: 20),
          _loginButton(),
        ],
      ),
    );
  }

  _emailField(width) {
    return Container(
      width: width,
      child: TextFormField(
        controller: emailCTRL,
        keyboardType: TextInputType.emailAddress,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (s) {
          bool emailValid = RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(s);
          if (s.isEmpty) {
            return 'Email address cannot be empty';
          }
          if (!emailValid) {
            return 'Provide valid email address';
          }
        },
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
          hintText: "Email Address",
          hintStyle: hintText,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.red),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.red),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }

  _forgetPassword() {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
          onTap: () {},
          child: Text(
            "Forgot password?",
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
    );
  }

  _passwordField(width) {
    return Container(
      width: width,
      child: TextFormField(
        controller: pwdCTRL,
        obscureText: isPwdVisible,
        keyboardType: TextInputType.visiblePassword,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (s) {
          if (s.isEmpty) {
            return 'Password cannot be empty';
          }
        },
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
          hintText: "Password",
          hintStyle: hintText,
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              tooltip: "Show/Hide Password",
              icon: Icon(isPwdVisible ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey),
              onPressed: () {
                setState(() {
                  isPwdVisible = !isPwdVisible;
                });
              },
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.red),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.red),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }

  _loginButton() {
    return SizedBox(
      height: 50,
      width: 220,
      child: isLogging
          ? Center(
              child: loader(size: 30),
            )
          : appRaisedButton(
              color: Theme.of(context).primaryColor,
              text: "Login",
              onTap: () async {
                if (_formKey.currentState.validate()) {
                  setState(() {
                    isLogging = true;
                  });
                  final user = await FireAuth().signInWithEmail(
                      emailCTRL.text.trim(), pwdCTRL.text.trim());
                  if (user != null) {
                    RouteTo().push(context: context, widget: HomePage(user:user));
                  }
                  setState(() {
                    isLogging = false;
                  });
                }
              }),
    );
  }
}
