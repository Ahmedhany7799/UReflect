// ignore_for_file: file_names

class RatingReviewmodel {
  final String name, comment, img, date, vendorDate;
  final double rating;

  RatingReviewmodel({
    required this.date,
    required this.rating,
    required this.name,
    required this.comment,
    required this.img,
    required this.vendorDate,
  });
}

List<RatingReviewmodel> reviews = [
  RatingReviewmodel(
    comment: 'good',
    img: "assets/reviews/rev2.jpeg",
    name: 'Ahmed Hany',
    rating: 4,
    date: '29 June, 2024',
    vendorDate: '30 June, 2024',
  ),
  RatingReviewmodel(
    comment: 'very good',
    img: "assets/reviews/rev1.jpg",
    name: 'Nour',
    rating: 3,
    date: '21 May, 2024',
    vendorDate: '25 May, 2024',
  ),
  RatingReviewmodel(
      comment:
          'El montag mia el mia bs yaa reet ybcaa  fy aloan tania .Well done!',
      img: "assets/reviews/rev3.jpeg",
      name: 'Jhon',
      rating: 5,
      date: '31 Oct, 2023',
      vendorDate: '2 Nov, 2023'),
];
