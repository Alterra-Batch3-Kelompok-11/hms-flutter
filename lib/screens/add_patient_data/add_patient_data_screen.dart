import 'package:flutter/material.dart';
import 'package:hospital_management_system/screens/global_widgets/global_button.dart';
import 'package:hospital_management_system/screens/global_widgets/global_text_field.dart';
import 'package:hospital_management_system/utils/constant.dart';
import 'package:hospital_management_system/utils/helper_dialog.dart';

class AddPatientDataScreen extends StatefulWidget {
  const AddPatientDataScreen({Key? key}) : super(key: key);

  @override
  State<AddPatientDataScreen> createState() => _AddPatientDataScreenState();
}

class _AddPatientDataScreenState extends State<AddPatientDataScreen> {
  late TextEditingController _inputAlergyController;
  late TextEditingController _inputConditionController;
  late TextEditingController _inputDrugController;
  late String _inputPatientStatus;

  final List<String> patientStatus = ["Outpatient", "Inpatient"];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final FocusNode fieldAlergyFocusNode = FocusNode();
  final FocusNode fieldConditionFocusNode = FocusNode();
  final FocusNode fieldDrugFocusNode = FocusNode();
  ValueNotifier<bool> onFieldAlergyFocus = ValueNotifier(false);
  ValueNotifier<bool> onFiedlConditionFocus = ValueNotifier(false);
  ValueNotifier<bool> onFiedlDrugFocus = ValueNotifier(false);
  ValueNotifier<bool> onSelectedStatusPatient = ValueNotifier(false);

  updatePatientStatus(String status) {
    var result = (status == "");
    onSelectedStatusPatient.value = result;
  }

  @override
  void initState() {
    _inputAlergyController = TextEditingController();
    _inputConditionController = TextEditingController();
    _inputDrugController = TextEditingController();
    _inputPatientStatus = "";
    super.initState();
  }

  @override
  void dispose() {
    _inputAlergyController.clear();
    _inputConditionController.clear();
    _inputDrugController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("BERULANG");
    return Scaffold(
      backgroundColor: Constant.backgroundColor,
      appBar: AppBar(
        backgroundColor: Constant.lightColor,
        elevation: 0,
        title: Text(
          "Data Kondisi Pasien",
          style: Constant.primaryTextStyle.copyWith(
            fontWeight: Constant.boldFontWeight,
            fontSize: Constant.firstTitleSize,
            color: Colors.white,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(
            vertical: Constant.verticalPadding,
            horizontal: Constant.horizontalPadding,
          ),
          children: [
            Text(
              "Alergi",
              style: Constant.primaryTextStyle.copyWith(
                fontSize: Constant.secondTitleFontSize,
                fontWeight: Constant.boldFontWeight,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GlobalTextField(
                fieldController: _inputAlergyController,
                validator: (value) {
                  return null;
                },
                hintText: "Masukkan riwayat alergi pasien",
                valueNotifier: onFieldAlergyFocus,
                focusNode: fieldAlergyFocusNode),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Kondisi",
              style: Constant.primaryTextStyle.copyWith(
                fontSize: Constant.secondTitleFontSize,
                fontWeight: Constant.boldFontWeight,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GlobalTextField(
                fieldController: _inputConditionController,
                validator: (value) {
                  return null;
                },
                maxLength: 120,
                maxLine: 5,
                hintText: "Masukkan kondisi terkini pasien",
                valueNotifier: onFiedlConditionFocus,
                focusNode: fieldConditionFocusNode),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Obat",
              style: Constant.primaryTextStyle.copyWith(
                fontSize: Constant.secondTitleFontSize,
                fontWeight: Constant.boldFontWeight,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GlobalTextField(
              fieldController: _inputDrugController,
              validator: (value) {
                return null;
              },
              hintText: "Masukkan Obat",
              valueNotifier: onFiedlDrugFocus,
              focusNode: fieldDrugFocusNode,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Status Pasien",
              style: Constant.primaryTextStyle.copyWith(
                fontSize: Constant.secondTitleFontSize,
                fontWeight: Constant.boldFontWeight,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Wrap(
              spacing: 20,
              children: patientStatus.map((status) {
                return ValueListenableBuilder(
                  valueListenable: onSelectedStatusPatient,
                  builder: ((context, value, child) {
                    return ChoiceChip(
                      selectedColor: Constant.lighterColor,
                      backgroundColor: Colors.white,
                      label: Container(
                        margin: const EdgeInsets.all(10),
                        child: Text(status,
                            style: Constant.primaryTextStyle.copyWith(
                              fontSize: Constant.subtitleFontSize,
                              color: Constant.baseColor,
                              fontWeight: Constant.semiBoldFontWeight,
                            )),
                      ),
                      selected: _inputPatientStatus == status,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: const BorderSide(color: Constant.baseColor)),
                      onSelected: (bool selected) {
                        setState(() {
                          _inputPatientStatus = (selected ? status : null)!;
                          print(_inputPatientStatus);
                        });
                      },
                    );
                  }),
                );
              }).toList(),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(
            horizontal: Constant.horizontalPadding,
            vertical: Constant.verticalPadding),
        child: GlobalButton(
            onPressed: () {
              HelperDialog.alertDialog(context,
                  titleText: "titleText",
                  buttonSubmitText: "submit",
                  icon: Icons.abc,
                  onSubmit: () {});
            },
            buttonTitle: "Simpan"),
      ),
    );
  }
}
