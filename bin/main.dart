import 'dart:io';

void main() {
  List<String> tasks = [];

  while (true) {
    print('\n📋 قائمة المهام');
    print('1️⃣ - عرض المهام');
    print('2️⃣ - إضافة مهمة جديدة');
    print('3️⃣ - حذف مهمة');
    print('4️⃣ - إنهاء البرنامج');
    stdout.write('اختر رقم العملية: ');

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        showTasks(tasks);
        break;
      case '2':
        addTask(tasks);
        break;
      case '3':
        deleteTask(tasks);
        break;
      case '4':
        print('👋 تم الخروج. شكرًا لاستخدام التطبيق!');
        return;
      default:
        print('❌ اختيار غير صحيح. حاول مرة أخرى.');
    }
  }
}

void showTasks(List<String> tasks) {
  if (tasks.isEmpty) {
    print('📭 لا توجد مهام بعد.');
  } else {
    print('✅ المهام الحالية:');
    for (int i = 0; i < tasks.length; i++) {
      print('${i + 1}. ${tasks[i]}');
    }
  }
}

void addTask(List<String> tasks) {
  stdout.write('✏️ أدخل اسم المهمة: ');
  String? task = stdin.readLineSync();
  if (task != null && task.trim().isNotEmpty) {
    tasks.add(task);
    print('✅ تم إضافة المهمة: "$task"');
  } else {
    print('⚠️ لم يتم إدخال أي مهمة.');
  }
}

void deleteTask(List<String> tasks) {
  if (tasks.isEmpty) {
    print('📭 لا توجد مهام لحذفها.');
    return;
  }

  showTasks(tasks);
  stdout.write('🗑️ أدخل رقم المهمة التي تريد حذفها: ');
  String? input = stdin.readLineSync();
  int? index = int.tryParse(input ?? '');

  if (index != null && index > 0 && index <= tasks.length) {
    String removed = tasks.removeAt(index - 1);
    print('🗑️ تم حذف المهمة: "$removed"');
  } else {
    print('⚠️ رقم غير صالح.');
  }
}
