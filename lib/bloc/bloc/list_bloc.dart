import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:navigator/network/auth_repo.dart';

import '../../response class/user_response.dart';

part 'list_event.dart';
part 'list_state.dart';
part 'list_bloc.freezed.dart';
part 'package:navigator/widgets/list.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  ListBloc() : super(_Initial()) {
    on<ListEvent>((event, emit) {});
  }

  Future<UserList?> fetchData() async {
    final AuthRepo authRepo = AuthRepo();
    final response = await authRepo.UserResponse();

    return response;
  }
}
