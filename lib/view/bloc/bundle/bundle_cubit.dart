import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../controller/bundle_controller.dart';
import '../../../model/bundle/bundle_model.dart';

part 'bundle_cubit.freezed.dart';
part 'bundle_state.dart';

class BundleCubit extends Cubit<BundleState> {
  BundleCubit() : super(const BundleState());

  final _bundleController = BundleController();

  Future<void> load() async {
    try {
      emit(state.copyWith(loading: true));
      final bundles = await _bundleController.index();
      emit(BundleState(bundles: bundles));
    } on Exception catch (e) {
      emit(state.copyWith(loading: false, exception: e));
    }
  }
}
