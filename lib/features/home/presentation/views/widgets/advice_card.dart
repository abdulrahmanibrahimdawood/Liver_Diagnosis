import 'package:flutter/material.dart';
import 'package:liver_diagnosis/core/utils/app_color.dart';
import 'package:liver_diagnosis/features/checkout/data/models/advice_model.dart';

class AdviceCard extends StatelessWidget {
  const AdviceCard({
    required this.advice,
    super.key,
  });
  final AdviceModel advice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: Container(
        height: 330,
        decoration: BoxDecoration(
          color: AppColor.kPrimaryColor.withValues(alpha: .5),
          borderRadius: BorderRadius.circular(10),
        ),
        width: MediaQuery.of(context).size.width * 0.90,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              const SizedBox(
                height: 18,
              ),
              Text(
                advice.title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 150,
                width: 150,
                child: Image.network(
                  advice.image,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.image_not_supported,
                    color: Colors.grey,
                    size: 150,
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Text(
                advice.description,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
