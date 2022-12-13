import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/routes/route_names.dart';
import 'package:hospital_management_system/screens/global_widgets/global_button.dart';
import 'package:hospital_management_system/screens/global_widgets/global_text_field.dart';
import 'package:hospital_management_system/utils/constant.dart';
import 'package:hospital_management_system/utils/helper_dialog.dart';
import 'package:hospital_management_system/view_model/patient_view_model/patient_bloc.dart';

class AddPatientDataScreen extends StatefulWidget {
  const AddPatientDataScreen({Key? key, required this.outPatientId})
      : super(key: key);

  @override
  State<AddPatientDataScreen> createState() => _AddPatientDataScreenState();
  final int outPatientId;
}

class _AddPatientDataScreenState extends State<AddPatientDataScreen> {
  late TextEditingController _inputAlergyController;
  late TextEditingController _inputConditionController;
  late TextEditingController _inputMedicineController;

  final List<String> patientStatus = ["Outpatient", "Inpatient"];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final FocusNode fieldAlergyFocusNode = FocusNode();
  final FocusNode fieldConditionFocusNode = FocusNode();
  final FocusNode fieldDrugFocusNode = FocusNode();
  ValueNotifier<bool> onFieldAlergyFocus = ValueNotifier(false);
  ValueNotifier<bool> onFiedlConditionFocus = ValueNotifier(false);
  ValueNotifier<bool> onFiedlDrugFocus = ValueNotifier(false);
  ValueNotifier<bool> onSelectedStatusPatient = ValueNotifier(false);

  ValueNotifier<bool> checkValidateField = ValueNotifier(false);

  updatePatientStatus(String status) {
    var result = (status == "");
    onSelectedStatusPatient.value = result;
  }

  @override
  void initState() {
    _inputAlergyController = TextEditingController();
    _inputConditionController = TextEditingController();
    _inputMedicineController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _inputAlergyController.clear();
    _inputConditionController.clear();
    _inputMedicineController.clear();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    context.read<PatientBloc>().stream.listen((state) {
      print("PATIENT STATE : $state");
      if (state is SuccessInsertCondition) {
        Navigator.pushNamedAndRemoveUntil(
            context, RouteNames.navbar, (route) => false);
      } else if (state is PatientError) {
        print("ERROR MESSAGE : ${state.message}");
      }
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
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
                onChange: (value) {
                  if (_inputAlergyController.text.isEmpty &&
                      _inputConditionController.text.isEmpty &&
                      _inputMedicineController.text.isEmpty) {
                    checkValidateField.value = false;
                  } else {
                    checkValidateField.value = true;
                  }
                  return null;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "field can not be empty";
                  } else {
                    return null;
                  }
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
                onChange: (value) {
                  if (_inputAlergyController.text.isEmpty &&
                      _inputConditionController.text.isEmpty &&
                      _inputMedicineController.text.isEmpty) {
                    checkValidateField.value = false;
                  } else {
                    checkValidateField.value = true;
                  }
                  return null;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "field can not be empty";
                  } else {
                    return null;
                  }
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
              fieldController: _inputMedicineController,
              onChange: (value) {
                if (_inputAlergyController.text.isEmpty &&
                    _inputConditionController.text.isEmpty &&
                    _inputMedicineController.text.isEmpty) {
                  checkValidateField.value = false;
                } else {
                  checkValidateField.value = true;
                }
                return null;
              },
              validator: (value) {
                if (value == null) {
                  return "field can not be empty";
                } else {
                  return null;
                }
              },
              hintText: "Masukkan Obat",
              valueNotifier: onFiedlDrugFocus,
              focusNode: fieldDrugFocusNode,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(
            horizontal: Constant.horizontalPadding,
            vertical: Constant.verticalPadding),
        child: ValueListenableBuilder(
            valueListenable: checkValidateField,
            builder: (context, bool val, _) {
              return GlobalButton(
                color: (val) ? Constant.baseColor : Constant.processColor,
                onPressed: () {
                  print("widget.outPatientId : ${widget.outPatientId}");
                  print(_formKey.currentState!.validate());
                  if (_formKey.currentState!.validate()) {
                    HelperDialog.confirmationDialog(context,
                        titleText: "Konfirmasi",
                        subTitle:
                            "Apakan anda yakin ingin menyimpan data pasien?",
                        buttonSubmitText: "Ya",
                        icon: const Icon(Icons.question_mark_outlined),
                        buttonCancelText: "Tidak", onSubmit: () {
                      context.read<PatientBloc>().add(InsertConditionPatient(
                          patientSessionId: 2,
                          allergy: _inputAlergyController.text,
                          condition: _inputConditionController.text,
                          medicine: _inputMedicineController.text));
                    });
                  }
                },
                buttonChild: Text(
                  "Simpan",
                  style: Constant.primaryTextStyle.copyWith(
                    fontSize: Constant.subtitleFontSize,
                    fontWeight: Constant.semiBoldFontWeight,
                    color: Colors.white,
                  ),
                ),
              );
            }),
      ),
    );
  }
}
