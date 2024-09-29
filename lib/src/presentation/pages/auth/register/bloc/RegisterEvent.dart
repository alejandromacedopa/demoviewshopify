abstract class RegisterEvent {}

class RegisterButtonPressed extends RegisterEvent {
  final String name;
  final String lastname;
  final String email;
  final String image;
  final String? phone;
  final String? password;

  RegisterButtonPressed({
    required this.name,
    required this.lastname,
    required this.email,
    required this.image,
    required this.phone,
    required this.password,
  });
}
