

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_doct_app/core/network/api.state.dart';
import 'package:new_doct_app/core/utils/preety.dio.dart';
import 'package:new_doct_app/data/model/doctors.respone.dart';
import 'package:new_doct_app/data/model/perticulerDoctor.response.dart';

final doctorProvider = FutureProvider<DoctoresResponse>((ref) async {
final service = APIStateNetwork(await createDio());
return await service.getDoctors();
});

final perticulerDocotrProvider = FutureProvider.family<PerticulerDoctorResponse, String>((ref, id) async {
  final service = APIStateNetwork(await createDio());
  return await service.getDoctorDetail(id);
});