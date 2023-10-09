import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class User {
  String name;
  String email;
  String password;
  // ignore: non_constant_identifier_names
  String password_confirmation;
  String birthDate;
  String birthTime;
  int gender;
  // ignore: non_constant_identifier_names
  int martial_status; // Eklendi

  User({
    required this.name,
    required this.email,
    // ignore: non_constant_identifier_names
    required this.password_confirmation,
    required this.password,
    required this.birthDate,
    required this.birthTime,
    required this.gender,
    // ignore: non_constant_identifier_names
    required this.martial_status,
  });

  // JSON dönüşümü için yardımcı metod
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "password_confirmation": password_confirmation,
      "birth_date": birthDate,
      "birth_time": birthTime,
      "gender": gender,
      "martial_status": martial_status,
    };
  }
}

class AuthProvider extends ChangeNotifier {
  static const String baseUrl = 'https://www.zodiacapp.xyz/api';

  User _user = User(
    email: '',
    name: '',
    password: '',
    password_confirmation: '',
    birthDate: '',
    birthTime: '',
    gender: 0,
    martial_status: 0,
  );

  User get user => _user;

  void updateUser(User newUser) {
    _user = newUser;
    notifyListeners();
  }

  void setNameAndEmailAndPassword(String name, String email, String password) {
    _user = User(
      name: name,
      email: email,
      password: password,
      password_confirmation: password,
      birthDate: _user.birthDate,
      birthTime: _user.birthTime,
      gender: _user.gender,
      martial_status: _user.martial_status,
    );
    print('Tüm veriler: ${_user.toJson()}');

    notifyListeners();
  }

  void setBirthDate(String birthDate) {
    _user = User(
      name: _user.name,
      email: _user.email,
      password: _user.password,
      password_confirmation: _user.password_confirmation,
      birthDate: birthDate,
      birthTime: _user.birthTime,
      gender: _user.gender,
      martial_status: _user.martial_status,
    );
    print('Tüm veriler: ${_user.toJson()}');

    notifyListeners();
  }

  void setTime(String birthTime) {
    _user = User(
      name: _user.name,
      email: _user.email,
      password: _user.password,
      password_confirmation: _user.password_confirmation,
      birthDate: _user.birthDate,
      birthTime: birthTime,
      gender: _user.gender,
      martial_status: _user.martial_status,
    );

    notifyListeners();
    print('Tüm veriler: ${_user.toJson()}');
  }

  void setGender(int gender) {
    _user = User(
      name: _user.name,
      email: _user.email,
      password: _user.password,
      password_confirmation: _user.password_confirmation,
      birthDate: _user.birthDate,
      birthTime: _user.birthTime,
      gender: gender, // Sadece cinsiyeti güncelliyoruz
      martial_status: _user.martial_status,
    );

    print('Tüm verilere: ${_user.toJson()}');

    notifyListeners();
  }

  void setMaritalStatus(int martialStatus) {
    _user = User(
      name: _user.name,
      email: _user.email,
      password: _user.password,
      password_confirmation: _user.password_confirmation,
      birthDate: _user.birthDate,
      birthTime: _user.birthTime,
      gender: _user.gender,
      martial_status: martialStatus,
    );
    notifyListeners();
    print('MartialStatus: ${_user.toJson()}');
  }

  // Sunucuya verileri post eden metot
  Future<void> registerUserToServer() async {
    try {
      final requestData =
          json.encode(_user.toJson()); // JSON verisini encode ediyoruz
      print('En son Json: $requestData'); // Map verilerini yazdır

      final url = Uri.parse('$baseUrl/register');
      final Map<String, String> headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json', // JSON içerik tipini belirtiyoruz
      };
      final response =
          await http.post(url, headers: headers, body: requestData);

      if (response.statusCode == 200) {
        print('Kayıt işlemi başarıyla tamamlandı!');
      } else {
        print('Sunucu hatası: ${response.statusCode}');
        print('Sunucu yanıtı: ${response.body}');
      }
    } catch (e) {
      print('Hata oluştu: $e');
    }
  }

  String? _token;
  Map<String, dynamic>? _userData;

  String? get token => _token;
  Map<String, dynamic>? get userData => _userData;

  Future<void> loginUser(String email, String password) async {
    final url = Uri.parse('$baseUrl/login');
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    final body = json.encode({'email': email, 'password': password});

    try {
      final response = await http.post(url, headers: headers, body: body);
      print(
          'Response Status Code: ${response.statusCode}'); // StatusCode'yi yazdır

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print('Response Data: $responseData'); // Yanıt verilerini yazdır

        _token = responseData['data']['token']; // Token'ı sakla
        _userData = responseData['data']; // Kullanıcı verilerini sakla

        notifyListeners(); // Değişiklikleri dinleyenlere bildir

        return responseData; // Cevap verilerini döndür
      }

      throw Exception('Login failed'); // Oturum açma başarısızsa istisna fırlat
    } catch (e) {
      rethrow;
    }
  }
}
