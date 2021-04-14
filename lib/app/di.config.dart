// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/remote/rest_client.dart' as _i3;
import '../data/repo/notes_repository_impl.dart' as _i8;
import '../domain/repo/notes_repository.dart' as _i5;
import '../domain/usecases/get_notes_use_case.dart' as _i4;
import 'pages/home/home_controller.dart' as _i7;
import 'pages/home/home_presenter.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String environment, _i2.EnvironmentFilter environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.RestClient>(() => _i3.RestClient.create());
  gh.factory<_i4.GetNotesUseCase>(() => _i4.GetNotesUseCase(
      get<_i5.NotesRepository>(instanceName: 'RestNotesRepo')));
  gh.factory<_i6.HomePresenter>(
      () => _i6.HomePresenter(get<_i4.GetNotesUseCase>()));
  gh.factory<_i7.HomeController>(
      () => _i7.HomeController(get<_i6.HomePresenter>()));
  gh.singleton<_i5.NotesRepository>(
      _i8.NotesRepositoryImpl(get<_i3.RestClient>()),
      instanceName: 'RestNotesRepo');
  return get;
}
