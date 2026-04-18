import 'package:bookia/core/constants/api_keys.dart';

class ErrorModel {
  final String errorMessage;
  final int? statusCode;

  ErrorModel({
    required this.errorMessage,
    this.statusCode,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    final List<String> messages = [];

    // 1. Extract detailed errors from the 'errors' map
    final dynamic errorsObject = json[ApiKeys.errors];

    if (errorsObject is Map) {
      for (var value in errorsObject.values) {
        if (value is List) {
          messages.addAll(value.map((e) => e.toString()));
        } else {
          messages.add(value.toString());
        }
      }
    }

    // 2. Fallback to main 'message' if no specific detailed errors are found
    if (messages.isEmpty && json[ApiKeys.message] != null) {
      final String mainMessage = json[ApiKeys.message].toString();
      if (mainMessage.isNotEmpty) {
        messages.add(mainMessage);
      }
    }

    // 3. Ultimate fallback if empty
    if (messages.isEmpty) {
      messages.add('Unexpected error occurred');
    }

    // Extract status code
    int? parsedStatusCode;
    final statusVal = json[ApiKeys.status];
    if (statusVal != null) {
      if (statusVal is int) {
        parsedStatusCode = statusVal;
      } else {
        parsedStatusCode = int.tryParse(statusVal.toString());
      }
    }

    return ErrorModel(
      errorMessage: messages.join('\n'),
      statusCode: parsedStatusCode,
    );
  }
}
