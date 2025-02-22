import 'package:flutter/material.dart';
import '../../../../core/widgets/app_avatar.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/app_badge.dart';
import '../../domain/entities/post.dart';
import 'package:timeago/timeago.dart' as timeago;

class PostCard extends StatelessWidget {
  final Post post;
  final VoidCallback? onTap;

  const PostCard({
    super.key,
    required this.post,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 12),
          Text(
            post.title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            post.content,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 12),
          if (post.imageUrls.isNotEmpty) _buildImages(),
          const SizedBox(height: 12),
          _buildFooter(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        AppAvatar(
          imageUrl: post.authorImageUrl,
          name: post.authorName,
          size: 36,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.authorName,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                timeago.format(post.createdAt, locale: 'ko'),
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildImages() {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: post.imageUrls.length,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              post.imageUrls[index],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }

  Widget _buildFooter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.favorite_border, size: 20),
            const SizedBox(width: 4),
            Text('${post.likeCount}'),
            const SizedBox(width: 16),
            const Icon(Icons.chat_bubble_outline, size: 20),
            const SizedBox(width: 4),
            Text('${post.commentCount}'),
          ],
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 4,
          runSpacing: 4,
          children: post.tags.map((tag) {
            return AppBadge(
              text: '#$tag',
              type: AppBadgeType.primary,
              isSmall: true,
            );
          }).toList(),
        ),
      ],
    );
  }
} 