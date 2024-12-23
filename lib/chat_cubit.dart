import 'package:bloc/bloc.dart';
import 'package:gemini_gpt/message.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:equatable/equatable.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  Future<void> sendMessage(String messageText) async {
    if (messageText.isEmpty) return;

    emit(ChatLoading());
    try {
      final model = GenerativeModel(
        model: 'gemini-pro',
        apiKey: dotenv.env['GOOGLE_API_KEY']!,
      );
      final prompt = messageText.trim();
      final content = [Content.text(prompt)];
      final response = await model.generateContent(content);

      final message = Message(text: response.text!, isUser: false);
      emit(ChatLoaded(
          messages: [Message(text: messageText, isUser: true), message]));
    } catch (e) {
      emit(ChatError(message: e.toString()));
    }
  }
}
