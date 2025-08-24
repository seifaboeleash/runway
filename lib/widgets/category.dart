import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class Category extends StatelessWidget {
  const Category({super.key, required this.onTap, required this.title, required this.image});
  @override
  final void Function() onTap;
  final String title;
  final String image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Column(
          children: [
            Image.asset(image , width: 75,),
            Gap(10),
            Text(title ,
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600
              )
            ),
            ),
            ],
        ),
      ),
    );
  }
}