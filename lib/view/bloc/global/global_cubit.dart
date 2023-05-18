import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';

import '../../../controller/auth_controller.dart';
import '../../../controller/config_controller.dart';
import '../../../model/config/config_model.dart';

part 'global_cubit.freezed.dart';
part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(const GlobalState());

  final _configController = GetIt.I<ConfigController>();
  final _authController = AuthController();

  Future<void> load() async {
    final config = await _configController.show();
    emit(state.copyWith(configModel: config, loading: false, exception: null));
  }

  Future<void> googleSignIn() async {
    try {
      emit(state.copyWith(loading: true));

      final token = await _authController.googleSignIn();

      emit(state.copyWith.configModel(authToken: token));
    } on Exception catch (e) {
      emit(state.copyWith(loading: false, exception: e));
    }
  }

  Future<void> facebookSignIn() async {
    try {
      emit(state.copyWith(loading: true));

      final token = await _authController.facebookSignIn();

      emit(state.copyWith.configModel(authToken: token));
    } on Exception catch (e) {
      emit(state.copyWith(loading: false, exception: e));
    }
  }

  Future<void> signOut() async {
    try {
      emit(state.copyWith(loading: true));

      await _authController.signOut();

      emit(state.copyWith.configModel(authToken: null));
    } on Exception catch (e) {
      emit(state.copyWith(loading: false, exception: e));
    }
  }
}
