import 'dart:async';

import 'package:shared/shared.dart';

class TimerBuilder extends StatefulWidget {
  final Widget Function(BuildContext context, (String, String, String, String) value) child;
  final DateTime? startDateTime;
  final DateTime? endDateTime;
  final bool countUp;

  const TimerBuilder({
    super.key,
    required this.child,
    this.endDateTime,
    this.startDateTime,
    this.countUp = false,
  });

  @override
  State<TimerBuilder> createState() => _TimerBuilderState();
}

class _TimerBuilderState extends State<TimerBuilder> {
  Timer? _timer;
  late Duration _remaining;

  void _startTimer() {
    _updateRemaining();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => _updateRemaining());
  }

  void _updateRemaining() {
    final date = widget.startDateTime ?? DateTime.now();
    setState(() {
      if (widget.countUp) {
        _remaining = kNowDate.difference(widget.startDateTime ?? kNowDate);
      } else {
        _remaining = widget.endDateTime?.difference(date) ?? Duration.zero;
      }
      if (_remaining.isNegative) {
        _remaining = Duration.zero;
        _timer?.cancel();
      }
    });
  }

  (String, String, String, String) _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');

    final days = duration.inDays;
    final hours = twoDigits(duration.inHours.remainder(24));
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return ("$days", hours, minutes, seconds);
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final formattedTime = _formatDuration(_remaining);
    return widget.child(context, _formatDuration(_remaining));
  }
}
