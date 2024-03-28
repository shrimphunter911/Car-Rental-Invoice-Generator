import 'dart:convert';
import 'package:http/http.dart' as http;

class InvoiceService{

  Future<Post> fetch() async {
    final uri = Uri.parse("https://exam-server-7c41747804bf.herokuapp.com/carsList");
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch');
    }
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

class Car{
  final String make;
  final String model;
  final String type;
  final int seats;
  final int bags;
  final Map<String, int> rates;
  final String imageURL;

  Car.fromList(Map<String, Object?> data)
      : make = data['make'] as String,
        model = data['model'] as String,
        type = data['type'] as String,
        seats = data['seats'] as int,
        bags = data['bags'] as int,
        rates = data['rates'] as Map<String, int>,
        imageURL = data['imageURL'] as String;

  @override
  String toString() => 'Car: Model = $model';
}

class Customer{
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String pickupDate;
  final String pickupTime;
  final String dropoffDate;
  final String dropoffTime;

  Customer({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.pickupDate,
    required this.pickupTime,
    required this.dropoffDate,
    required this.dropoffTime,
  });

  @override
  String toString() => 'Customer: Name = $firstName $lastName';
}