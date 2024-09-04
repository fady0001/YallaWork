import 'dart:async';
import 'package:flutter/material.dart';
import 'package:phlox_animations/phlox_animations.dart';


class TipsWidget extends StatefulWidget {
  const TipsWidget({super.key});

  @override
  State<TipsWidget> createState() => _TipsWidgetState();
}

class _TipsWidgetState extends State<TipsWidget> {
  var selectedIndex = 0;
  final tips = [

    "Present yourself professionally and confidently,highlighting your abilities and skills",
    "Reach out to people in your desired field for advice and support",
    " Don't get discouraged by rejections; keep searching and developing your skills"

  ];

  @override
  void initState() {
    Timer.periodic(
      const Duration(seconds: 3),
      (timer) {
        setState(() {
          if (selectedIndex != tips.length - 1) {
            selectedIndex = ++selectedIndex;
          } else {
            selectedIndex = 0;
          }
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PhloxAnimations(
      duration: const Duration(milliseconds: 800),
      fromX: 200,
      child: Container(
        height: 180,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.orangeAccent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: -40,
              right: -20,
              child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              top: -40,
              right: 80,
              child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Wrap(
                  spacing: 4,
                  children: List.generate(
                    tips.length,
                    (index) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 600),
                        width: selectedIndex == index ? 30 : 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: selectedIndex == index
                              ? Colors.white
                              : Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 600),
                child: Row(
                  key: UniqueKey(),
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tips[selectedIndex],
                            style: TextStyle(fontSize:18 , color: Colors.white,fontWeight: FontWeight.bold),
                            // Theme.of(context)
                            //     .textTheme
                            //     .headlineSmall
                            //     ?.copyWith(
                            //       color: Colors.white,
                            //     )

                          ),
                          // ElevatedButton(
                          //   onPressed: () {},
                          //   style: ElevatedButton.styleFrom(
                          //     backgroundColor: Colors.white,
                          //   ),
                          //   child: Text(
                          //     "See Detail",
                          //     style: Theme.of(context)
                          //         .textTheme
                          //         .bodyMedium
                          //         ?.copyWith(color: AppColor.primaryColor),
                          //   ),
                          // )
                        ],
                      ),
                    ),
                    const SizedBox(width: 72),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
