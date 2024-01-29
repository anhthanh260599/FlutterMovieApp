extension StringExtension on String {
  String intelliTrim() { // Dùng để cắt chuỗi
    return this.length > 15 ? '${this.substring(0,15)}...' : this;
  }
}