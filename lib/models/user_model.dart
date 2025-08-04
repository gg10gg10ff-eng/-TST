class User {
  final String id;
  final String name;
  final String email;
  final bool isAdmin;
  final String languagePreference;
  final bool darkMode;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.isAdmin,
    required this.languagePreference,
    required this.darkMode,
  });
}