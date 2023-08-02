import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  late String selectedLanguage = 'en';
  AppBloc() : super(LanguageInitial()) {
    on<SelectLanguage>((event, emit) {
      emit(LanguageSelected(event.selectedLanguage, const []));
    });
  }

  void changeLang(String locale) {
    add(SelectLanguage(locale));
  }

  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is SelectLanguage) {
      yield LanguageLoading();
      final availableLanguages = ['English', 'Spanish', 'French', 'German'];
      yield LanguageSelected(event.selectedLanguage, availableLanguages);
    }
  }
}

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

abstract class AppState extends Equatable {
  const AppState();

  @override
  List<Object> get props => [];
}

class LanguageInitial extends AppState {}

class LanguageLoading extends AppState {}

class LanguageSelected extends AppState {
  final String selectedLanguage;
  final List<String> availableLanguages;

  const LanguageSelected(this.selectedLanguage, this.availableLanguages);

  @override
  List<Object> get props => [selectedLanguage, availableLanguages];
}

class SelectLanguage extends AppEvent {
  final String selectedLanguage;

  const SelectLanguage(this.selectedLanguage);

  @override
  List<Object> get props => [selectedLanguage];
}
