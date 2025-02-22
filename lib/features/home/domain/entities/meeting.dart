enum MeetingStatus {
  recruiting, // 모집중
  closed,     // 모집마감
  completed   // 완료됨
}

class Meeting {
  final String id;
  final String title;
  final String description;
  final DateTime meetingDate;
  final String location;
  final int maxParticipants;
  final int currentParticipants;
  final String organizerName;
  final String? organizerImageUrl;
  final MeetingStatus status;
  final DateTime createdAt;

  const Meeting({
    required this.id,
    required this.title,
    required this.description,
    required this.meetingDate,
    required this.location,
    required this.maxParticipants,
    required this.currentParticipants,
    required this.organizerName,
    this.organizerImageUrl,
    required this.status,
    required this.createdAt,
  });

  bool get isRecruiting => status == MeetingStatus.recruiting;
} 