import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:notes_kit/domain/entities/note.dart';
import 'package:notes_kit/domain/usecases/get_notes_use_case.dart';

@injectable
class HomePresenter extends Presenter {
  Function getNotesOnNext;
  Function getNotesOnComplete;
  Function getNotesOnError;

  final GetNotesUseCase _getNotesUseCase;

  HomePresenter(this._getNotesUseCase);

  void getNotes() {
    _getNotesUseCase.execute(_GetNotesUserCaseObserver(this));
  }

  @override
  void dispose() {
    _getNotesUseCase.dispose();
  }
}

class _GetNotesUserCaseObserver implements Observer<List<Note>> {
  final HomePresenter _presenter;

  _GetNotesUserCaseObserver(this._presenter);

  @override
  void onComplete() {
    assert(_presenter.getNotesOnComplete != null);
    _presenter.getNotesOnComplete();
  }

  @override
  void onError(e) {
    assert(_presenter.getNotesOnError != null);
    _presenter.getNotesOnError();
  }

  @override
  void onNext(response) {
    assert(_presenter.getNotesOnNext != null);
    _presenter.getNotesOnNext(response);
  }
}
