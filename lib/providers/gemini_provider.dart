import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_gemini_example/services/gemini_service.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiProvider extends ChangeNotifier {
  static GenerativeModel _initModel() {
    //Use your own key here
    String key="Use your own key here";
    if (key.isEmpty) {
      throw Exception('GEMINI_API_KEY not found');
    }
    return GenerativeModel(model: 'gemini-pro', apiKey: key);
  }

  static final _geminiService = GeminiService(model: _initModel());

  String? response;
  bool isLoading = false;

  Future<void> generateContentFromText({
    required String prompt,
  }) async {
    isLoading = true;
    notifyListeners();
    response = null;
    response = await _geminiService.generateContentFromText(prompt: prompt);
    isLoading = false;
    notifyListeners();
  }

  Future<void> generateContentFromImage({
    required String prompt,
    required Uint8List bytes,
  }) async {
    isLoading = true;
    notifyListeners();
    response = null;
    final dataPart = DataPart(
      'image/jpeg',
      bytes,
    );

    response = await _geminiService.generateContentFromImage(
      prompt: prompt,
      dataPart: dataPart,
    );

    isLoading = false;
    notifyListeners();
  }

  void reset() {
    response = null;
    isLoading = false;
    notifyListeners();
  }
}
