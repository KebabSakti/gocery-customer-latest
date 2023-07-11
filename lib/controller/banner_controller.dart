import 'package:gocery/model/banner/banner_model.dart';

import '../api/banner_api.dart';

class BannerController {
  final _bannerApi = BannerApi();

  Future<List<BannerModel>> index() async {
    final banners = await _bannerApi.index();

    return banners;
  }
}
