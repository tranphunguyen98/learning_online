class ReviewTutorModel {
  final String imageUrl;
  final String name;
  final String comment;
  final String date;
  final double star;

  const ReviewTutorModel({
    required this.imageUrl,
    required this.name,
    required this.comment,
    required this.date,
    required this.star,
  });

  static ReviewTutorModel mock = ReviewTutorModel(
    imageUrl:
        'https://cdn-img.thethao247.vn/upload/kienlv/2020/09/11/tuyen-thu-dt-viet-nam-cong-khai-ban-gai-xinh-nhu-mong1599795990.png',
    name: 'Khanh Huyen',
    comment: 'So funny',
    date: '14:12 12/10/2021',
    star: 5,
  );
}
