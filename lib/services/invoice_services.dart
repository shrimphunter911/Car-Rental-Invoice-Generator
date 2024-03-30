import 'dart:convert';
import 'package:http/http.dart' as http;

class InvoiceService{

  Future<List<Car>> fetch() async {
    final uri = Uri.parse("https://exam-server-7c41747804bf.herokuapp.com/carsList");
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final fetched = Post.fromJson(jsonDecode(response.body));
      return fetched.data.map((e) => Car.fromList(e)).toList();
    } else {
      throw Exception('Failed to fetch');
    }
  }

  List<Car> filter(List<Car> cars, String type) {
    return cars.where((element) => element.type == type).toList();
  }
}

class Post{
  final String status;
  final List data;
  final String message;

  Post({
    required this.status,
    required this.data,
    required this.message,
  });

  Post.fromJson(Map<String, dynamic> json)
      : status = json['status'] as String,
        data = json['data'] as List<dynamic>,
        message = json['message'] as String;

  @override
  String toString() => 'Status = $status, Message = $message';
}

class Charges{
  int? damage;
  int? insurance;
  double? tax;

  Charges(bool damage, bool insurance, bool tax) {
    if (damage == true) {
      this.damage = 9;
    } else {
      this.damage = 0;
    }
    if (insurance == true) {
      this.insurance = 15;
    } else {
      this.insurance = 0;
    }
    if (tax == true) {
      this.tax = 11.5;
    } else {
      this.tax = 0;
    }
  }

  @override
  String toString() => 'Charges: Damage = $damage, Insurance = $insurance, Tax = $tax';
}

class Reservation{
  final String id;
  final DateTime pickupDateTime;
  final DateTime dropOffTime;
  String? discount;
  int hours;
  int? days;
  int? weeks;

  Reservation({
    this.discount,
    required this.id,
    required this.pickupDateTime,
    required this.dropOffTime,
    required this.hours,
    required this.days,
    required this.weeks,
  });

  @override
  String toString() => 'Duration: $weeks Week $days Day $hours Hours';
}

class Car{
  final String make;
  final String model;
  final String type;
  final int seats;
  final int bags;
  final Map<String, dynamic> rates;
  final String imageURL;

  Car.fromList(Map<String, dynamic> data)
      : make = data['make'] as String,
        model = data['model'] as String,
        type = data['type'] as String,
        seats = data['seats'] as int,
        bags = data['bags'] as int,
        rates = data['rates'] as Map<String, dynamic>,
        imageURL = data['imageURL'] as String;

  @override
  String toString() => 'Car: Model = $model';
}

class Customer{
  final String firstName;
  final String lastName;
  final String email;
  final String phone;

  Customer({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
  });

  @override
  String toString() => 'Customer: Name = $firstName $lastName';
}