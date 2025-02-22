class Post {
  final String id;
  final String title;
  final String content;
  final String authorName;
  final String? authorImageUrl;
  final DateTime createdAt;
  final int likeCount;
  final int commentCount;
  final List<String> imageUrls;
  final List<String> tags;

  const Post({
    required this.id,
    required this.title,
    required this.content,
    required this.authorName,
    this.authorImageUrl,
    required this.createdAt,
    required this.likeCount,
    required this.commentCount,
    required this.imageUrls,
    required this.tags,
  });
} 