import 'package:dio/dio.dart';
import 'package:new_doct_app/data/model/category.response.dart';
import 'package:new_doct_app/data/model/doctors.respone.dart';
import 'package:new_doct_app/data/model/login.body.dart';
import 'package:new_doct_app/data/model/login.res.dart';
import 'package:new_doct_app/data/model/perticulerDoctor.response.dart';
import 'package:new_doct_app/data/model/qna.response.dart';
import 'package:new_doct_app/data/model/testimonials.response.dart';
import 'package:retrofit/retrofit.dart';

part 'api.state.g.dart';

@RestApi(baseUrl: 'https://magenta-gaur-653418.hostingersite.com/')
abstract class APIStateNetwork {
  factory APIStateNetwork(Dio dio, {String baseUrl}) = _APIStateNetwork;

  @POST('api/login')
  Future<HttpResponse<LoginResponse>> login(@Body() LoginBody body);
  @GET('api/doctor-categories')
  Future<DoctorCategoryResponse> getCategory();
  @GET('api/doctors')
  Future<DoctoresResponse> getDoctors();
  @GET('api/free-questions')
  Future<QuestionAnswerResponse> getQna();
  @GET('api/home')
  Future<TestimonialResponse> getTestimonials();
  @GET('api/doctor/{id}')
  Future<PerticulerDoctorResponse> getDoctorDetail(@Path('id') String id);
}
