import 'package:get/get.dart';
import '../controller/province_controller.dart';

class ProvinceBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProvinceController());
  }
}