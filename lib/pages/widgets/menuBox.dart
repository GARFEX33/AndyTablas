import 'package:flutter/material.dart';

class MenuBox extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function()? funcion;
  const MenuBox({
    super.key,
    required this.title,
    required this.icon,
    this.funcion,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: funcion,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Color(0x3f000000),
                offset: Offset(0, 4),
                blurRadius: 2,
              ),
            ],
            borderRadius: BorderRadius.circular(19),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(width: 10),
              Icon(
                icon,
                size: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
