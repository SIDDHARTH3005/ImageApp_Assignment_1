import 'package:flutter/material.dart';

void main() {
  runApp(const ImageApp());
}

class ImageApp extends StatelessWidget {
  const ImageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.cyan[50],
        appBar: AppBar(
          title: const Text("Image App"),
          backgroundColor: Colors.cyan[800],
          centerTitle: true,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Asset Image with border radius and shadow
              Center(
                child: Container(
                  width: 300,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(4, 4),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'images/owl.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Network Image with loading and error handling
              SizedBox(
                width: 300,
                height: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    'https://picsum.photos/300/200',
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(child: CircularProgressIndicator());
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(child: Text('Failed to load image'));
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}





