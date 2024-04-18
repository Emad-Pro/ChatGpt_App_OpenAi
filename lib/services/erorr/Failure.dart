// ignore_for_file: file_names

import 'package:chatgpt_app_openai/app/dall-E/data/model/dall-E_Erorr_model.dart';

import 'package:equatable/equatable.dart';

abstract class Faliure extends Equatable {
  final String message;
  const Faliure(this.message);
  @override
  List<Object?> get props => [message];
}

class ServerFaliure extends Faliure {
  const ServerFaliure(super.message);
}

class DataBaseFaliure extends Faliure {
  const DataBaseFaliure(super.message);
}

abstract class FaliureDallE extends Equatable {
  final DalleErorrModel message;
  const FaliureDallE(this.message);
  @override
  List<Object?> get props => [message];
}

class ServerFaliureDallE extends FaliureDallE {
  const ServerFaliureDallE(super.message);
}
