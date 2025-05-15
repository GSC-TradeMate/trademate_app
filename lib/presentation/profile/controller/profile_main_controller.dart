import 'package:get/get.dart';
import 'package:logger/logger.dart';

import 'package:trademate_app/data/entity/profile/profile_entity.dart';
import 'package:trademate_app/data/repo/profile_repo.dart';

class ProfileMainController extends GetxController {
  Logger log = Logger();

  final Rx<bool> _isProfileFetched = false.obs;
  final Rx<bool> _isProfileFetchedError = false.obs;
  final Rx<ProfileEntity?> _profileData = Rx<ProfileEntity?>(null);

  bool get isProfileFetched => _isProfileFetched.value;
  bool get isProfileFetchedError => _isProfileFetchedError.value;
  ProfileEntity? get profileData => _profileData.value;

  void init() {
    _fetchProfile();
  }

  Future<void> _fetchProfile() async {
    try {
      _profileData.value = await ProfileRepo.getUserInfo();
    } catch (e) {
      _isProfileFetchedError.value = true;
      log.f("Error fetching profile: $e");
    } finally {
      _isProfileFetched.value = true;
    }
  }
}
