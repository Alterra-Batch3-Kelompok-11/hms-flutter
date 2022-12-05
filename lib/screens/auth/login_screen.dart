import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospital_management_system/routes/route_names.dart';
import 'package:hospital_management_system/screens/global_widgets/global_button.dart';
import 'package:hospital_management_system/screens/global_widgets/global_text_field.dart';
import 'package:hospital_management_system/utils/constant.dart';

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

  @override
  void initState() {
    _usernameController = TextEditingController(text: "1029384756");
    _passwordController = TextEditingController(text: "john123");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    context.read<AuthBloc>().stream.listen((state) {
      if (state is SuccessLoginState) {
        Navigator.pushNamed(context, RouteNames.navbar);
      } else {}
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
          margin:
              const EdgeInsets.only(top: 140, left: 20, right: 20, bottom: 20),
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
                          return null;
                        }),
                    const SizedBox(height: 20),
                    GlobalTextField(
                        fieldController: _passwordController,
                        hintText: "Sandi",
                        obscureText: true,
                        valueNotifier: onFieldPasswordFocus,
                        focusNode: fieldPasswordFocus,
                        prefixIcon: Icons.lock,
                        // obscureText: true,
                        validator: (value) {
                          if (value == null) {
                            print("data ko");
                            return "required";
                          }
                          return null;
                        }),
                    Row(
                      children: [
                        Checkbox(
                          onChanged: (bool? value) {},
                          value: true,
                        ),
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
                        print(_passwordController.text);
                        if (_key.currentState!.validate()) {
                          context.read<AuthBloc>().add(AuthLogin(
                              username: _usernameController.text,
                              password: _passwordController.text));
                        }
                      },
                      buttonChild: BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          if (state is AuthLoadingState) {
                            return const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                color: Constant.backgroundColor,
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
    );
  }
}
