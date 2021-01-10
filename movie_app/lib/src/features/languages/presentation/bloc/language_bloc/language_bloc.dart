import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/src/core/constants/language_constants.dart';
import 'package:movie_app/src/features/languages/domain/usecases/language_entity.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc()
      : super(LanguageLoadedState(
            locale: Locale(LanguageConstants.languages[0].code)));

  @override
  Stream<LanguageState> mapEventToState(
    LanguageEvent event,
  ) async* {
    if (event is ToogleLanguageEvent) {
      yield LanguageLoadedState(locale: Locale(event.language.code));
    }
  }
}
