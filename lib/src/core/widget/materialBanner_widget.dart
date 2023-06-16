import 'package:flutter/material.dart';

extension MaterialBannerWidget on MaterialBanner {
  MaterialBanner authMaterialBanner(BuildContext context) => MaterialBanner(
          backgroundColor: Colors.transparent,
          leading:
              leading ?? const Icon(Icons.warning_rounded, color: Colors.amber),
          content: content,
          actions: [
            TextButton(
                onPressed: () =>
                    ScaffoldMessenger.of(context).clearMaterialBanners(),
                child: const Text("Done"))
          ]);
}
