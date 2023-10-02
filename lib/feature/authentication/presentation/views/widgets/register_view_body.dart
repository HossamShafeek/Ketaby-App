import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/config/routes/app_routes.dart';
import 'package:ketaby/core/functions/show_snack_bar.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/core/utils/app_strings.dart';
import 'package:ketaby/core/utils/app_styles.dart';
import 'package:ketaby/core/widgets/gradient_button.dart';
import 'package:ketaby/feature/authentication/presentation/views/widgets/title_and_subtitle.dart';
import 'package:ketaby/feature/authentication/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:ketaby/feature/authentication/presentation/cubits/register_cubit/register_state.dart';
import 'package:ketaby/feature/authentication/presentation/views/widgets/register_texts_fields_section.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          AppConstants.token = state.authenticationModel.data!.token!;
          Navigator.pushReplacementNamed(context, Routes.layoutView);
          showSuccessSnackBar(
              context: context, message: state.authenticationModel.message!);
        } else if (state is RegisterFailureState) {
          showErrorSnackBar(context: context, message: state.error);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is RegisterLoadingState,
          color: Colors.white,
          opacity: 0.5,
          progressIndicator: const CircularProgressIndicator(),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(AppConstants.defaultPadding),
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TitleAndSubtitle(
                      subtitle: AppStrings.signUpSubtitle,
                      title: AppStrings.signUp,
                      buttonTitle: AppStrings.signIn,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const RegisterTextsFieldsSection(),
                    GradientButton(
                      title: Text(
                        AppStrings.signUp,
                        style: AppStyles.textStyle16
                            .copyWith(color: AppColors.white),
                      ),
                      onPressed: () {
                        if (RegisterCubit.get(context)
                            .formKey
                            .currentState!
                            .validate()) {
                          RegisterCubit.get(context).userRegister();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
