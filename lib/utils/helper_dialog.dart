import 'package:flutter/material.dart';
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
    required void Function() onSubmit,
  }) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            backgroundColor: Constant.backgroundColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: Center(
              child: Text(
                titleText,
                style: Constant.primaryTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: Constant.boldFontWeight,
                ),
              ),
            ),
            content: Icon(
              icon,
              size: 100,
              color: Constant.darker,
            ),
            contentPadding: const EdgeInsets.all(5),
            actionsAlignment: MainAxisAlignment.spaceEvenly,
            titlePadding: const EdgeInsets.symmetric(vertical: 20),
            actionsPadding: const EdgeInsets.symmetric(vertical: 20),
            actions: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    fixedSize:
                        Size(MediaQuery.of(context).size.width / 2.3, 43),
                    backgroundColor: Constant.lightColor,
                  ),
                  onPressed: onSubmit,
                  child: Center(
                    child: Text(
                      buttonSubmitText,
                      style: Constant.primaryTextStyle.copyWith(
                        fontSize: 13,
                        fontWeight: Constant.semiBoldFontWeight,
                      ),
                    ),
                  ))
            ],
          ),
        );
      },
    );
  }

  static Future<void> confirmationDialog(
    BuildContext context, {
    required String titleText,
    required String buttonSubmitText,
    required IconData icon,
    required Color buttonSubmitColor,
    required void Function() onSubmit,
    bool? isLoading = false,
  }) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Constant.backgroundColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: Center(
            child: Text(
              titleText,
              style: Constant.primaryTextStyle.copyWith(
                fontSize: 17,
                fontWeight: Constant.boldFontWeight,
              ),
            ),
          ),
          content: Icon(
            icon,
            size: 100,
            color: Constant.baseColor,
          ),
          contentPadding: const EdgeInsets.all(5),
          actionsAlignment: MainAxisAlignment.spaceEvenly,
          titlePadding:
              const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          actionsPadding: const EdgeInsets.symmetric(vertical: 20),
          actions: [
            ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: const BorderSide(
                      color: Constant.baseColor,
                    ),
                  ),
                  fixedSize: Size(MediaQuery.of(context).size.width / 4, 40),
                  backgroundColor: Constant.baseColor,
                ),
                child: Text(
                  "Back",
                  style: Constant.primaryTextStyle.copyWith(
                    fontSize: 15,
                  ),
                )),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  fixedSize: Size(MediaQuery.of(context).size.width / 4, 40),
                  backgroundColor: buttonSubmitColor,
                ),
                onPressed: onSubmit,
                child: Text(
                  buttonSubmitText,
                  style: Constant.primaryTextStyle.copyWith(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ))
          ],
        );
      },
    );
  }
}
