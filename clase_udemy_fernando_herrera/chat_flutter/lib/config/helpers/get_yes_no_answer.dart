import 'package:dio/dio.dart';
import 'package:chat_flutter/domain/entities/message.dart';
import 'package:chat_flutter/infrasctructure/models/yes_no_model.dart';


class GetYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');

    final yesNoModel = YesNoModel.fromJsonMap(response.data);

    return yesNoModel.toMessageEntity();
  }
}