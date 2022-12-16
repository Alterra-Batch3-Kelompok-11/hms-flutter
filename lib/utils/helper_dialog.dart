import 'package:flutter/material.dart';
import 'package:hospital_management_system/screens/global_widgets/global_button.dart';
import 'package:hospital_management_system/utils/constant.dart';

class HelperDialog {
  static Future<void> snackBar({
    required BuildContext context,
    double? bottomMargin,
    required String message,
  }) async {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        margin: EdgeInsets.only(
          bottom: bottomMargin ?? 530,
          left: 10,
          right: 10,
        ),
        behavior: SnackBarBehavior.floating,
        content: Text(
          message,
          style: Constant.primaryTextStyle.copyWith(
            fontSize: Constant.bodyFontSize,
            fontWeight: Constant.mediumFontWeight,
            color: Constant.darkColor,
          ),
        ),
        duration: new Duration(seconds: 2),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        backgroundColor: Constant.lightestColor,
        action: SnackBarAction(
          label: 'x',
          textColor: Constant.darkColor,
          // close the snackbar
          onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
        ),
      ),
    );
  }

  // static SnackBar snackBarMessage(
  //     {required String title, required String message}) {
  //   return SnackBar(
  //     backgroundColor: Constant.backgroundColor,
  //     shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.only(
  //         topLeft: Radius.circular(Constant.verticalPadding),
  //         topRight: Radius.circular(Constant.verticalPadding),
  //       ),
  //     ),
  //     content: SizedBox(
  //       height: 40,
  //       width: double.maxFinite,
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //         children: [
  //           Text(
  //             title,
  //             style: Constant.primaryTextStyle.copyWith(
  //               fontSize: 13,
  //               fontWeight: Constant.boldFontWeight,
  //               color: Constant.errorColor,
  //             ),
  //           ),
  //           Text(
  //             message,
  //             style: Constant.primaryTextStyle.copyWith(
  //               fontSize: 10,
  //               color: Constant.errorColor,
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

  static Future<void> alertDialog(
    BuildContext context, {
    required String titleText,
    required String buttonSubmitText,
    // required IconData? icon,
    required Widget icon,
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
                  icon,
                  // Icon(
                  //   icon,
                  //   size: 50,
                  //   color: color ?? Constant.darker,
                  // ),
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
    required Widget buttonSubmitChild,
    required Widget icon,
    // required IconData icon,
    required String buttonCancelText,
    Color? color,
    Widget? titleWidget,
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
                icon,
                const SizedBox(
                  height: 10,
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
          actionsAlignment: MainAxisAlignment.spaceBetween,
          titlePadding: const EdgeInsets.only(top: 20, bottom: 10),
          actionsPadding: const EdgeInsets.all(20),
          actions: [
            GlobalButton(
                onPressed: () => Navigator.pop(context),
                color: Constant.whiteColor,
                side: BorderSide(
                  color: color ?? Constant.baseColor,
                ),
                fixedWidth: MediaQuery.of(context).size.width / 3,
                buttonChild: Text(
                  buttonCancelText,
                  style: Constant.primaryTextStyle.copyWith(
                    fontSize: 15,
                    color: color ?? Constant.baseColor,
                    fontWeight: Constant.mediumFontWeight,
                  ),
                )),
            GlobalButton(
                onPressed: onSubmit,
                fixedWidth: MediaQuery.of(context).size.width / 3,
                color: color ?? Constant.baseColor,
                buttonChild: buttonSubmitChild)
          ],
        );
      },
    );
  }
}
