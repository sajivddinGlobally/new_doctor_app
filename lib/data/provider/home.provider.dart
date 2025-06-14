import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_doct_app/core/network/api.state.dart';
import 'package:new_doct_app/core/utils/preety.dio.dart';
import 'package:new_doct_app/data/model/category.response.dart';
import 'package:new_doct_app/data/model/doctors.respone.dart';
import 'package:new_doct_app/data/model/qna.response.dart';
import 'package:new_doct_app/data/model/testimonials.response.dart';

final categoryResponseProvider = FutureProvider<DoctorCategoryResponse>((
  ref,
) async {
  final servie = APIStateNetwork(await createDio());
  return await servie.getCategory();
});

class ApiService {
  Future<DoctoresResponse> fetchDoctors() async {
    final service = APIStateNetwork(await createDio());
    return await service.getDoctors();
  }

  Future<DoctorCategoryResponse> fetchDoctorCategories() async {
    final service = APIStateNetwork(await createDio());
    return await service.getCategory();
  }

  Future<QuestionAnswerResponse> fetchQna() async {
    final service = APIStateNetwork(await createDio());
    return await service.getQna();
  }

  Future<TestimonialResponse> fetchTestimonials() async {
   final service = APIStateNetwork(await createDio());

   return await service.getTestimonials();
  }
}

final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService();
});

class CombinedDoctorData {
  final DoctoresResponse doctoresResponse;
  final DoctorCategoryResponse doctorCategoryResponse;
  final QuestionAnswerResponse qnaResponse;
  final TestimonialResponse testimonials;
  CombinedDoctorData({
    required this.doctoresResponse,
    required this.qnaResponse,
    required this.doctorCategoryResponse,
    required this.testimonials
  });
}

final combinedDoctorDataProvider = FutureProvider<CombinedDoctorData>((
  ref,
) async {
  final api = ref.watch(apiServiceProvider);
  final responses = await Future.wait([
    api.fetchDoctors(),
    api.fetchDoctorCategories(),
    api.fetchQna(),
    api.fetchTestimonials(),
  ]);
  return CombinedDoctorData(
    doctoresResponse: responses[0] as DoctoresResponse,
    doctorCategoryResponse: responses[1] as DoctorCategoryResponse,
    qnaResponse: responses[2] as QuestionAnswerResponse,
    testimonials: responses[3] as TestimonialResponse
  );
});
