// ignore_for_file: public_member_api_docs, sort_constructors_first

class InsertPatientConditionModel {
  final int treatmentId;
  final int outPatientSessionId;
  final int patientId;
  final int doctorId;
  final String finishedAt;
  final String finishedAtIndo;

  InsertPatientConditionModel(
      {required this.treatmentId,
      required this.outPatientSessionId,
      required this.patientId,
      required this.doctorId,
      required this.finishedAt,
      required this.finishedAtIndo});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'treatment_id': treatmentId,
      'outPatientsession_id': outPatientSessionId,
      'patientId': patientId,
      'doctorId': doctorId,
      'finishedAt': finishedAt,
      'finishedAtIndo': finishedAtIndo,
    };
  }

  factory InsertPatientConditionModel.fronJson(Map<String, dynamic> json) {
    return InsertPatientConditionModel(
      treatmentId: json['treatment_id'] ?? 0,
      outPatientSessionId: json['outpatient_session_id'] ?? 0,
      patientId: json['patient_id'] ?? 0,
      doctorId: json['doctor_id'] ?? 0,
      finishedAt: json['finished_at'] ?? "",
      finishedAtIndo: json['finished_at_indo'] ?? "",
    );
  }
}



//  "treatment_id": 1,
//     "outpatient_session_id": 2,
//     "patient_id": 1,
//     "doctor_id": 7,
//     "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque convallis, arcu id mattis lacinia, tellus nunc sagittis risus, ut egestas sem eros a neque. Ut efficitur non neque dictum vehicula.",
//     "medicine": "paracetamol",
//     "allergy": "debu",
//     "is_finish": true,
//     "finished_at": "2022-12-09T18:48:21.559971+07:00",
//     "finished_at_indo": "09 Desember 2022"