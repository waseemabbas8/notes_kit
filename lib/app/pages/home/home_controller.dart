import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:notes_kit/app/pages/home/home_presenter.dart';
import 'package:notes_kit/domain/entities/note.dart';

@injectable
class HomeController extends Controller {
  String text = 'Hi Waseem,\nGood morning';

  List<Note> _notes = [];
  List<Note> get notes => _notes;

  final HomePresenter _homePresenter;

  HomeController(this._homePresenter);

  @override
  void initListeners() {
    _homePresenter.getNotesOnNext = (List<Note> notes) {
      print(notes.first);
      _notes = notes;
      refreshUI();
    };
    _homePresenter.getNotesOnComplete = () {
      print('Notes retrieved');
    };
    // On error, show a snackbar, remove the user, and refresh the UI
    _homePresenter.getNotesOnError = (e) {
      print('Could not retrieve notes.');
      ScaffoldMessenger.of(getContext())
          .showSnackBar(SnackBar(content: Text(e.message)));
      _notes = [];
      refreshUI(); // Refreshes the UI manually
    };
    _homePresenter.getNotes();
  }

  changeText() {
    text = "Ali";
    refreshUI();
  }

  @override
  void onDisposed() {
    _homePresenter.dispose(); // don't forget to dispose of the presenter
    super.onDisposed();
  }
}
