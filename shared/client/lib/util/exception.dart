
class ImageNotFoundException implements Exception {
  String cause;

  ImageNotFoundException(this.cause);
}