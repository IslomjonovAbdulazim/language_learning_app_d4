class ApiConstants {
  static const baseUrl =
      "https://islomjonovabdulazim-vocab-builder-backend-f7aa.twc1.net";

  // Profile
  static const profile = "$baseUrl/auth/profile";
  static const avatar = "$baseUrl/auth/avatar";
  static const profileStats = "$baseUrl/auth/stats";

  // Folder
  static const myFolder = "$baseUrl/folders/my";
  static const folder = "$baseUrl/folders/";
  static const copyFolder = "$baseUrl/folders/follow";

  static String unfollowFolder(int folderId) {
    return "$baseUrl/folders/$folderId/unfollow";
  }

  static String refreshShare(int folderId) {
    return "$baseUrl/folders/$folderId/refresh-share";
  }

  static String shareInfo(int folderId) {
    return "$baseUrl/folders/$folderId/refresh-share";
  }

  static String vocab(int folderId) {
    return "$baseUrl/folders/$folderId/vocab";
  }
}



