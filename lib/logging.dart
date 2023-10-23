// ignore_for_file: public_member_api_docs

import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';

final logger = Logger('AppLogger');
void setUpLogging() {
  // First, set the root Level. All messages at or above the current level
  // are sent to the onRecord stream. Available levels are:
  //
  // Level.OFF
  // Level.SHOUT
  // Level.SEVERE
  // Level.WARNING
  // Level.INFO
  // Level.CONFIG
  // Level.FINE
  // Level.FINER
  // Level.FINEST
  // Then, listen on the onRecord stream for LogRecord events.
  // The LogRecord class has various
  // properties for the message, error, logger name, and more.
  //

  // use levels FINE, FINER, and FINEST for level testing

  Logger.root.level = Level.INFO; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    debugPrint('${record.level.name}: ${record.time}: ${record.message}');
  });
}
