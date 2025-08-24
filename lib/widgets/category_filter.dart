import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryFilter extends StatelessWidget {
  const CategoryFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                   Text('Sort by' , 
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  ),
                  const Gap(10),
                  SvgPicture.asset('assets/svgs/select.svg' ,width: 14,),
                  const Spacer(),
                  Row(
                    children: [
                      SvgPicture.asset('assets/svgs/settings.svg' ,width: 20,),
                  const Gap(10),
                  Text('Filter' , 
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  ),
                  const Gap(10),
                  SvgPicture.asset('assets/svgs/grid.svg' ,width: 20,),
                  const Gap(10),
                  SvgPicture.asset('assets/svgs/solar_users-group-rounded-outline.svg' ,width: 24,),
                  
                    ],
                  )
                ],
              ),
            );
  }
}