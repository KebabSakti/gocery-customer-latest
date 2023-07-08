import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../controller/customer_controller.dart';
import '../../../model/customer/customer_model.dart';

part 'account_cubit.freezed.dart';
part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit() : super(const AccountState());

  final _customerController = CustomerController();

  Future<void> load() async {
    try {
      emit(state.copyWith(loading: true));

      final customer = await _customerController.show();

      emit(AccountState(customerModel: customer));
    } on Exception catch (e) {
      emit(state.copyWith(loading: false, exception: e));
    }
  }

  Future<void> update(CustomerModel customerModel) async {
    try {
      emit(state.copyWith(loading: true));

      await _customerController.update(customerModel);
      await load();
    } on Exception catch (e) {
      emit(state.copyWith(loading: false, exception: e));
    }
  }
}
