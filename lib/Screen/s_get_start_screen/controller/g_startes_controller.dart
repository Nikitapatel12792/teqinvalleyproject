import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:teqinvalleyproject/Screen/sign_up_screen/controller/sign_up_controller.dart';

class SstartedController extends GetxController {
  RxBool obsecure = false.obs;
  final RxString selectedjobFunction = "".obs;
  final RxString selectedJobLevel = "".obs;
  RxBool isChecked = false.obs;
  RxList<String> jobFunction = ["Option 1", "Option 2", "Option 3"].obs;
  RxList<String> jobLevel = ["Executive", "Manager", "Senior Manager"].obs;
  TextEditingController fullname = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController mobile = TextEditingController();
  @override
  void onInit() {
    super.onInit();
    fullname.text = SignUpController().fullName.value;
  }
}
