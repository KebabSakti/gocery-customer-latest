import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../controller/customer_controller.dart';
import '../../../model/customer/customer_model.dart';

part 'app_cubit.freezed.dart';
part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState());

  final _customerController = CustomerController();

  Future<void> load() async {
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      _handleNotification(message.data['type']);
    });

    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        _handleNotification(message.data['type']);
      }
    });

    FirebaseMessaging.instance.getToken().then((token) {
      if (token != null) {
        _customerController.update(CustomerModel(fcm: token));
      }
    });
  }

  void setPageIndex(int pageIndex) async {
    emit(state.copyWith(pageIndex: pageIndex));
  }

  void _handleNotification(String type) {
    int target = 0;

    if (type == 'chat') {
      target = 2;
    }

    if (type == 'order') {
      target = 1;
    }

    setPageIndex(target);
  }
}
