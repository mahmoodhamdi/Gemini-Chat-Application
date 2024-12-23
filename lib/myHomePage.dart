import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_gpt/chat_cubit.dart';
import 'package:gemini_gpt/theme_cubit.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  final TextEditingController _controller = TextEditingController();
  late AnimationController _typingController;
  late Animation<double> _typingAnimation;

  @override
  void initState() {
    super.initState();
    // Set up the typing animation
    _typingController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    )..repeat(reverse: true);

    _typingAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _typingController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _typingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = context.watch<ThemeCubit>().state.themeMode;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 1,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset('assets/gpt-robot.png'),
                SizedBox(width: 10),
                Text(
                  'Gemini Gpt',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            GestureDetector(
              child: Icon(
                currentTheme == ThemeMode.dark
                    ? Icons.light_mode
                    : Icons.dark_mode,
                color: Theme.of(context).colorScheme.secondary,
              ),
              onTap: () {
                context.read<ThemeCubit>().toggleTheme();
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatCubit, ChatState>(
              builder: (context, state) {
                if (state is ChatLoading) {
                  // Typing indicator (dots)
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TypingDot(typingAnimation: _typingAnimation),
                          SizedBox(width: 5),
                          TypingDot(typingAnimation: _typingAnimation),
                          SizedBox(width: 5),
                          TypingDot(typingAnimation: _typingAnimation),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        "User is typing...",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  );
                } else if (state is ChatError) {
                  return Center(child: Text('Error: ${state.message}'));
                } else if (state is ChatLoaded) {
                  final messages = state.messages;
                  return ListView.builder(
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final message = messages[index];
                      return ListTile(
                        title: Align(
                          alignment: message.isUser
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: message.isUser
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context).colorScheme.secondary,
                              borderRadius: message.isUser
                                  ? BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                      bottomLeft: Radius.circular(20))
                                  : BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      topLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20)),
                            ),
                            child: Text(
                              message.text,
                              style: message.isUser
                                  ? Theme.of(context).textTheme.bodyMedium
                                  : Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
                return Center(child: Text('Start chatting!'));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    style: Theme.of(context).textTheme.titleSmall,
                    decoration: InputDecoration(
                      hintText: 'Write your message',
                      hintStyle: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    context.read<ChatCubit>().sendMessage(_controller.text);
                    _controller.clear();
                  },
                  child: Image.asset('assets/send.png'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build each typing dot
}

class TypingDot extends StatelessWidget {
  final Animation<double> typingAnimation;

  const TypingDot({super.key, required this.typingAnimation});
  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: typingAnimation,
      child: Container(
        width: 10,
        height: 10,
        margin: EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue,
        ),
      ),
    );
  }
}
