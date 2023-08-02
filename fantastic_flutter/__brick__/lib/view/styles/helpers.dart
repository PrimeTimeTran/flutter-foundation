import 'package:flutter/material.dart';

Color C(BuildContext context, String key) {
  final cs = Theme.of(context).colorScheme;
  switch (key) {
    case 'primary':
      return cs.primary;
    case 'onPrimary':
      return cs.onPrimary;
    case 'primaryContainer':
      return cs.primaryContainer;
    case 'secondary':
      return cs.secondary;
    case 'onSecondary':
      return cs.onSecondary;
    case 'surface':
      return cs.surface;
    case 'surfaceVariant':
      return cs.surfaceVariant;
    case 'inverseSurface':
      return cs.inverseSurface;
    case 'onInverseSurface':
      return cs.onInverseSurface;
    case 'inversePrimary':
      return cs.inversePrimary;
    case 'onPrimaryContainer':
      return cs.onPrimaryContainer;
    case 'outline':
      return cs.outline;
    case 'tertiary':
      return cs.tertiary;
    case 'background':
      return cs.background;
    case 'onBackground':
      return cs.onBackground;
    case 'secondaryContainer':
      return cs.secondaryContainer;
    case 'error':
      return cs.error;
    case 'onError':
      return cs.onError;
    case 'onErrorContainer':
      return cs.onErrorContainer;
    case 'shadow':
      return cs.shadow;
    default:
      throw Exception('Invalid color key: $key');
  }
}

TextStyle styleWithColor({required TextStyle type, Color? color}) {
  return type.copyWith(
    color: color ?? type.color,
  );
}

T(BuildContext context, String key) {
  final theme = Theme.of(context);
  switch (key) {
    case 'bodySmall':
      return theme.textTheme.bodySmall;
    case 'bodyMedium':
      return theme.textTheme.bodyMedium;
    case 'bodyLarge':
      return theme.textTheme.bodyLarge;
    case 'labelSmall':
      return theme.textTheme.labelSmall;
    case 'labelMedium':
      return theme.textTheme.labelMedium;
    case 'labelLarge':
      return theme.textTheme.labelLarge;
    case 'titleSmall':
      return theme.textTheme.titleSmall;
    case 'titleMedium':
      return theme.textTheme.titleMedium;
    case 'titleLarge':
      return theme.textTheme.titleLarge;
    case 'headlineSmall':
      return theme.textTheme.headlineSmall;
    case 'headlineMedium':
      return theme.textTheme.headlineMedium;
    case 'headlineLarge':
      return theme.textTheme.headlineLarge;
    case 'displaySmall':
      return theme.textTheme.displaySmall;
    case 'displayMedium':
      return theme.textTheme.displayMedium;
    case 'displayLarge':
      return theme.textTheme.displayLarge;
    default:
      throw Exception('Invalid color key: $key');
  }
}

texted(BuildContext c, val, t) {
  switch (val) {
    case 'hLarge':
      return textedHelper(c, 'headlineLarge', t);
    case 'hMedium':
      return textedHelper(c, 'headlineMedium', t);
    case 'hSmall':
      return textedHelper(c, 'headlineSmall', t);
    case 'bLarge':
      return textedHelper(c, 'bodyLarge', t);
    case 'bMedium':
      return textedHelper(c, 'bodyMedium', t);
    case 'bSmall':
      return textedHelper(c, 'bodySmall', t);
    default:
  }
}

textedHelper(BuildContext c, val, text) {
  return Text(
    text,
    style: T(c, val),
  );
}
