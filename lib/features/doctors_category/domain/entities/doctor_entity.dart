class DoctorEntity {
  String name;
  String image;
  String experience;
  String speciality;
  double rating;
  String description;

  DoctorEntity(
      {required this.name,
      required this.image,
      required this.description,
      required this.speciality,
      required this.experience,
      required this.rating});
}
