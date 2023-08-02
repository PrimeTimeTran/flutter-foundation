import 'dart:developer';

import 'package:flutter/foundation.dart';

void p(v, {icon}) {
  icon = icon ?? 'ℹ😃';
  switch (icon) {
    case 'error' || 'e':
      icon = '❗️';
      break;
  }
  if (kDebugMode) {
    log('\x1B[32m$icon $v');
  }
}
