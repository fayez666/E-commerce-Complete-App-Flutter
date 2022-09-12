
import 'package:e_commerce_complete_app/screens/sign_up/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../models/register.dart';
import '../../../shared/end_points.dart';
import '../../../shared/remote/dio_helper.dart';

class ShopRegisterCubit extends Cubit<ShopRegisterStates> {
  ShopRegisterCubit() : super(ShopRegisterInitialState());

  static ShopRegisterCubit get(context) => BlocProvider.of(context);

  RegisterModel? registerModel;

  void userRegister({
    required String email,
    required String password,
    required String phone,
  }) {
    emit(ShopRegisterLoadingState());
    DioHelper.postData(
        url: REGISTER,
        data: {
      'email': email,
      'password': password,
          'phone':phone
    }).then((value) {
      print(value.data);
      registerModel = RegisterModel.fromJson(value.data);
      emit(ShopRegisterSuccessState(registerModel!));
    }).catchError((error) {
      emit(ShopRegisterErrorState(error.toString()));
    });
  }
}
