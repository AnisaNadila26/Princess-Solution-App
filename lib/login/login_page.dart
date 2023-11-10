import 'package:flutter/material.dart';
import 'package:princess_solution/login/login_notifier.dart';
// import 'package:princess_solution/menu/menu_page.dart';
import 'package:provider/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginNotifier(context),
      child: Consumer<LoginNotifier>(
        builder: (context, value, child) => Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text(
                'Masuk',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              centerTitle: true,
            ),
            body: Stack(children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/road_login.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SafeArea(
                child: ListView(
                  reverse: true,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        // border: Border.all(
                        //   color: Color.fromRGBO(226, 235, 245, 1.0),
                        //   width: 3.0,
                        // ),
                      ),
                      // margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Transform.translate(
                          offset: Offset(0, -60),
                          child: Form(
                              key: value.keyForm,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image(
                                    image: AssetImage('assets/car_login.png'),
                                    height: MediaQuery.of(context).size.height *
                                        0.2,
                                  ),
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
                                    obscureText: !value.passwordVisible,
                                    decoration: InputDecoration(
                                        icon: Icon(MdiIcons.lock),
                                        labelText: 'Password',
                                        suffixIcon: GestureDetector(
                                          onTap: () {
                                            value.passwordVisibility();
                                          },
                                          child: Icon(value.passwordVisible
                                              ? MdiIcons.eye
                                              : MdiIcons.eyeOff),
                                        )),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.06,
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: InkWell(
                                        onTap: () {
                                          value.cekLogin();
                                        },
                                        child: Container(
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  76, 105, 176, 1.0),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Text(
                                              'Masuk',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                            ))),
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ])),
      ),
    );
  }
}