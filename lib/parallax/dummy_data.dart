class Destination {
  const Destination({
    required this.city,
    required this.country,
    required this.rating,
  });
  final String city;
  final String country;
  final String rating;

  String get image => 'assets/images/${city.toLowerCase()}.jpg';
}

class MockDestinations {
  static const data = [
    Destination(city: 'Nassau', country: 'Bahamas', rating: '4.6'),
    Destination(city: 'Mykonos', country: 'Greece', rating: '4.8'),
    Destination(city: 'Rome', country: 'Italy', rating: '4.4'),
    Destination(city: 'London', country: 'England', rating: '4.5'),
  ];
}
