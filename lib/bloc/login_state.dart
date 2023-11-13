part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loding() = _Loding;
  const factory LoginState.loginSuccess() = _LoginSuccess;
  const factory LoginState.loginFailed({required String error}) = _LoginFailed;
}
