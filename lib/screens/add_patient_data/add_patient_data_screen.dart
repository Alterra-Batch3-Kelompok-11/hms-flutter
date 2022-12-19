import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/screens/global_widgets/global_button.dart';
import 'package:hospital_management_system/screens/global_widgets/global_text_field.dart';
import 'package:hospital_management_system/utils/constant.dart';
import 'package:hospital_management_system/utils/helper_dialog.dart';
import 'package:hospital_management_system/view_model/patient_view_model/patient_bloc.dart';

import '../../view_model/user_view_model/user_bloc.dart';

class AddPatientDataScreen extends StatefulWidget {
  AddPatientDataScreen(
      {Key? key, required this.patientSessionId, required this.patientId})
      : super(key: key);

  @override
  State<AddPatientDataScreen> createState() => _AddPatientDataScreenState();
  int patientSessionId;
  int patientId;
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

  @override
  void initState() {
    super.initState();
    _inputAlergyController = TextEditingController();
    _inputConditionController = TextEditingController();
    _inputMedicineController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _inputAlergyController.clear();
    _inputConditionController.clear();
    _inputMedicineController.clear();

    print("DISPOSE");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    context.read<PatientBloc>().stream.listen((state) {
      print("PATIENT STATE : $state");
      if (state is SuccessInsertCondition) {
        Navigator.pop(context);
        Navigator.pop(context);

        context.read<UserBloc>().add(GetUserRole());
        context.read<PatientBloc>().add(GetDetailOutpatient(
            outSessionId: state.outPatientSessionId,
            patientId: state.outPatientId));
        // widget.patientId = state.outPatientId;
        // widget.patientId = state.outPatientId;

        HelperDialog.snackBar(
            context: context,
            message: "Berhasil menyimpan kondisi pasien",
            bottomMargin: 750);
      } else if (state is PatientError) {
        Navigator.pop(context);
        HelperDialog.snackBar(
            context: context, message: state.message, bottomMargin: 890);
        print("ERROR MESSAGE : ${state.message}");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<UserBloc>().add(GetUserRole());
        context.read<PatientBloc>().add(GetDetailOutpatient(
            outSessionId: widget.patientSessionId,
            patientId: widget.patientId));
        return true;
      },
      child: Scaffold(
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
          // leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back),),
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
                  color: (checkValidateField.value)
                      ? Constant.baseColor
                      : Constant.processColor,
                  onPressed: () {
                    print("widget.outPatientId : ${widget.patientSessionId}");
                    print(_formKey.currentState!.validate());
                    if (_formKey.currentState!.validate()) {
                      HelperDialog.confirmationDialog(context,
                          titleText: "Konfirmasi",
                          subTitle:
                              "Apakan anda yakin ingin menyimpan data pasien?",
                          buttonSubmitChild:
                              BlocBuilder<PatientBloc, PatientState>(
                            builder: (context, state) {
                              if (state is PatientLoading) {
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
                                  "Ya",
                                  style: Constant.primaryTextStyle.copyWith(
                                    fontSize: 15,
                                    color: Constant.whiteColor,
                                    fontWeight: Constant.mediumFontWeight,
                                  ),
                                  textAlign: TextAlign.center,
                                );
                              }
                            },
                          ),
                          icon: const Icon(Icons.question_mark_outlined),
                          buttonCancelText: "Tidak",
                          onSubmit: () {
                            context.read<PatientBloc>().add(
                                InsertConditionPatient(
                                    patientSessionId: widget.patientSessionId,
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
      ),
    );
  }
}
