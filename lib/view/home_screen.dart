import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newgigr/resources/color.dart';
import 'package:newgigr/resources/images.dart';
import 'package:newgigr/resources/svg_icons.dart';
import 'package:newgigr/widgets/custome_text_field.dart';
import 'package:newgigr/widgets/user_profile.dart';

import '../widgets/search_textfield.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 20.h),
        children: [
          SizedBox(height: 10.h,),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: UserProfile(),
            trailing: Container(
              height: 40.h,
              width: 40.w,
              decoration: ShapeDecoration(
                  shape: CircleBorder(),
                  color: appPrimaryColor,
              ),
              child: Center(
                child: SvgPicture.string(SvgIcons.notification,color: Colors.white,),
              ),
            ),
            title: Text('Hello, Ali',style: TextStyle(
              color: appPrimaryColor,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),),
            subtitle: Text('Ready to rent Skill',style: TextStyle(
              color: textGreyColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w300,
            ),),
          ),
          SearchTextField(
            hintText: 'Search services, gigs, skills...',
            onChanged: (value) {
              // handle search logic
            },
          ),
          SizedBox(height: 20.h,),
          Text('Popular Categories',style: TextStyle(
            color: Colors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),),
          SizedBox(height: 10.h,),
          // Container(
          //   height: 150.h,
          //   width: double.infinity,
          //   padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(20.r),
          //     color: Color.fromRGBO(245, 245, 245, 1),
          //   ),
          //   child: Row(
          //     children: [
          //       Container(
          //         width: 100.w,
          //         height: double.infinity,
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(12.r),
          //           image: DecorationImage(
          //             image: AssetImage(resume), // Your image asset path
          //             fit: BoxFit.cover,
          //           ),
          //         ),
          //       ),
          //       SizedBox(width: 12.w),
          //       Expanded(
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             Row(
          //               children: [
          //                 Text(
          //                   'Resume in 10 mint',
          //                   style: TextStyle(
          //                     fontSize: 16.sp,
          //                     fontWeight: FontWeight.bold,
          //                   ),
          //                 ),
          //                 Spacer(),
          //                 Text(
          //                   '\$ 30',
          //                   style: TextStyle(
          //                     fontSize: 16.sp,
          //                     color: Color(0xff0000ff),
          //                     fontWeight: FontWeight.bold,
          //                   ),
          //                 ),
          //               ],
          //             ),
          //             SizedBox(height: 5.h,),
          //             Row(
          //               children: [
          //                 Icon(Icons.watch_later_outlined,size: 16.sp,),
          //                 Text(
          //                   ' 20 min',
          //                   style: TextStyle(
          //                     fontSize: 12.sp,
          //                     fontWeight: FontWeight.bold,
          //                   ),
          //                 ),
          //                 SizedBox(width: 20.w,),
          //                 Icon(Icons.star,size: 20.sp,color: appSeColor,),
          //                 Text(
          //                   ' 4.8(127)',
          //                   style: TextStyle(
          //                     fontSize: 12.sp,
          //                     color: appSeColor,
          //                     fontWeight: FontWeight.bold,
          //                   ),
          //                 ),
          //               ],
          //             ),
          //             SizedBox(height: 8.h),
          //             Text(
          //               'Professional resume writing service with ATS '
          //                   'optimization. Get hired faster with expert '
          //                   'formatting ',
          //               style: TextStyle(
          //                 fontSize: 12.sp,
          //                 color: Colors.grey[600],
          //               ),
          //             ),
          //             SizedBox(height: 3.h,),
          //             Row(
          //               children: [
          //                 Container(
          //                   padding: EdgeInsets.symmetric(horizontal: 16.w),
          //                   decoration: BoxDecoration(
          //                       color: Colors.white,
          //                       borderRadius: BorderRadius.circular(20.r)
          //                   ),
          //                   child: Center(
          //                     child: Text('Resume',style: TextStyle(fontSize: 12.w ),),
          //                   ),
          //                 ),
          //                 SizedBox(width: 10.w,),
          //                 Container(
          //                   padding: EdgeInsets.symmetric(horizontal: 16.w),
          //                   decoration: BoxDecoration(
          //                       color: Colors.white,
          //                       borderRadius: BorderRadius.circular(20.r)
          //                   ),
          //                   child: Center(
          //                     child: Text('Fast',style: TextStyle(fontSize: 12.w ),),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          buildCategoryCard(
            context,
            image: resume, // already defined
            title: 'Resume in 10 min',
            price: 30,
            duration: '20 min',
            rating: 4.8,
            reviews: 127,
            description: 'Professional resume writing service with '
                'ATS optimization. Get hired faster with expert formatting.',
            tags: ['Resume', 'Fast'],
          ),
          SizedBox(height: 15.h,),
          buildCategoryCard(
            context,
            image: debug, // already defined
            title: 'Debug my code',
            price: 150,
            duration: '1 day',
            rating: 4.8,
            reviews: 127,
            description: 'Expert code debugging and optimization service '
                'Support for multiple programming language',
            tags: ['Coding', 'Debugging'],
          ),
          SizedBox(height: 15.h,),
          buildCategoryCard(
            context,
            image: poem, // already defined
            title: 'Write a poem',
            price: 50,
            duration: '1 hour',
            rating: 4.8,
            reviews: 127,
            description: 'Custom poems for any occasion - love, friendship'
                ', celebration. Professional quality with emotional depth',
            tags: ['Creative', 'Poetry'],
          ),
        ],
      ),
    );
  }

  Widget buildCategoryCard(
      BuildContext context, {
        required String image,
        required String title,
        required double price,
        required String duration,
        required double rating,
        required int reviews,
        required String description,
        required List<String> tags,
      }) {
    return Container(
      height: 150.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: const Color.fromRGBO(245, 245, 245, 1),
      ),
      child: Row(
        children: [
          Container(
            width: 100.w,
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '\$ $price',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: const Color(0xff0000ff),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                Row(
                  children: [
                    Icon(Icons.watch_later_outlined, size: 16.sp),
                    Text(
                      ' $duration',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 20.w),
                    Icon(Icons.star, size: 20.sp, color: appSeColor),
                    Text(
                      ' $rating($reviews)',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: appSeColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Text(
                  description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 5.h),
                Row(
                  children: tags.map((tag) {
                    return Container(
                      margin: EdgeInsets.only(right: 8.w),
                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Text(
                        tag,
                        style: TextStyle(fontSize: 12.sp),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}

