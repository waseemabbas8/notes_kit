import 'package:notes_kit/domain/entities/note.dart';

abstract class NotesRepository {
  Future<List<Note>> getNotes();
}
