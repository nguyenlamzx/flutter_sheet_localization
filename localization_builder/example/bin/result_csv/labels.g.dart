import 'dart:ui';
import 'package:template_string/template_string.dart';
    
final localizedLabels = <Locale, Example>{
  Locale.fromSubtags(languageCode: 'fr'): const Example(
    multiline: 'C\'est\n\nun\n\nExemple multiligne.',
    plurals: const ExamplePlurals(
      manMultiple: 'hommes',
      manOne: 'homme',
      manZero: 'hommes',
    ),
    templated: const ExampleTemplated(
      contactFemale: 'Mme {{last_name}}',
      contactMale: 'M. {{last_name}}',
      hello: 'Bonjour {{first_name}}!',
      date: const ExampleTemplatedDate(
        pattern: 'Aujourd\'hui : {{date:DateTime[EEE, M/d/y]}}',
        simple: 'Aujourd\'hui : {{date:DateTime}}',
      ),
      numbers: const ExampleTemplatedNumbers(
        formatted: 'Le prix est de {{price:double[compactCurrency]}}',
        simple: 'Le prix est de {{price:double}}€',
        count: 'Il y a {{count:int}} éléments.',
      ),
    ),
    dates: const ExampleDates(
      month: const ExampleDatesMonth(
        april: 'avril',
        march: 'février',
        february: 'février',
        january: 'Janvier',
      ),
      weekday: const ExampleDatesWeekday(
        sunday: 'dimanche',
        saturday: 'Samedi',
        friday: 'vendredi',
        thursday: 'Jeudi',
        wednesday: 'Mercredi',
        tuesday: 'Mardi',
        monday: 'LUNDI',
      ),
    ),
  ),
  Locale.fromSubtags(languageCode: 'en'): const Example(
    multiline: 'This is\n\na\n\nmultiline example.',
    plurals: const ExamplePlurals(
      manMultiple: 'men',
      manOne: 'man',
      manZero: 'man',
    ),
    templated: const ExampleTemplated(
      contactFemale: 'Mrs {{last_name}}!',
      contactMale: 'Mr {{last_name}}!',
      hello: 'Hello {{first_name}}!',
      date: const ExampleTemplatedDate(
        pattern: 'Today : {{date:DateTime[EEE, M/d/y]}}',
        simple: 'Today : {{date:DateTime}}',
      ),
      numbers: const ExampleTemplatedNumbers(
        formatted: 'The price is {{price:double[compactCurrency]}}',
        simple: 'The price is {{price:double}}\$',
        count: 'There are {{count:int}}\ items.',
      ),
    ),
    dates: const ExampleDates(
      month: const ExampleDatesMonth(
        april: 'april',
        march: 'march',
        february: 'february',
        january: 'january',
      ),
      weekday: const ExampleDatesWeekday(
        sunday: 'sunday',
        saturday: 'saturday',
        friday: 'friday',
        thursday: 'thursday',
        wednesday: 'wednesday',
        tuesday: 'tuesday',
        monday: 'MONDAY',
      ),
    ),
  ),
  Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans', countryCode: 'CN'):
      const Example(
    multiline: '这是\n\nA\n\n多行示例。',
    plurals: const ExamplePlurals(
      manMultiple: '男人',
      manOne: '男人',
      manZero: '男人',
    ),
    templated: const ExampleTemplated(
      contactFemale: '夫人{{last_name}}',
      contactMale: '先生{{last_name}}',
      hello: '你好{{first_name}}!',
      date: const ExampleTemplatedDate(
        pattern: '今日 : {{date:DateTime[EEE, M/d/y]}}',
        simple: '今日 : {{date:DateTime}}',
      ),
      numbers: const ExampleTemplatedNumbers(
        formatted: '価格は{{price:double[compactCurrency]}}です',
        simple: '価格は{{price:double}}¥です',
        count: '{{count:int}}個のアイテムがあります',
      ),
    ),
    dates: const ExampleDates(
      month: const ExampleDatesMonth(
        april: '四月',
        march: '游行',
        february: '二月',
        january: '一月',
      ),
      weekday: const ExampleDatesWeekday(
        sunday: '星期日',
        saturday: '星期六',
        friday: '星期五',
        thursday: '星期四',
        wednesday: '星期三',
        tuesday: '星期二',
        monday: '星期一',
      ),
    ),
  ),
};

enum Plural {
  multiple,
  one,
  zero,
}

enum Gender {
  female,
  male,
}

class Example {
  const Example({
    required this.multiline,
    required this.plurals,
    required this.templated,
    required this.dates,
  });

  final String multiline;
  final ExamplePlurals plurals;
  final ExampleTemplated templated;
  final ExampleDates dates;
}

class ExamplePlurals {
  const ExamplePlurals({
    required String manMultiple,
    required String manOne,
    required String manZero,
  })  : _manMultiple = manMultiple,
        _manOne = manOne,
        _manZero = manZero;

  final String _manMultiple;
  final String _manOne;
  final String _manZero;

  String man({
    required Plural plural,
  }) {
    if (plural == Plural.multiple) {
      return _manMultiple;
    }
    if (plural == Plural.one) {
      return _manOne;
    }
    if (plural == Plural.zero) {
      return _manZero;
    }
    throw Exception();
  }
}

class ExampleTemplated {
  const ExampleTemplated({
    required String contactFemale,
    required String contactMale,
    required String hello,
    required this.date,
    required this.numbers,
  })  : _contactFemale = contactFemale,
        _contactMale = contactMale,
        _hello = hello;

  final String _contactFemale;
  final String _contactMale;
  final String _hello;
  final ExampleTemplatedDate date;
  final ExampleTemplatedNumbers numbers;

  String contact({
    required Gender gender,
    required String lastName,
    String? locale,
  }) {
    if (gender == Gender.female) {
      return _contactFemale.insertTemplateValues(
        {
          'last_name': lastName,
        },
        locale: locale,
      );
    }
    if (gender == Gender.male) {
      return _contactMale.insertTemplateValues(
        {
          'last_name': lastName,
        },
        locale: locale,
      );
    }
    throw Exception();
  }

  String hello({
    required String firstName,
    String? locale,
  }) {
    return _hello.insertTemplateValues(
      {
        'first_name': firstName,
      },
      locale: locale,
    );
  }
}

class ExampleTemplatedDate {
  const ExampleTemplatedDate({
    required String pattern,
    required String simple,
  })  : _pattern = pattern,
        _simple = simple;

  final String _pattern;
  final String _simple;

  String pattern({
    required DateTime date,
    String? locale,
  }) {
    return _pattern.insertTemplateValues(
      {
        'date': date,
      },
      locale: locale,
    );
  }

  String simple({
    required DateTime date,
    String? locale,
  }) {
    return _simple.insertTemplateValues(
      {
        'date': date,
      },
      locale: locale,
    );
  }
}

class ExampleTemplatedNumbers {
  const ExampleTemplatedNumbers({
    required String formatted,
    required String simple,
    required String count,
  })  : _formatted = formatted,
        _simple = simple,
        _count = count;

  final String _formatted;
  final String _simple;
  final String _count;

  String formatted({
    required double price,
    String? locale,
  }) {
    return _formatted.insertTemplateValues(
      {
        'price': price,
      },
      locale: locale,
    );
  }

  String simple({
    required double price,
    String? locale,
  }) {
    return _simple.insertTemplateValues(
      {
        'price': price,
      },
      locale: locale,
    );
  }

  String count({
    required int count,
    String? locale,
  }) {
    return _count.insertTemplateValues(
      {
        'count': count,
      },
      locale: locale,
    );
  }
}

class ExampleDates {
  const ExampleDates({
    required this.month,
    required this.weekday,
  });

  final ExampleDatesMonth month;
  final ExampleDatesWeekday weekday;
}

class ExampleDatesMonth {
  const ExampleDatesMonth({
    required this.april,
    required this.march,
    required this.february,
    required this.january,
  });

  final String april;
  final String march;
  final String february;
  final String january;
}

class ExampleDatesWeekday {
  const ExampleDatesWeekday({
    required this.sunday,
    required this.saturday,
    required this.friday,
    required this.thursday,
    required this.wednesday,
    required this.tuesday,
    required this.monday,
  });

  final String sunday;
  final String saturday;
  final String friday;
  final String thursday;
  final String wednesday;
  final String tuesday;
  final String monday;
}
