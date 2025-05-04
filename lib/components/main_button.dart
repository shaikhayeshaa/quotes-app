import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final bool loading;

  const MainButton({
    super.key,
    required this.title,
    required this.onPress,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: InkWell(
        onTap: loading ? null : onPress, // disable if loading
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 69, 5, 81),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: loading
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
