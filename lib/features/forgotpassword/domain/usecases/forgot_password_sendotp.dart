import 'package:dartz/dartz.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/forgotpassword/domain/entities/forgot_password_entities.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/forgotpassword/domain/repositories/forgotpassword_repository.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/login/domain/entities/google_login_entities.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/login/domain/repositories/login_repository.dart';

import '../../../../core/error/failure.dart';


class ForgotPasswordSendOtp{
  final ForgotpasswordRepository forgotpasswordRepository;
  ForgotPasswordSendOtp(this.forgotpasswordRepository);

  //dijalankan
  Future<Either<Failure,ForgotPasswordEntities>> execute(String email,) async {
    try {
      final result = await forgotpasswordRepository.sendOtp(email);
      return result;
    } catch (e) {
      return Left(Failure(message: 'Kirim Otp Gagal')); // Return Failure on any exception
    }
  }

}
