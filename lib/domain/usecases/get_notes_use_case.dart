import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:notes_kit/data/repo/notes_repository_impl.dart';
import 'package:notes_kit/domain/entities/note.dart';
import 'package:notes_kit/domain/repo/notes_repository.dart';

@injectable
class GetNotesUseCase extends UseCase {
  final NotesRepository _notesRepository;

  GetNotesUseCase(@Named(restNotesRepoName) this._notesRepository);

  @override
  Future<Stream> buildUseCaseStream(params) async {
    final StreamController streamController = StreamController();
    try {
      final List<Note> notes = await _notesRepository.getNotes();
      logger.finest('LoginUseCase successful.');
      streamController.add(notes);
      // triggers onComplete
      streamController.close();
    } catch (e) {
      logger.severe('LoginUseCase unsuccessful.');
      // Trigger .onError
      streamController.addError(e);
    }
    return streamController.stream;
  }
}
