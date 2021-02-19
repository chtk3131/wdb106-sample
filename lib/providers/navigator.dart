import 'package:flutter/widgets.dart';

import '../components/components.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 遷移先のページのKeyを振り分ける
final navigatorProvider = Provider((_) => GlobalKey<NavigatorState>());
