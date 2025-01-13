import 'package:flutter/material.dart';

class NotificationPopup extends StatelessWidget {
  final String message;
  const NotificationPopup({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;
        return Stack(
          children: [
            Positioned(
              top: 30,
              right: 30,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: isMobile ? constraints.maxWidth - 60 : 400,
                  maxHeight: 150, // Max height for the scrollable content
                ),
                child: Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Notification",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            message,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

