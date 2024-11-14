import 'dart:io'; // for File
import 'package:hive/hive.dart';

class FileAdapter extends TypeAdapter<File> {
  @override
  final int typeId = 3; // Unique typeId for File class.

  @override
  File read(BinaryReader reader) {
    // Read the file path as a string
    final String path = reader.readString();
    return File(path); // Return a File object using the path
  }

  @override
  void write(BinaryWriter writer, File obj) {
    // Write the file's path to the binary data
    writer.writeString(obj.path);
  }
}
