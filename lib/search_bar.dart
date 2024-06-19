import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:docgen/riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainSearchBar extends StatefulWidget {
  const MainSearchBar({super.key});

  @override
  State<MainSearchBar> createState() => _MainSearchBarState();
}

class _MainSearchBarState extends State<MainSearchBar> {
  final TextEditingController mainPromptController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SearchAnchor(
          builder: (BuildContext context, SearchController controller) {
        return SearchBar(
          controller: controller,
          padding: const WidgetStatePropertyAll<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 16.0)),
          onTap: () {
            controller.openView();
          },
          onChanged: (_) {
            controller.openView();
          },
          leading: const Icon(Icons.search),
        );
      }, suggestionsBuilder:
          (BuildContext context, SearchController controller) {
        return List<ListTile>.generate(suggestions.length, (int index) {
          final String item = suggestions[index];
          return ListTile(
        title: Text(item),
        onTap: () {
          setState(() {
            controller.closeView(item);
          });
        },
          );
        });
      }),
    );
  }
}

class ResultView extends ConsumerWidget {

  const ResultView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var searchResult = ref.watch(searchResultProvider);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            'Search Result:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                searchResult,
                textStyle: const TextStyle(fontSize: 16),
              ),
            ],
            totalRepeatCount: 1,
            pause: const Duration(milliseconds: 1000),
            displayFullTextOnTap: true,
            stopPauseOnTap: true,
          ),
        ],
      ),
    );
  }
}

List<String> suggestions = [
  'Viết đơn xin nghỉ phép',
  'Viết đơn xin thôi việc',
  'bruh',
];