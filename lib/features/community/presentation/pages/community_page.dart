import 'package:flutter/material.dart';
import '../widgets/community_post_card.dart';
import '../pages/community_editor_page.dart';

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
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CommunityEditorPage(),
                    ),
                  );
                },
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: colorScheme.onBackground.withOpacity(0.05),
                      child: Icon(
                        Icons.person_outline,
                        color: colorScheme.onBackground.withOpacity(0.5),
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      "무슨 생각을 하고 계신가요?",
                      style: textTheme.bodyLarge?.copyWith(
                        color: colorScheme.onBackground.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
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