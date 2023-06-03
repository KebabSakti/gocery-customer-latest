import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../controller/auth_controller.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final _authController = AuthController();

  AuthCubit() : super(const AuthState());

  Future<void> load() async {
    emit(state.copyWith(loading: true));

    final token = await _authController.token();

    emit(AuthState(authToken: token));
  }

  Future<void> googleSignIn() async {
    try {
      emit(state.copyWith(loading: true));

      await _authController.googleSignIn();
      await load();
    } on Exception catch (e) {
      emit(state.copyWith(loading: false, exception: e));
    }
  }

  Future<void> facebookSignIn() async {
    try {
      emit(state.copyWith(loading: true));

      await _authController.facebookSignIn();
      await load();
    } on Exception catch (e) {
      emit(state.copyWith(loading: false, exception: e));
    }
  }

  Future<void> signOut() async {
    try {
      emit(state.copyWith(loading: true));

      await _authController.signOut();
      await load();
    } on Exception catch (e) {
      emit(state.copyWith(loading: false, exception: e));
    }
  }
}
