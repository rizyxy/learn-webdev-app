import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({Key? key, required this.label, required this.onTap})
      : super(key: key);

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        color: Theme.of(context).primaryColor,
        padding: const EdgeInsets.symmetric(vertical: 15),
        width: MediaQuery.of(context).size.width,
        child: Text(
          label,
          style: const TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
