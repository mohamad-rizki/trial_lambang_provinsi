import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/province_controller.dart';
import '../entity/province.dart';
import '../network_image_view.dart';

class ProvincePage extends StatelessWidget {
  const ProvincePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Province",
          style: Get.textTheme.headline4,
        ),
      ),
      body: const ProvincePageView(),
    );
  }
}

class ProvincePageView extends GetView<ProvinceController> {
  const ProvincePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx((value) {
      if (value == null) {
        return Container();
      } else {
        return ProvincePageScreen(provinceList: value);
      }
    });
  }
}

class ProvincePageScreen extends StatelessWidget {
  final List<Province> provinceList;

  const ProvincePageScreen({
    Key? key,
    required this.provinceList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Wrap(
          spacing: 8.0,
          runSpacing: 4.0,
          children: provinceList.map((e) => ItemProvince(province: e)).toList(),
        ),
      ),
    );
  }
}

class ItemProvince extends StatelessWidget {
  final Province province;

  const ItemProvince({
    Key? key,
    required this.province,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: NetworkImageView.loadUrl(
                url: province.url,
                width: 80,
                height: 80,
              ),
            ),
            Text(
              province.title,
              textAlign: TextAlign.center,
              style: Get.textTheme.subtitle1,
            ),
          ],
        ),
      ),
    );
  }
}
