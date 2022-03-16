class ProfilePageArgs {
  final String name;
  final String surname;
  final int age;
  final List<String>? hobbies;

  ProfilePageArgs({
    required this.name,
    required this.surname,
    required this.age,
    this.hobbies,
  });
}
