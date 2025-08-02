// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'post_event.dart';
// import 'post_state.dart';
//
// class PostBloc extends Bloc<PostEvent, PostState> {
//   PostBloc() : super(const PostState()) {
//     on<TitleChanged>((event, emit) => emit(state.copyWith(title: event.title)));
//     on<PriceSelected>((event, emit) => emit(state.copyWith(price: event.price)));
//     on<DeliveryTimeSelected>((event, emit) => emit(state.copyWith(deliveryTime: event.time)));
//     on<ToggleUrgency>((event, emit) => emit(state.copyWith(urgent: event.urgent)));
//     on<DescriptionChanged>((event, emit) => emit(state.copyWith(description: event.description)));
//
//     on<SubmitPost>((event, emit) {
//       emit(state.copyWith(isSubmitting: true));
//       // Simulate submission delay
//       Future.delayed(Duration(seconds: 2), () {
//         emit(state.copyWith(isSubmitting: false));
//       });
//     });
//     on<PriceSelected>((event, emit) {
//       emit(state.copyWith(price: event.price, isCustomPrice: false));
//     });
//     on<CustomPriceEntered>((event, emit) {
//       int custom = int.tryParse(event.price) ?? 0;
//       emit(state.copyWith(
//         customPrice: event.price,
//         price: custom,
//         isCustomPrice: true,
//       ));
//     });
//
//   }
// }


import 'package:flutter_bloc/flutter_bloc.dart';
import 'post_event.dart';
import 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(const PostState()) {
    on<TitleChanged>((event, emit) {
      emit(state.copyWith(title: event.title));
    });

    on<PriceSelected>((event, emit) {
      emit(state.copyWith(
        price: event.price,
        isCustomPrice: false,
        customPrice: '',
      ));
    });

    on<CustomPriceEntered>((event, emit) {
      int custom = int.tryParse(event.price) ?? 0;
      emit(state.copyWith(
        customPrice: event.price,
        price: custom,
        isCustomPrice: true,
      ));
    });

    on<DeliveryTimeSelected>((event, emit) {
      emit(state.copyWith(deliveryTime: event.time));
    });

    on<ToggleUrgency>((event, emit) {
      emit(state.copyWith(urgent: event.urgent));
    });

    on<DescriptionChanged>((event, emit) {
      emit(state.copyWith(description: event.description));
    });

    on<SubmitPost>((event, emit) async {
      emit(state.copyWith(isSubmitting: true));
      await Future.delayed(const Duration(seconds: 2));
      emit(state.copyWith(isSubmitting: false));
    });
  }
}
