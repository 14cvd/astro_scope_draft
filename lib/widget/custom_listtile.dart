import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {super.key, required this.title, required this.imagePath});
  final String title;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          color: Color(0xFFE5E4E4),
          fontSize: 16,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
          height: 0,
        ),
      ),
      leading: SvgPicture.asset(imagePath),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Colors.white,
      ),
    );
  }
}
