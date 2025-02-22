import 'package:flutter/material.dart';
import '../widgets/community_post_card.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: colorScheme.onBackground.withOpacity(0.1),
                    child: Icon(
                      Icons.person_outline,
                      color: colorScheme.onBackground.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    "무슨 생각을 하고 계신가요?",
                    style: textTheme.bodyLarge?.copyWith(
                      color: colorScheme.onBackground.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 1,
              color: colorScheme.onBackground.withOpacity(0.08),
            ),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.zero,
                itemCount: 10,
                separatorBuilder: (context, index) => Divider(
                  height: 1,
                  color: colorScheme.onBackground.withOpacity(0.08),
                ),
                itemBuilder: (context, index) {
                  return CommunityPostCard(
                    hasImages: index % 2 == 0,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
} 