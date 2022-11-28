import 'package:flutter/material.dart';
import 'package:hospital_management_system/screens/global_widgets/global_button.dart';
import 'package:hospital_management_system/utils/constant.dart';

class AddPatientDataScreen extends StatefulWidget {
  const AddPatientDataScreen({Key? key}) : super(key: key);

  @override
  State<AddPatientDataScreen> createState() => _AddPatientDataScreenState();
}

class _AddPatientDataScreenState extends State<AddPatientDataScreen> {
  late TextEditingController _inputAlergyController;
  late TextEditingController _inputConditionController;
  late TextEditingController _inputDrugController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<bool> selectedOutpatient = [true, false];

  final FocusNode fieldInputAlergyFocus = FocusNode();
  final FocusNode fieldInputConditionFocus = FocusNode();
  final FocusNode fieldInputDrugFocus = FocusNode();
  var colorField = ValueNotifier(Colors.white);

  @override
  void initState() {
    _inputAlergyController = TextEditingController();
    _inputConditionController = TextEditingController();
    _inputDrugController = TextEditingController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
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
    print("berulang");
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
            TextFormField(
              validator: (value) => null,
              controller: _inputAlergyController,
              onTap: () {},
              decoration: InputDecoration(
                  filled: true,
                  enabledBorder: const OutlineInputBorder(),
                  disabledBorder: const OutlineInputBorder(),
                  hintText: 'Masukkan riwayat alergi pasien',
                  fillColor: (fieldInputAlergyFocus.hasFocus)
                      ? colorField.value
                      : Colors.white),
              focusNode: fieldInputAlergyFocus,
            ),
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
            TextFormField(
              validator: (value) => null,
              controller: _inputConditionController,
              maxLines: 5,
              maxLength: 120,
              decoration: InputDecoration(
                  filled: true,
                  enabledBorder: const OutlineInputBorder(),
                  disabledBorder: const OutlineInputBorder(),
                  hintText: 'Masukkan kondisi terkini pasien',
                  fillColor: (fieldInputConditionFocus.hasFocus)
                      ? colorField.value
                      : Colors.white),
              focusNode: fieldInputConditionFocus,
            ),
            const SizedBox(
              height: 20,
            ),
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
            TextFormField(
              validator: (value) => null,
              controller: _inputDrugController,
              onTap: () {},
              decoration: InputDecoration(
                  filled: true,
                  enabledBorder: const OutlineInputBorder(),
                  disabledBorder: const OutlineInputBorder(),
                  hintText: 'Masukkan Obat',
                  fillColor: (fieldInputAlergyFocus.hasFocus)
                      ? colorField.value
                      : Colors.white),
              focusNode: fieldInputAlergyFocus,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(
            horizontal: Constant.horizontalPadding,
            vertical: Constant.verticalPadding),
        child: GlobalButton(onPressed: () {}, buttonTitle: "Simpan"),
      ),
    );
  }
}
