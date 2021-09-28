import 'package:flutter/material.dart';

class CustomAddressField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final FocusNode node;
  final bool readOnly;

  const CustomAddressField(
      {this.controller, this.hint, this.node, this.readOnly = false});

  @override
  _CustomAddressFieldState createState() => _CustomAddressFieldState();
}

class _CustomAddressFieldState extends State<CustomAddressField> {
  Widget build(BuildContext context) {
    // node.hasFocus
    return Container(
      height: 54,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        color: widget.node.hasFocus
                            ? Colors.white
                            : Color(0xffD0C9D6),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      readOnly: widget.readOnly,
                      focusNode: widget.node,
                      controller: widget.controller,
                      maxLines: 1,
                      decoration: InputDecoration(
                        // prefix: ,
                        hintText: widget.hint ?? '',
                        contentPadding:
                        const EdgeInsets.only(left: 16.0, right: 20.0),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                        ),

                        focusedBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue,
                        fontWeight:
                        FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
