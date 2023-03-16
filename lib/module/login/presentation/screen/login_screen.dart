import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machinetestpkd/config/ui_themes/app_colors.dart';
import 'package:machinetestpkd/config/ui_themes/app_style.dart';
import 'package:machinetestpkd/config/widgets/custom_text_field.dart';
import 'package:machinetestpkd/constants/app_constants.dart';
import 'package:machinetestpkd/module/home/presentation/screen/home_screen.dart';
import 'package:machinetestpkd/module/login/presentation/bloc/login_bloc.dart';
import 'package:machinetestpkd/utils/helpers/media_query_helper.dart';
import 'package:machinetestpkd/utils/helpers/shared_prefrence_helper.dart';
import 'package:machinetestpkd/utils/helpers/snackbar_helper.dart';
import 'package:machinetestpkd/utils/helpers/upper_case_text_formater_helper.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginBloc = BlocProvider.of<LoginBloc>(context);

    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          if (state.isLogged) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (ctx) => const HomeScreen(),
              ),
            );
          }
        }
      },
      builder: (context, state) {
        return BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if (state is LoginLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is LoginFailure) {
              if (state.isFailed) {
                return showSnackBar(message: state.error, context: context);
              }
            }
            return Scaffold(
              resizeToAvoidBottomInset: false,
              body: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          login,
                          style: AppStyles.headerStyle,
                        ),
                        height20,
                        const Text(
                          loginText,
                          style: AppStyles.normalText,
                        ),
                        height20,
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: getResponsiveSize(context).width * 0.1,
                          ),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                makeInput(
                                  controller: _idController,
                                  label: unitIdText,
                                  textInputAction: TextInputAction.next,
                                  textInputType: TextInputType.number,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return requiredText;
                                    } else if (value.length > 1) {
                                      return "length of the Id should be one";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                makeInput(
                                  controller: _nameController,
                                  textInputType: TextInputType.text,
                                  inputFormatters: [UpperCaseTextFormatter()],
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return requiredText;
                                    } else if (value.length > 3 || value.length < 3) {
                                      return "three characters expected";
                                    } else {
                                      return null;
                                    }
                                  },
                                  label: userName,
                                  textInputAction: TextInputAction.next,
                                ),
                                makeInput(
                                  controller: _passwordController,
                                  textInputType: TextInputType.number,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return requiredText;
                                    } else if (value.length > 4 || value.length < 4) {
                                      return "password should be 4 letters";
                                    } else {
                                      return null;
                                    }
                                  },
                                  label: password,
                                  obscureText: true,
                                  textInputAction: TextInputAction.done,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: getResponsiveSize(context).width * 0.1,
                      ),
                      child: Container(
                        padding: const EdgeInsets.only(
                          top: 3,
                          left: 3,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 60,
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              loginBloc.add(LoginButtonPressed(
                                username: _nameController.text,
                                password: _passwordController.text,
                                id: _idController.text,
                              ));
                            } else {}
                          },
                          color: AppColors.redAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              40,
                            ),
                          ),
                          child: const Text(
                            signUpText,
                            style: AppStyles.buttonText,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
