import 'package:flutter/material.dart';

class TipsScreen extends StatelessWidget {
  const TipsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> tips = [
      "Break large numbers into smaller parts.\nFor example, to add 385 + 417, break them into (300 + 400) + (80 + 10) + (5 + 7) = 800 + 90 + 12 = 902.",
      "Round numbers to make calculations easier, then adjust.\nFor instance, 198 + 345 can be rounded to 200 + 345 = 545, then subtract 2 to get 543.",
      "Use doubling and halving techniques.\nIf you need to multiply 25 × 16, you can rewrite it as (25 × 8) × 2 = 200 × 2 = 400.",
      "Memorize common multiplication and addition patterns.\nFor example, knowing that 9 × 7 = 63 or 25 × 4 = 100 can speed up calculations.",
      "Estimate first, then refine for accuracy.\nIf calculating 492 ÷ 6, round 492 to 500 and divide: 500 ÷ 6 ≈ 83. Adjust downward slightly to get 82.",
      "Use benchmarks like 100 or 1000 to simplify calculations.\nFor example, if adding 873 + 256, think of 873 as 900 and 256 as 250. Then add 900 + 250 = 1150 and adjust (subtracting 27).",
      "Work from left to right instead of right to left.\nFor example, when adding 327 + 468, start with 300 + 400 = 700, then add 20 + 60 = 80, and finally 7 + 8 = 15. The result is 795.",
      "Use the distributive property.\nFor instance, to compute 47 × 8, break it into (40 × 8) + (7 × 8) = 320 + 56 = 376.",
    ];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/main_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            AppBar(
              title: const Text(
                'Tips',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.close, color: Colors.white, size: 30),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Here are some tips to help you quickly calculate large numbers in your head:",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: tips.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 12.0,
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF0A2),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFF60442C),
                        width: 3,
                      ),
                    ),
                    child: Text(
                      tips[index],
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
