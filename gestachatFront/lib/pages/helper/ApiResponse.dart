class APIResponse<T>{
  bool error;
  String errorMessage;
  T data;

  APIResponse({this.error = false, required this.errorMessage, required this.data});
}
