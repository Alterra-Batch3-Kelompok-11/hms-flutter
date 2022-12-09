import 'package:flutter/material.dart';
import 'package:hospital_management_system/screens/global_widgets/global_button.dart';
import 'package:hospital_management_system/utils/constant.dart';

class HelperDialog {
  static SnackBar snackBarMessage(
      {required String title, required String message}) {
    return SnackBar(
      backgroundColor: Constant.backgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Constant.verticalPadding),
          topRight: Radius.circular(Constant.verticalPadding),
        ),
      ),
      content: SizedBox(
        height: 40,
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              title,
              style: Constant.primaryTextStyle.copyWith(
                fontSize: 13,
                fontWeight: Constant.boldFontWeight,
                color: Constant.errorColor,
              ),
            ),
            Text(
              message,
              style: Constant.primaryTextStyle.copyWith(
                fontSize: 10,
                color: Constant.errorColor,
              ),
            )
          ],
        ),
      ),
    );
  }

  static Future<void> alertDialog(
    BuildContext context, {
    required String titleText,
    required String buttonSubmitText,
    required IconData icon,
    Color? color,
    required void Function() onSubmit,
  }) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            backgroundColor: Constant.whiteColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
            title: Center(
              child: Column(
                children: [
                  Icon(
                    icon,
                    size: 50,
                    color: color ?? Constant.darker,
                  ),
                  const SizedBox(
                    height: 19,
                  ),
                  Text(
                    titleText,
                    style: Constant.primaryTextStyle.copyWith(
                      fontSize: Constant.firstTitleSize,
                      fontWeight: Constant.semiBoldFontWeight,
                    ),
                  ),
                ],
              ),
            ),
            // content: Icon(
            //   icon,
            //   size: 100,
            //   color: Constant.darker,
            // ),
            // contentPadding: const EdgeInsets.all(5),
            actionsAlignment: MainAxisAlignment.spaceEvenly,
            titlePadding:
                const EdgeInsets.symmetric(vertical: Constant.verticalPadding),
            actionsPadding: const EdgeInsets.only(
              bottom: Constant.verticalPadding,
              right: Constant.horizontalPadding,
              left: Constant.horizontalPadding,
            ),
            actions: [
              GlobalButton(
                onPressed: onSubmit,
                buttonChild: Text(
                  buttonSubmitText,
                  style: Constant.primaryTextStyle.copyWith(
                    fontSize: 13,
                    color: Constant.backgroundColor,
                    fontWeight: Constant.semiBoldFontWeight,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  static Future<void> confirmationDialog(
    BuildContext context, {
    required String titleText,
    required String subTitle,
    required String buttonSubmitText,
    required IconData icon,
    required Color buttonSubmitColor,
    required String buttonCancelText,
    Color? color,
    required void Function() onSubmit,
    bool? isLoading = false,
  }) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Constant.whiteColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
          title: Center(
            child: Column(
              children: [
                Icon(
                  icon,
                  size: 30,
                  color: color ?? Constant.baseColor,
                ),
                const SizedBox(
                  height: 19,
                ),
                Text(
                  titleText,
                  style: Constant.primaryTextStyle.copyWith(
                    fontSize: Constant.firstTitleSize,
                    fontWeight: Constant.semiBoldFontWeight,
                  ),
                ),
              ],
            ),
          ),
          content: Text(
            subTitle,
            style: Constant.primaryTextStyle.copyWith(
              fontSize: Constant.subtitleFontSize,
              fontWeight: Constant.regularFontWeight,
            ),
            textAlign: TextAlign.center,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: Constant.horizontalPadding,
          ),
          actionsAlignment: MainAxisAlignment.spaceEvenly,
          titlePadding:
              const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          actionsPadding: const EdgeInsets.symmetric(vertical: 20),
          actions: [
            GlobalButton(
                onPressed: () => Navigator.pop(context),
                color: Constant.whiteColor,
                side: const BorderSide(
                  color: Constant.baseColor,
                ),
                fixedWidth: MediaQuery.of(context).size.width / 3,
                buttonChild: Text(
                  buttonCancelText,
                  style: Constant.primaryTextStyle.copyWith(
                    fontSize: 15,
                    color: Constant.baseColor,
                    fontWeight: Constant.mediumFontWeight,
                  ),
                )),
            GlobalButton(
                onPressed: onSubmit,
                fixedWidth: MediaQuery.of(context).size.width / 3,
                buttonChild: Text(
                  buttonSubmitText,
                  style: Constant.primaryTextStyle.copyWith(
                    fontSize: 15,
                    color: Constant.whiteColor,
                    fontWeight: Constant.mediumFontWeight,
                  ),
                  textAlign: TextAlign.center,
                ))
          ],
        );
      },
    );
  }
}
