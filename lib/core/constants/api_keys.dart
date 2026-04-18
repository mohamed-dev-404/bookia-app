//! --- JSON KEYS (The names that Dio sends and receives) ---

class ApiKeys {
  ApiKeys._();

  //? --- Common Response & General Keys ---
  static const String data = 'data';
  static const String errors = 'errors';
  static const String error = 'error';
  static const String message = 'message';
  static const String id = '_id';
  static const String authId = 'id';
  static const String status = 'status';
  static const String validationErrors = 'validationErrors';
  static const String name = 'name';

  //? User Model Keys
  static const String email = 'email';
  static const String password = 'password';
  static const String passwordComfirmation = 'password_confirmation';
  static const String profilePic = 'profilePic';
  static const String role = 'role';
  static const String address = 'address';
  static const String city = 'city';
  static const String phone = 'phone';
  static const String emailVerified = 'email_verified';
  static const String image = 'image';

  //? Pagination Keys
  static const String pagination = 'pagination';
  static const String totalElements = 'totalElements';
  static const String currentPage = 'currentPage';
  static const String size = 'size';
  static const String totalPages = 'totalPages';
  static const String hasNextPage = 'hasNextPage';
  static const String hasPrevPage = 'hasPrevPage';

  //? Fetch Users Params Keys
  static const String page = 'page';
  static const String sortBy = 'sortBy';
  static const String sortOrder = 'sortOrder';
  static const String roleId = 'roleId';
  static const String search = 'search';

  //? --- Image & S3 Upload Keys ---
  static const String originalFileName = 'originalFileName';
  static const String contentType = 'contentType';
  static const String fileSize = 'fileSize';
  static const String key = 'key';
  static const String uploadUrl = 'uploadUrl';
  static const String contentTypeHeader = 'Content-Type';
  static const String contentLengthHeader = 'Content-Length';

  //? Auth Keys
  static const String authorization = 'Authorization';
  static const String user = 'user';
  static const String token = 'token';
  static const String expiresIn = 'expiresIn';
  static const String refreshToken = 'refreshToken';
  static const String accessToken = 'accessToken';
  static const String resetToken = 'resetToken';
  static const String code = 'code';
  static const String action = 'action';
  static const String newPassword = 'newPassword';
  static const String confirmNewPassword = 'confirmNewPassword';
  static const String roles = 'roles';
  static const String student = 'student';
  static const String confirmPassword = 'confirmPassword';
}

//! --- API VALUES (Fixed values that the server expects inside the fields) ---

class ApiValues {
  ApiValues._();

  static const String bearer = 'Bearer';
}
