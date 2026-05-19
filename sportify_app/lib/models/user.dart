class User {
  final String id;
  final String name;
  final int age;
  final String district;
  User({required this.id, required this.name, required this.age, required this.district});

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'age': age, 'district': district};
  factory User.fromJson(Map<String, dynamic> j) => User(
    id: j['id'] ?? '',
    name: j['name'] ?? '',
    age: j['age'] ?? 0,
    district: j['district'] ?? '',
  );
}
