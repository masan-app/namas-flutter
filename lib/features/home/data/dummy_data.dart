import '../domain/entities/post.dart';
import '../domain/entities/meeting.dart';

class DummyData {
  static List<Post> getPosts() {
    return [
      Post(
        id: '1',
        title: '북한산 등산 후기',
        content: '오늘 북한산 등산을 다녀왔습니다. 날씨가 정말 좋았고 단풍이 절정이었어요.',
        authorName: '산린이',
        authorImageUrl: 'https://picsum.photos/200',
        createdAt: DateTime.now().subtract(const Duration(hours: 2)),
        likeCount: 24,
        commentCount: 5,
        imageUrls: ['https://picsum.photos/400/300'],
        tags: ['북한산', '등산', '단풍'],
      ),
      Post(
        id: '2',
        title: '관악산 등산코스 추천',
        content: '관악산 초보자 코스를 공유합니다. 처음 등산하시는 분들에게 추천해요.',
        authorName: '등산전문가',
        createdAt: DateTime.now().subtract(const Duration(hours: 5)),
        likeCount: 42,
        commentCount: 8,
        imageUrls: ['https://picsum.photos/400/300', 'https://picsum.photos/400/300'],
        tags: ['관악산', '등산코스', '초보추천'],
      ),
    ];
  }

  static List<Meeting> getMeetings() {
    return [
      Meeting(
        id: '1',
        title: '주말 북한산 등산 모임',
        description: '이번 주말 북한산 등산하실 분 모집합니다. 백운대 코스로 가려고 해요.',
        meetingDate: DateTime.now().add(const Duration(days: 3)),
        location: '북한산국립공원 도봉산입구',
        maxParticipants: 6,
        currentParticipants: 3,
        organizerName: '산사랑',
        organizerImageUrl: 'https://picsum.photos/200',
        status: MeetingStatus.recruiting,
        createdAt: DateTime.now().subtract(const Duration(hours: 1)),
      ),
      Meeting(
        id: '2',
        title: '관악산 야간산행',
        description: '야간산행 함께하실 분들 모집합니다. 경험자만 신청해주세요.',
        meetingDate: DateTime.now().add(const Duration(days: 5)),
        location: '관악산입구역 1번 출구',
        maxParticipants: 4,
        currentParticipants: 4,
        organizerName: '달빛등산러',
        status: MeetingStatus.closed,
        createdAt: DateTime.now().subtract(const Duration(hours: 12)),
      ),
    ];
  }
} 