import 'package:flutter/material.dart';
import 'package:valorant_api/model/agents_model.dart';

class AbilitiesPageView extends StatefulWidget {
  final Agent agent;
  final PageController controller;
  final void Function(int) onPageChanged;
  const AbilitiesPageView({
    Key? key,
    required this.controller,
    required this.agent,
    required this.onPageChanged,
  }) : super(key: key);

  @override
  State<AbilitiesPageView> createState() => _AbilitiesPageViewState();
}

class _AbilitiesPageViewState extends State<AbilitiesPageView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 200,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        child: PageView.builder(
          controller: widget.controller,
          onPageChanged: widget.onPageChanged,
          itemCount: widget.agent.abilities!.length,
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  widget.agent.abilities![index].description.toString(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
