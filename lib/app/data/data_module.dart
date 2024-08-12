import 'package:challenge_app/app/data/interface/data_service.dart';
import 'package:challenge_app/app/data/services/firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DataModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addInstance<FirebaseFirestore>(FirebaseFirestore.instance);
    i.add<DataService>(FirestoreService.new);
  }
}
