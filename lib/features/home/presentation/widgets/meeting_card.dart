import 'package:flutter/material.dart';
import '../../../../core/widgets/app_avatar.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/app_badge.dart';
import '../../domain/entities/meeting.dart';
import 'package:intl/intl.dart';

class MeetingCard extends StatelessWidget {
  final Meeting meeting;
  final VoidCallback? onTap;

  const MeetingCard({
    super.key,
    required this.meeting,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: onTap,
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  meeting.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              AppBadge(
                text: _getStatusText(),
                type: _getStatusBadgeType(),
                isSmall: true,
              ),
            ],
          ),
          const SizedBox(height: 8),
          _buildInfoRow(Icons.calendar_today, _formatDate(meeting.meetingDate)),
          const SizedBox(height: 6),
          _buildInfoRow(Icons.location_on, meeting.location),
          const SizedBox(height: 6),
          _buildInfoRow(
            Icons.people,
            '${meeting.currentParticipants}/${meeting.maxParticipants}명',
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              AppAvatar(
                imageUrl: meeting.organizerImageUrl,
                name: meeting.organizerName,
                size: 24,
              ),
              const SizedBox(width: 8),
              Text(
                meeting.organizerName,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey),
        const SizedBox(width: 8),
        Text(text),
      ],
    );
  }

  String _getStatusText() {
    switch (meeting.status) {
      case MeetingStatus.recruiting:
        return '모집중';
      case MeetingStatus.closed:
        return '모집마감';
      case MeetingStatus.completed:
        return '완료';
    }
  }

  AppBadgeType _getStatusBadgeType() {
    switch (meeting.status) {
      case MeetingStatus.recruiting:
        return AppBadgeType.success;
      case MeetingStatus.closed:
        return AppBadgeType.error;
      case MeetingStatus.completed:
        return AppBadgeType.neutral;
    }
  }

  String _formatDate(DateTime date) {
    return DateFormat('M월 d일 (E) HH:mm', 'ko').format(date);
  }
} 