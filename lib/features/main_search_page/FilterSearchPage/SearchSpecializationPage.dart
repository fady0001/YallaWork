import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearcheSpecializationsPage extends StatefulWidget {
  final Function(String) onDone;

  const SearcheSpecializationsPage({Key? key, required this.onDone}) : super(key: key);

  @override
  State<SearcheSpecializationsPage> createState() => _SearcheSpecializationsPageState();
}

class _SearcheSpecializationsPageState extends State<SearcheSpecializationsPage> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(width: 50.w),
                  Text('Specialization', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      String inputText = _textController.text;
                      if (inputText.isNotEmpty) {
                        widget.onDone(inputText);
                        Navigator.pop(context);
                      }
                    },
                    child: Text('Done', style: TextStyle(color: Colors.lightGreenAccent, fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              SizedBox(height: 25.h,),
              TextField(
                controller: _textController,
                decoration: InputDecoration(
                  hintText: 'Enter specialization',
                  border: OutlineInputBorder(),
                ),
              ),
          
          
            ],
          ),
        ),
      ),
    );
  }
}
