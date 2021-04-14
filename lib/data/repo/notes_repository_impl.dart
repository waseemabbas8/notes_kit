import 'package:injectable/injectable.dart';
import 'package:notes_kit/data/remote/rest_client.dart';
import 'package:notes_kit/domain/entities/note.dart';
import 'package:notes_kit/domain/repo/notes_repository.dart';

@Named(restNotesRepoName)
@Singleton(as: NotesRepository)
class NotesRepositoryImpl extends NotesRepository {
  final RestClient _restClient;

  NotesRepositoryImpl(this._restClient);

  @override
  Future<List<Note>> getNotes() => _restClient.getNotes();
}

const String restNotesRepoName = 'RestNotesRepo';
