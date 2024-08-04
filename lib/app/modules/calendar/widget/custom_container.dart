import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Color curvedColor;
  final Color rectColor;
  final String topText;
  final String bottomText;

  const CustomContainer({
    required this.curvedColor,
    required this.rectColor,
    required this.topText,
    required this.bottomText,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Light pink container
        Container(
          width: 272,
          height: 64,
          decoration: BoxDecoration(
            color: rectColor, // Light pink
            borderRadius: BorderRadius.circular(12), // Slightly curved edges
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  topText,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4), // Space between the texts
                Row(
                  children: [
                    const Icon(
                      Icons.access_time_filled_outlined,
                      color: Colors.grey,
                      size: 20,
                    ),
                    const SizedBox(width: 8), // Space between icon and text
                    Text(
                      bottomText,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        // Pink curved container on the left
        Positioned(
          left: 0,
          top: 0,
          bottom: 0,
          child: Container(
            width: 10, // Adjust width as needed
            height: 64,
            decoration: BoxDecoration(
              color: curvedColor, // Pink color for the left curve
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12), // Curved edge on top left
                bottomLeft: Radius.circular(12), // Curved edge on bottom left
              ),
            ),
          ),
        ),
      ],
    );
  }
}