class Person {
  String email;
  String password;
  String name;
  String surname;
  String phoneNumber;
  String accountNumber;
  String city;
  String addess;
  String flat;
  //показания + расход List<Indications> indications         ok/no??

  Person({
    required this.email,
    required this.password,
    required this.name,
    required this.surname,
    required this.phoneNumber,
    required this.accountNumber,
    required this.city,
    required this.addess,
    required this.flat,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
        email: json['email'] as String,
        password: json['password'] as String,
        name: json['name'] as String,
        surname: json['surname'] as String,
        phoneNumber: json['phoneNumber'] as String,
        accountNumber: json['accountNumber'] as String,
        city: json['city'] as String,
        addess: json['addess'] as String,
        flat: json['flat'] as String);
  }
}
