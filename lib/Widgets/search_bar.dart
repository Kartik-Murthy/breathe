import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;
  late bool autoShowKeyboard;
  SearchWidget({
    Key? key,
    required this.text,
    required this.onChanged,
    required this.hintText,
    required this.autoShowKeyboard,
  }) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final controller = TextEditingController();
  FocusNode focusNode = FocusNode();
  @override
  void initState() {
    if (widget.autoShowKeyboard) {
      focusNode.requestFocus();
    }
    super.initState();
  }

  @override
  void dispose() {
    if (focusNode.hasFocus) {
      FocusScope.of(context).unfocus();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const styleActive = TextStyle(color: Colors.white);
    const styleHint = TextStyle(color: Colors.white60);
    final style = widget.text.isEmpty ? styleHint : styleActive;

    return Container(
      height: 46,
      margin: const EdgeInsets.fromLTRB(16, 56, 16, 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white70),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextField(
        focusNode: focusNode,
        controller: controller,
        decoration: InputDecoration(
          icon: const Icon(Icons.search, color: Colors.white70),
          suffixIcon: widget.text.isNotEmpty
              ? GestureDetector(
                  child: const Icon(Icons.close, color: Colors.white70),
                  onTap: () {
                    controller.clear();
                    widget.onChanged('');
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                )
              : null,
          hintText: widget.hintText,
          hintStyle: style,
          border: InputBorder.none,
        ),
        style: style,
        onChanged: widget.onChanged,
      ),
    );
  }
}
