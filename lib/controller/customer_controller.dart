import 'package:gocery/api/customer_api.dart';
import 'package:gocery/model/customer/customer_model.dart';

class CustomerController {
  final _customerApi = CustomerApi();

  Future<CustomerModel> show() async {
    final customerModel = await _customerApi.show();

    return customerModel;
  }

  Future<void> update(CustomerModel customerModel) async {
    await _customerApi.update(customerModel);
  }
}
