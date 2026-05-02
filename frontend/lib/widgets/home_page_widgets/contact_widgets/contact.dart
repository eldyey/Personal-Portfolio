import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:html' as html;

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();

  bool isLoading = false;

  Widget inputField(
    String hint,
    TextEditingController controller, {
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      validator: validator,
      textAlignVertical: TextAlignVertical.top,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 13,
        fontFamily: "Poppins",
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          color: Colors.white38,
          fontFamily: "Poppins",
        ),
        filled: true,
        fillColor: Colors.white.withOpacity(0.05),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.white12),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.white, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.redAccent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.redAccent),
        ),
      ),
    );
  }

  Widget hoverLink(String text, String url) {
    bool isHovering = false;

    return StatefulBuilder(
      builder: (context, setState) {
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) => setState(() => isHovering = true),
          onExit: (_) => setState(() => isHovering = false),
          child: GestureDetector(
            onTap: () {
              html.window.open(url, "_blank");
            },
            child: Text(
              text,
              style: TextStyle(
                color: isHovering ? Colors.white : Colors.grey,
                fontFamily: "Poppins",
                fontSize: 12,
                decoration:
                    isHovering ? TextDecoration.underline : TextDecoration.none,
              ),
            ),
          ),
        );
      },
    );
  }

  void showSuccess(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(fontFamily: "Poppins"),
          ),
        ),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        width: 200,
      ),
    );
  }

  void showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(fontFamily: "Poppins"),
          ),
        ),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        width: 200,
      ),
    );
  }

  Future<void> sendMessage() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => isLoading = true);

    const serviceId = "service_qepc88a";
    const templateId = "template_b995eir";
    const publicKey = "BjmgOGcbF8BTSJY_u";

    final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "service_id": serviceId,
          "template_id": templateId,
          "user_id": publicKey,
          "template_params": {
            "from_name": nameController.text.trim(),
            "from_email": emailController.text.trim(),
            "message": messageController.text.trim(),
          }
        }),
      );

      if (response.statusCode == 200) {
        if (!mounted) return;

        showSuccess("Message sent!");

        nameController.clear();
        emailController.clear();
        messageController.clear();
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      if (!mounted) return;
      showError("Failed to send message");
    }

    setState(() => isLoading = false);
  }

  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) return "Name is required";
    return null;
  }

  // ✅ UPDATED EMAIL VALIDATION ONLY
  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Email is required";
    }

    final email = value.trim();

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(email)) {
      return "Enter a valid email address";
    }

    return null;
  }

  String? validateMessage(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Message cannot be empty";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 800,
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Color.fromARGB(15, 93, 94, 94),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Get in Touch",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Poppins",
                      ),
                    ),
                    const Text(
                      'Feel free to reach out for collaborations',
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: "Poppins",
                      ),
                    ),
                    const SizedBox(height: 20),

                    Row(
                      children: [
                        Expanded(
                          child: inputField(
                            "Your Name",
                            nameController,
                            validator: validateName,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: inputField(
                            "Your Email",
                            emailController,
                            validator: validateEmail,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    inputField(
                      "Your Message",
                      messageController,
                      maxLines: 8,
                      validator: validateMessage,
                    ),

                    const SizedBox(height: 10),

                    ElevatedButton(
                      onPressed: isLoading ? null : sendMessage,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        backgroundColor: Colors.blue,
                      ),
                      child: Center(
                        child: Text(
                          isLoading ? "Sending..." : "Send Message",
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: "Poppins",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(width: 20),

            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  const Text(
                    "Other Contact Info",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins",
                    ),
                  ),
                  const Text(
                    'You can also find me on:',
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: "Poppins",
                    ),
                  ),
                  const SizedBox(height: 20),

                  const Row(
                    children: [
                      Icon(Icons.call_outlined, size: 20, color: Colors.green),
                      SizedBox(width: 5),
                      Text("Phone:",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Poppins",
                          )),
                    ],
                  ),

                  const Text("+63 953-0047-088",
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: "Poppins",
                        fontSize: 12,
                      )),

                  const SizedBox(height: 15),

                  const Row(children: [
                    Icon(Icons.facebook_outlined, size: 20, color: Colors.blue),
                    SizedBox(width: 5),
                    Text("Facebook:",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Poppins",
                        )),
                  ]),

                  hoverLink(
                    "https://www.facebook.com/lester.manzanero",
                    "https://www.facebook.com/lester.manzanero",
                  ),

                  const SizedBox(height: 15),

                  const Row(
                    children: [
                      Icon(Icons.camera_alt_outlined,
                          size: 20,
                          color: Color.fromARGB(255, 168, 55, 93)),
                      SizedBox(width: 5),
                      Text("Instagram:",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Poppins",
                          )),
                    ],
                  ),

                  hoverLink(
                    "https://www.instagram.com/lj.manzanero",
                    "https://www.instagram.com/lj.manzanero",
                  ),

                  const SizedBox(height: 70),

                  const Text(
                    "Feel free to reach out.",
                    style: TextStyle(
                      color: Colors.white54,
                      fontFamily: "Poppins",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}