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
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

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
                  style: textTheme.titleMedium?.copyWith(
                    fontSize: 16,
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
          _buildInfoRow(context, Icons.calendar_today, _formatDate(meeting.meetingDate)),
          const SizedBox(height: 6),
          _buildInfoRow(context, Icons.location_on, meeting.location),
          const SizedBox(height: 6),
          _buildInfoRow(
            context,
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
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon, 
          size: 16, 
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
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