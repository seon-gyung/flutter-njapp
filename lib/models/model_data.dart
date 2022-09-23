// models/model_data.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class Data {
  late String id;
  late String siteCode; // 해당 사이트
  late String mtrNo; // 계기번호
  late String mtrType; // 계기종류
  late String mtrDt; // 계기시각
  late String readDt; // 현재시각
  late num currFCumActE; // 현재 누적 순방향 유효
  late num currFPf; // 현재 순방향 평균역률
  late num currDemand; // 현월 최대수요전력
  late String currDemandDt; // 현월 최대수요전력 발생일시
  late String regdt; // 등록일시

  Data({
    required this.id,
    required this.siteCode,
    required this.mtrNo,
    required this.mtrType,
    required this.mtrDt,
    required this.readDt,
    required this.currFCumActE,
    required this.currFPf,
    required this.currDemand,
    required this.currDemandDt,
    required this.regdt,
  });

  Data.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    id = snapshot.id;
    siteCode = data['siteCode'];
    mtrNo = data['mtrNo'];
    mtrType = data['mtrType'];
    mtrDt = data['mtrDt'];
    readDt = data['readDt'];
    currFCumActE = data['currFCumActE'];
    currFPf = data['currFPf'];
    currDemand = data['currDemand'];
    currDemandDt = data['currDemandDt'];
    regdt = data['regdt'];
  }
}