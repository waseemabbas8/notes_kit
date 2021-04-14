import 'package:injectable/injectable.dart';
import 'package:notes_kit/domain/entities/note.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'rest_client.g.dart';

@injectable
@RestApi(baseUrl: apiBaseUrl)
abstract class RestClient {
  @factoryMethod
  static RestClient create() => RestClient(Dio());

  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('c84b73e6')
  Future<List<Note>> getNotes();
}

const String apiBaseUrl = 'https://api.mocki.io/v1/';
