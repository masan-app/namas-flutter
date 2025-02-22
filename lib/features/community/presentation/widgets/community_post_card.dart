import 'package:flutter/material.dart';

class CommunityPostCard extends StatelessWidget {
  final bool hasImages;
  
  const CommunityPostCard({
    super.key,
    this.hasImages = false,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      color: colorScheme.surface,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage('https://picsum.photos/200'),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '사용자 이름',
                        style: textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '2시간 전',
                        style: textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurface.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                '오늘 북한산 등산했는데 날씨가 정말 좋았어요! 단풍도 예쁘게 물들었고, 정상에서 본 서울 전경도 멋있었습니다.',
                style: textTheme.bodyMedium,
              ),
              if (hasImages) ...[
                const SizedBox(height: 12),
                SizedBox(
                  height: 300,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    separatorBuilder: (_, __) => const SizedBox(width: 8),
                    itemBuilder: (context, index) {
                      return AspectRatio(
                        aspectRatio: 3/4,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            'https://picsum.photos/600/800?random=$index',
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(Icons.favorite_border, 
                    size: 20, 
                    color: colorScheme.onSurface.withOpacity(0.6),
                  ),
                  const SizedBox(width: 4),
                  Text('12', style: textTheme.bodyMedium),
                  const SizedBox(width: 16),
                  Icon(Icons.chat_bubble_outline, 
                    size: 20,
                    color: colorScheme.onSurface.withOpacity(0.6),
                  ),
                  const SizedBox(width: 4),
                  Text('5', style: textTheme.bodyMedium),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
} 