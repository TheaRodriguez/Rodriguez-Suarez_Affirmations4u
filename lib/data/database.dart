import 'package:hive_flutter/hive_flutter.dart';

class JournalEntryDatabase {
  List journalEntryList = [];
  
  // reference the hive box
  final _journalBox = Hive.box('journalBox');

  // run method if 1st time ever opening this app
  void createInitialData() {
    journalEntryList = [
      ["Allow myself to grow."],
      ["Love and forgive myself."],
    ];
  }

  void loadData() {
    journalEntryList = _journalBox.get("JOURNALENTRYLIST");
  }

  void updateDatabase() {
    _journalBox.put("JOURNALENTRYLIST", journalEntryList);
  }
  
}