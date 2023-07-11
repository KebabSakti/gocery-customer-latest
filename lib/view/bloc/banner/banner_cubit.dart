import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../controller/banner_controller.dart';
import '../../../model/banner/banner_model.dart';

part 'banner_cubit.freezed.dart';
part 'banner_state.dart';

class BannerCubit extends Cubit<BannerState> {
  BannerCubit() : super(const BannerState());

  final _bannerController = BannerController();

  Future<void> load() async {
    try {
      emit(state.copyWith(loading: true));
      final banners = await _bannerController.index();
      emit(BannerState(banners: banners));
    } on Exception catch (e) {
      emit(state.copyWith(loading: false, exception: e));
    }
  }
}
