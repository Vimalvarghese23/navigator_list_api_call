import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:navigator/bloc/bloc/list_bloc.dart';

import 'package:navigator/network/auth_repo.dart';
import 'package:navigator/request%20class/login_request.dart';
import 'package:navigator/sign%20up%20widget/sign_up.dart';

import 'package:provider/provider.dart';

import 'package:sn_progress_dialog/progress_dialog.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';
part 'package:navigator/widgets/Home.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(_Initial()) {
    on<_OnLoginClicked>((event, emit) async {
      emit(const _Loding());
      AuthRepo repo = AuthRepo();
      final response = await repo
          .loginRequest(LoginRequest(email: event.email, password: event.pass));
      if (response != null && response.error == null) {
        emit(const _LoginSuccess());
      } else {
        emit(_LoginFailed(error: response?.error ?? "unknown error"));
      }
    });
  }
}
//auto generated cmt in terminal - dart run build_runner build --delete-conflicting-outputs 