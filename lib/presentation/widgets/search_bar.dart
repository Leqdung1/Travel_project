import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';


import '../screens/home/search_screen.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SearchScreen(),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromRGBO(246, 246, 246, 1),
        ),
        child: const ListTile(
          leading: Icon(
            LucideIcons.search,
            size: 18,
            color: Color.fromRGBO(165, 165, 165, 1),
          ),
          title: Text(
            'Tìm kiếm',
            style: TextStyle(
              fontSize: 16,
              color: Color.fromRGBO(165, 165, 165, 1),
            ),
          ),
        ),
      ),
    );
  }
}
