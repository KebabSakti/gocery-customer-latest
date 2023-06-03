import 'package:flutter/foundation.dart';

import '../common/config/const.dart';
import '../common/helper/network.dart';
import '../common/helper/utility.dart';
import '../model/customer/customer_model.dart';

class CustomerApi {
  final _http = NetworkClient();

  Future<CustomerModel> show() async {
    final request = await _http.get(customer);
    final json = await compute(parseJson, request.body);
    final customerModel = CustomerModel.fromJson(json);

    return customerModel;
  }

  Future<void> update(CustomerModel customerModel) async {
    final payload = customerModel.toJson();
    removeNullFromMap(payload);
    await _http.put(customer, body: payload);
  }
}
