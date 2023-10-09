import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../service/autoservice.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.userData;

    return Center(
      child: Text(
        user!["heroscope"],
        style: const TextStyle(color: Colors.white, fontSize: 300),
      ),
    );
  }
}
