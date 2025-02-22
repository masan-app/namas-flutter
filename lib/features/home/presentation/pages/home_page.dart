import 'package:flutter/material.dart';
import '../../data/dummy_data.dart';
import '../widgets/post_card.dart';
import '../widgets/meeting_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final posts = DummyData.getPosts();
    final meetings = DummyData.getMeetings();

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 12, bottom: 12),
              child: Text(
                'Home',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  const Text(
                    '추천 모임',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 180,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: meetings.length,
                      separatorBuilder: (context, index) => const SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: 280,
                          child: MeetingCard(
                            meeting: meetings[index],
                            onTap: () {
                              // TODO: 모임 상세 페이지로 이동
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    '최신 게시글',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: posts.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      return PostCard(
                        post: posts[index],
                        onTap: () {
                          // TODO: 게시글 상세 페이지로 이동
                        },
                      );
                    },
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