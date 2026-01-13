import 'package:flutter/material.dart';

class IncubatorsTag extends StatelessWidget {
  const IncubatorsTag({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "From",
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Incubators logo (optional)
            Icon(
              Icons.lightbulb_outline,
              color: Colors.redAccent,
              size: 20,
            ),
            const SizedBox(width: 6),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "incubators",
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: "  by  ",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: "Core2web",
                    style: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
