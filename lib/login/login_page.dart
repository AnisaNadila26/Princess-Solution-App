import 'package:flutter/material.dart';
import 'package:princess_solution/login/login_notifier.dart';
// import 'package:princess_solution/menu/menu_page.dart';
import 'package:provider/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginNotifier(context),
      child: Consumer<LoginNotifier>(
        builder: (context, value, child) => Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text(
                'Masuk',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              centerTitle: true,
            ),
            body: SafeArea(
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        child: Image(
                          image: AssetImage('assets/login.png'),
                          width: 300,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Form(
                            key: value.keyForm,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 16,
                                ),
                                TextFormField(
                                  controller: value.email,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Wajib diisi";
                                    } else {
                                      return null;
                                    }
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    icon: Icon(MdiIcons.account),
                                    labelText: 'Email',
                                    floatingLabelStyle:
                                        const TextStyle(color: Colors.black),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                          width: 2,
                                        )),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(
                                          color: Colors.black,
                                          width: 2,
                                        )),
                                    errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                          width: 2,
                                        )),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(
                                          color: Colors.black,
                                          width: 2,
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                TextFormField(
                                  controller: value.password,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Wajib diisi";
                                    } else {
                                      return null;
                                    }
                                  },
                                  obscureText: value.obsecureText,
                                  decoration: InputDecoration(
                                      icon: Icon(MdiIcons.lock),
                                      labelText: 'Password',
                                      floatingLabelStyle:
                                          const TextStyle(color: Colors.black),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(20),
                                          borderSide: BorderSide(
                                            color: Colors.grey,
                                            width: 2,
                                          )),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(20),
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 2,
                                          )),
                                      errorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(20),
                                          borderSide: BorderSide(
                                            color: Colors.grey,
                                            width: 2,
                                          )),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(20),
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 2,
                                          )),
                                      suffixIcon: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            value.obsecureText =
                                                !value.obsecureText;
                                          });
                                        },
                                        child: Icon(value.obsecureText ? MdiIcons.eyeOff : MdiIcons.eye),
                                      )),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                SizedBox(
                                  height: 50,
                                  width: 100,
                                  child: InkWell(
                                      onTap: () {
                                        value.cekLogin();
                                      },
                                      child: Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: Color.fromRGBO(0, 0, 0, 1),
                                            // border: Border.all(
                                            //   color: Colors.black,
                                            // ),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Text(
                                            'Masuk',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ))),
                                  // child: TextButton(
                                  //     style: TextButton.styleFrom(
                                  //       foregroundColor: Colors.white,
                                  //       backgroundColor: Colors.black,
                                  //     ),
                                  //     onPressed: () {
                                  //       Navigator.pushAndRemoveUntil(
                                  //           context,
                                  //           MaterialPageRoute(
                                  //               builder: (context) => const MenuPage()),
                                  //           (route) => false);
                                  //     },
                                  //     child: Container(
                                  //       padding: EdgeInsets.all(16),
                                  //       child: Text('Masuk'),
                                  //     )),
                                ),
                              ],
                            )),
                      )
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}