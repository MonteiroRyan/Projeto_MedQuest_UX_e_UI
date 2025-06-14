import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;

  const SearchBarWidget({
    super.key,
    required this.hintText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.symmetric(vertical: 6),
      child: TextField(
        onChanged: onChanged,
        style: TextStyle(fontFamily: 'RobotoMono'),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, size: 20),
          hintText: hintText,
          hintStyle: TextStyle(fontFamily: 'RobotoMono', fontSize: 14),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
