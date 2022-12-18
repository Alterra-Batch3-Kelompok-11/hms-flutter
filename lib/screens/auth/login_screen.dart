import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospital_management_system/routes/route_names.dart';
import 'package:hospital_management_system/screens/global_widgets/global_button.dart';
import 'package:hospital_management_system/screens/global_widgets/global_text_field.dart';
import 'package:hospital_management_system/screens/navbar/navbar.dart';
import 'package:hospital_management_system/utils/constant.dart';
import 'package:hospital_management_system/utils/helper_dialog.dart';
import 'package:hospital_management_system/view_model/user_view_model/user_bloc.dart';

import '../../view_model/auth_view_model/auth_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode fieldUsernameFocus = FocusNode();
  FocusNode fieldPasswordFocus = FocusNode();
  ValueNotifier<bool> onFieldUsernameFocus = ValueNotifier(false);
  ValueNotifier<bool> onFieldPasswordFocus = ValueNotifier(false);
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  Color color = Colors.white;
  Color color1 = Colors.white;

  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  ValueNotifier<bool> isRemember = ValueNotifier(false);
  ValueNotifier<bool> isShowPassword = ValueNotifier(false);
  String? currentUsername;

  @override
  void initState() {
    context.read<AuthBloc>().add(IsRemember());

    context.read<AuthBloc>().stream.listen((state) {
      if (state is AuthIsRemember) {
        isRemember.value = state.isRemember;
        currentUsername = state.username;
        _usernameController.text = currentUsername!;
      }
    });
    _usernameController = TextEditingController(text: "1029384756");
    _passwordController = TextEditingController(text: "john123");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("REFRESH SCREEN");
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          print("LOGIN STATE : $state");
          if (state is AuthSuccessLoginState) {
            Navigator.pushNamedAndRemoveUntil(
                context, RouteNames.navbar, (route) => false,
                arguments: const NavbarScreen(
                  selectedIndex: 0,
                )).then((_) {
              return context.read<UserBloc>().add(GetDataUser());
            });
          } else if (state is AuthError) {
            HelperDialog.snackBar(
                context: context, message: state.message, bottomMargin: 780);
          }
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              alignment: Alignment.topCenter,
              image: const Image(
                image: AssetImage('assets/images/login_background.png'),
              ).image,
              fit: BoxFit.fitWidth,
            ),
          ),
          child: Container(
            height: 425,

            // color: Colors.white,
            margin: const EdgeInsets.only(
                top: 140, left: 20, right: 20, bottom: 20),
            padding: const EdgeInsets.only(top: 36, left: 20, right: 20),
            child: Form(
              key: _key,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        'Masuk',
                        style: GoogleFonts.poppins(
                            color: Colors.blue,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      GlobalTextField(
                          fieldController: _usernameController,
                          hintText: "Nomor Lisensi",
                          valueNotifier: onFieldUsernameFocus,
                          focusNode: fieldUsernameFocus,
                          prefixIcon: Icons.person,
                          validator: (value) {
                            if (value!.isEmpty) {
                              print("data kosong");
                              return "Tidak";
                            }
                            return null;
                          }),
                      const SizedBox(height: 20),
                      ValueListenableBuilder(
                          valueListenable: isShowPassword,
                          builder: (context, bool value, _) {
                            return GlobalTextField(
                                fieldController: _passwordController,
                                hintText: "Sandi",
                                valueNotifier: onFieldPasswordFocus,
                                focusNode: fieldPasswordFocus,
                                obscureText: value ? false : true,
                                maxLine: 1,
                                prefixIcon: Icons.lock,
                                suffixIcon: IconButton(
                                    splashColor: Colors.transparent,
                                    onPressed: () => isShowPassword.value =
                                        !isShowPassword.value,
                                    icon: value
                                        ? const Icon(Icons.visibility)
                                        : const Icon(Icons.visibility_off)),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    print("data kosong");
                                    return "Field can't empty";
                                  }
                                  return null;
                                });
                          }),
                      Row(
                        children: [
                          ValueListenableBuilder(
                              valueListenable: isRemember,
                              builder: (context, bool val, _) {
                                return Checkbox(
                                  onChanged: (bool? value) {
                                    isRemember.value = value!;
                                    print(isRemember.value);
                                  },
                                  value: isRemember.value,
                                );
                              }),
                          Text(
                            'Ingat saya',
                            style: GoogleFonts.poppins(
                                color: Colors.blue.shade900,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      GlobalButton(
                        onPressed: () {
                          print(_usernameController.text);
                          if (_key.currentState!.validate()) {
                            context.read<AuthBloc>().add(Login(
                                  username: _usernameController.text,
                                  password: _passwordController.text,
                                  isRemember: isRemember.value,
                                ));
                            FocusScope.of(context).unfocus();
                          }
                        },
                        buttonChild: BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            if (state is AuthLoadingState) {
                              return const SizedBox(
                                height: 30,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: Constant.whiteColor,
                                  strokeWidth: 2,
                                ),
                              );
                            } else {
                              return Text(
                                "Terima",
                                style: Constant.primaryTextStyle.copyWith(
                                  fontSize: Constant.subtitleFontSize,
                                  fontWeight: Constant.semiBoldFontWeight,
                                  color: Colors.white,
                                ),
                              );
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
