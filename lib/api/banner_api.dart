import 'package:flutter/foundation.dart';

import '../common/config/const.dart';
import '../common/helper/network.dart';
import '../common/helper/utility.dart';
import '../model/banner/banner_model.dart';

class BannerApi {
  final _http = NetworkClient();

  Future<List<BannerModel>> index() async {
    final request = await _http.get(banner);
    final json = await compute(parseJson, request.body);

    final banners =
        List<BannerModel>.from(json.map((item) => BannerModel.fromJson(item)));

    return banners;
  }
}
