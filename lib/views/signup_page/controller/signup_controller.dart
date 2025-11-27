import 'package:get/get.dart';
import 'package:api_interigation_demo_practice/service/api_service.dart';

class SignupController extends GetxController {
  var isLoading = false.obs;

  // Function to handle signup
  void signup(String name, String email, String password) async {
    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'All fields are required');
      return;
    }

    try {
      isLoading.value = true;
      await ApiService.signup(name, email, password);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
