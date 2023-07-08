import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../controller/customer_controller.dart';
import '../../../model/chat/chat_room_model.dart';
import '../../../model/customer/customer_model.dart';

part 'app_cubit.freezed.dart';
part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState());

  final _customerController = CustomerController();

  Future<void> load() async {
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      _setInitialPage(message);
    });

    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        _setInitialPage(message);
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

  void _setInitialPage(RemoteMessage message) {
    int pageIndex = 0;

    if (message.data['type'] == 'chat') {
      pageIndex = 2;
    }

    if (message.data['type'] == 'order') {
      pageIndex = 1;
    }

    setPageIndex(pageIndex);
  }
}
