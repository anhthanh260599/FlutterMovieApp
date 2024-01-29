class Tab {
  final int index;
  final String title;

  const Tab({
    required this.index,
    required this.title
  }) : assert (index >= 0, 'giá trị không được nhỏ hơn 0'),
      assert (title != null, 'Tên phim không được phép bỏ trống');


}