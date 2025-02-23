import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CommunityEditorPage extends StatefulWidget {
  const CommunityEditorPage({super.key});

  @override
  State<CommunityEditorPage> createState() => _CommunityEditorPageState();
}

class _CommunityEditorPageState extends State<CommunityEditorPage> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final _locationController = TextEditingController();
  final _maxParticipantsController = TextEditingController();
  DateTime? _meetingDateTime;
  final List<String> _imageUrls = [];
  bool _isCommunityPost = true;  // true: 커뮤니티, false: 모집

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    _locationController.dispose();
    _maxParticipantsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: () {
                setState(() => _isCommunityPost = true);
              },
              style: TextButton.styleFrom(
                foregroundColor: _isCommunityPost 
                    ? colorScheme.primary 
                    : colorScheme.onSurface.withOpacity(0.6),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                textStyle: const TextStyle(fontSize: 17),
              ),
              child: const Text('커뮤니티'),
            ),
            Container(
              width: 1,
              height: 16,
              color: colorScheme.onSurface.withOpacity(0.1),
            ),
            TextButton(
              onPressed: () {
                setState(() => _isCommunityPost = false);
              },
              style: TextButton.styleFrom(
                foregroundColor: !_isCommunityPost 
                    ? colorScheme.primary 
                    : colorScheme.onSurface.withOpacity(0.6),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                textStyle: const TextStyle(fontSize: 17),
              ),
              child: const Text('모임'),
            ),
          ],
        ),
        leading: TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            '취소',
            style: textTheme.bodyLarge?.copyWith(
              color: colorScheme.onSurface.withOpacity(0.8),
              fontSize: 17,
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // TODO: 게시글 작성 로직 구현
              Navigator.pop(context);
            },
            child: Text(
              '게시',
              style: textTheme.bodyLarge?.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.w600,
                fontSize: 17,
              ),
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Column(
        children: [
          if (!_isCommunityPost) ...[
            ListTile(
              leading: Icon(
                Icons.calendar_today,
                size: 20,
                color: colorScheme.primary,
              ),
              title: Text(
                _meetingDateTime != null 
                    ? DateFormat('M월 d일 (E) HH:mm', 'ko').format(_meetingDateTime!)
                    : '날짜와 시간 선택',
                style: textTheme.bodyMedium,
              ),
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                );
                if (date != null) {
                  final time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (time != null) {
                    setState(() {
                      _meetingDateTime = DateTime(
                        date.year, date.month, date.day,
                        time.hour, time.minute,
                      );
                    });
                  }
                }
              },
            ),
            TextField(
              controller: _locationController,
              decoration: InputDecoration(
                hintText: '장소',
                prefixIcon: Icon(
                  Icons.location_on,
                  size: 20,
                  color: colorScheme.primary,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.all(16),
              ),
            ),
            TextField(
              controller: _maxParticipantsController,
              decoration: InputDecoration(
                hintText: '모집 인원',
                prefixIcon: Icon(
                  Icons.people,
                  size: 20,
                  color: colorScheme.primary,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.all(16),
              ),
              keyboardType: TextInputType.number,
            ),
          ],
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      hintText: _isCommunityPost ? '제목' : '모임 제목',
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Divider(height: 1),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    controller: _contentController,
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: _isCommunityPost ? '무슨 생각을 하고 계신가요?' : '모임에 대해 설명해주세요',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                    ),
                    style: textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
          ),
          SafeArea(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: colorScheme.onSurface.withOpacity(0.1),
                  ),
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      // TODO: 이미지 추가 기능 구현
                    },
                    icon: Icon(
                      Icons.image_outlined,
                      color: colorScheme.primary,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // TODO: 카메라 기능 구현
                    },
                    icon: Icon(
                      Icons.camera_alt_outlined,
                      color: colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
} 