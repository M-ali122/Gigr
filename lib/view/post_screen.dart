// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:newgigr/resources/color.dart';
// import '../bloc/post/post_bloc.dart';
// import '../bloc/post/post_event.dart';
// import '../bloc/post/post_state.dart';
// import '../widgets/custome_text_field.dart';
// import '../widgets/custome_button.dart';
//
// class PostScreen extends StatelessWidget {
//   const PostScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => PostBloc(),
//       child: BlocBuilder<PostBloc, PostState>(
//         builder: (context, state) {
//           return Scaffold(
//             body: SafeArea(
//               child: Padding(
//                 padding:  EdgeInsets.all(16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text('Post Request',
//                     style: TextStyle(
//                       fontSize: 20.sp,
//                       fontWeight: FontWeight.w600
//                     ),
//                     ),
//                     SizedBox(height: 30.h,),
//                     CustomTextField(
//                       label: "Title",
//                       hintText: "Enter your service title...",
//                       controller: TextEditingController(text: state.title),
//                       icon: Icons.title,
//                       onChange: (val) => context.read<PostBloc>().add(TitleChanged(val)),
//                     ),
//                     SizedBox(height: 20.h),
//                     Text("Price Range", style: TextStyle(fontWeight: FontWeight.bold)),
//                     SizedBox(height: 10.h,),
//                     Row(
//                       children: [50, 100, 200].map((price) {
//                         final isSelected = price == state.price;
//                         return Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 4),
//                           child: ChoiceChip(
//                             label: Text('\$$price'),
//                             selected: isSelected,
//                             backgroundColor: appPrimaryColor,
//                             checkmarkColor: appPrimaryColor,
//                             onSelected: (_) => context.read<PostBloc>().add(PriceSelected(price)),
//                             selectedColor: appSeColor,
//                             labelStyle: TextStyle(
//                               color: isSelected ? appPrimaryColor : appSeColor,
//                             ),
//                           ),
//                         );
//                       }).toList(),
//                     ),
//                      SizedBox(height: 20.h),
//                     Text("Delivery Time", style: TextStyle(fontWeight: FontWeight.bold)),
//                     SizedBox(height: 10.h,),
//                     Row(
//                       children: ['1 hour', '8 hours', '1 day'].map((time) {
//                         final isSelected = time == state.deliveryTime;
//                         return Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 4),
//                           child: ChoiceChip(
//                             label: Text(time),
//                             backgroundColor: appPrimaryColor,
//                             checkmarkColor: appPrimaryColor,
//                             selected: isSelected,
//                             onSelected: (_) =>
//                                 context.read<PostBloc>().add(DeliveryTimeSelected(time)),
//                             selectedColor: appSeColor,
//                             labelStyle: TextStyle(
//                               color: isSelected ? appPrimaryColor : appSeColor,
//                             ),
//                           ),
//                         );
//                       }).toList(),
//                     ),
//                     const SizedBox(height: 10),
//                     Row(
//                       children: [
//                         Checkbox(
//                           activeColor: appPrimaryColor,
//                           value: state.urgent,
//                           onChanged: (val) =>
//                               context.read<PostBloc>().add(ToggleUrgency(val ?? false)),
//                         ),
//                         const Text("Need it now"),
//                       ],
//                     ),
//                     const SizedBox(height: 10),
//                     CustomTextField(
//                       label: "Description",
//                       hintText: "Describe your requirements...",
//                       controller: TextEditingController(text: state.description),
//                       icon: Icons.description,
//                       onChange: (val) =>
//                           context.read<PostBloc>().add(DescriptionChanged(val)),
//                     ),
//                     const Spacer(),
//                     state.isSubmitting
//                         ? const Center(child: CircularProgressIndicator())
//                         : CustomeButton(
//                       title: "Continue",
//                       onTap: () {
//                         context.read<PostBloc>().add(SubmitPost());
//                       },
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newgigr/resources/color.dart';
import '../bloc/post/post_bloc.dart';
import '../bloc/post/post_event.dart';
import '../bloc/post/post_state.dart';
import '../widgets/custome_text_field.dart';
import '../widgets/custome_button.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PostBloc(),
      child: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding:  EdgeInsets.all(16),
                child: ListView(
                  children: [
                    Text(
                      'Post Request',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 30.h),

                    // Title Field
                    CustomTextField(
                      label: "Title",
                      hintText: "Enter your service title...",
                      controller: TextEditingController(text: state.title),
                      icon: Icons.title,
                      onChange: (val) => context.read<PostBloc>().add(TitleChanged(val)),
                    ),
                    SizedBox(height: 20.h),

                    // Price Range Chips
                    Text("Price Range", style: const TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 10.h),
                    Wrap(
                      spacing: 8,
                      children: [
                        ...[50, 100, 200].map((price) {
                          final isSelected = price == state.price && !state.isCustomPrice;
                          return ChoiceChip(
                            label: Text('\$$price'),
                            selected: isSelected,
                            backgroundColor: appPrimaryColor,
                            checkmarkColor: appPrimaryColor,
                            selectedColor: appSeColor,
                            onSelected: (_) {
                              context.read<PostBloc>().add(PriceSelected(price));
                            },
                            labelStyle: TextStyle(
                              color: isSelected ? appPrimaryColor : appSeColor,
                            ),
                          );
                        }).toList(),

                        // Custom Price Chip
                        ChoiceChip(
                          label: const Text("Custom"),
                          selected: state.isCustomPrice,
                          backgroundColor: appPrimaryColor,
                          checkmarkColor: appPrimaryColor,
                          selectedColor: appSeColor,
                          onSelected: (_) {
                            context.read<PostBloc>().add(CustomPriceEntered(state.customPrice));
                          },
                          labelStyle: TextStyle(
                            color: state.isCustomPrice ? appPrimaryColor: appSeColor,
                          ),
                        ),
                      ],
                    ),

                    // Custom Price Input Field
                    if (state.isCustomPrice) ...[
                      const SizedBox(height: 10),
                      CustomTextField(
                        label: "Custom Price",
                        hintText: "Enter custom price (e.g. \$150)",
                        icon: CupertinoIcons.money_dollar,
                        controller: TextEditingController(text: state.customPrice),
                        onChange: (val) => context.read<PostBloc>().add(CustomPriceEntered(val)),
                      ),
                    ],

                    SizedBox(height: 20.h),

                    // Delivery Time
                    Text("Delivery Time", style: const TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 10.h),
                    Wrap(
                      spacing: 8,
                      children: ['1 hour', '8 hours', '1 day'].map((time) {
                        final isSelected = time == state.deliveryTime;
                        return ChoiceChip(
                          label: Text(time),
                          backgroundColor: appPrimaryColor,
                          selectedColor: appSeColor,
                          checkmarkColor: appPrimaryColor,
                          selected: isSelected,
                          onSelected: (_) {
                            context.read<PostBloc>().add(DeliveryTimeSelected(time));
                          },
                          labelStyle: TextStyle(
                            color: isSelected ? appPrimaryColor : appSeColor,
                          ),
                        );
                      }).toList(),
                    ),

                    // Urgency Checkbox
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Checkbox(
                          activeColor: appPrimaryColor,
                          value: state.urgent,
                          onChanged: (val) =>
                              context.read<PostBloc>().add(ToggleUrgency(val ?? false)),
                        ),
                        const Text("Need it now"),
                      ],
                    ),

                    // Description
                    const SizedBox(height: 10),
                    CustomTextField(
                      label: "Description",
                      hintText: "Describe your requirements...",
                      controller: TextEditingController(text: state.description),
                      icon: Icons.description,
                      onChange: (val) => context.read<PostBloc>().add(DescriptionChanged(val)),
                    ),

                    SizedBox(height: 50.h,),
                    // Continue Button or Loader
                    state.isSubmitting
                        ? const Center(child: CircularProgressIndicator())
                        : CustomeButton(
                      title: "Continue",
                      onTap: () {
                        context.read<PostBloc>().add(SubmitPost());
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
