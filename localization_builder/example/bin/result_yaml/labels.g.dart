import 'dart:ui';
import 'package:template_string/template_string.dart';
    
final localizedLabels = <Locale, Example>{
  Locale.fromSubtags(languageCode: 'fr'): const Example(
    multiline: 'C\'est\nune\nexemple multiligne.',
    dates: const ExampleDates(
      weekday: const ExampleDatesWeekday(
        monday: 'lundi',
        tuesday: 'mardi',
        wednesday: 'mercredi',
      ),
    ),
    templated: const ExampleTemplated(
      hello: 'Bonjour {{first_name}}!',
      contactMale: 'M. {{last_name}}',
      contactFemale: 'Mme. {{last_name}}',
      numbers: const ExampleTemplatedNumbers(
        count: 'Il y a {{count:int}} éléments.',
        simple: 'Le prix est de {{price:double}}€',
        formatted: 'Le prix est de {{price:double[compactCurrency]}}',
      ),
      date: const ExampleTemplatedDate(
        simple: 'Aujourd\'hui : {{date:DateTime}}',
        pattern: 'Aujourd\'hui : {{date:DateTime[EEE, M/d/y]}}',
      ),
    ),
    plurals: const ExamplePlurals(
      manZero: 'hommes',
      manOne: 'homme',
      manMultiple: 'hommes',
    ),
  ),
  Locale.fromSubtags(languageCode: 'en', countryCode: 'US'): const Example(
    multiline: '?',
    dates: const ExampleDates(
      weekday: const ExampleDatesWeekday(
        monday: '?',
        tuesday: '?',
        wednesday: '?',
      ),
    ),
    templated: const ExampleTemplated(
      hello: '?',
      contactMale: '?',
      contactFemale: '?',
      numbers: const ExampleTemplatedNumbers(
        count: '?',
        simple: '?',
        formatted: '?',
      ),
      date: const ExampleTemplatedDate(
        simple: '?',
        pattern: '?',
      ),
    ),
    plurals: const ExamplePlurals(
      manZero: '?',
      manOne: '?',
      manMultiple: '?',
    ),
  ),
};

enum Gender {
  male,
  female,
}

enum Plural {
  zero,
  one,
  multiple,
}

class Example {
  const Example({
    required this.multiline,
    required this.dates,
    required this.templated,
    required this.plurals,
  });

  final String multiline;
  final ExampleDates dates;
  final ExampleTemplated templated;
  final ExamplePlurals plurals;
}

class ExampleDates {
  const ExampleDates({
    required this.weekday,
  });

  final ExampleDatesWeekday weekday;
}

class ExampleDatesWeekday {
  const ExampleDatesWeekday({
    required this.monday,
    required this.tuesday,
    required this.wednesday,
  });

  final String monday;
  final String tuesday;
  final String wednesday;
}

class ExampleTemplated {
  const ExampleTemplated({
    required String hello,
    required String contactMale,
    required String contactFemale,
    required this.numbers,
    required this.date,
  })  : _hello = hello,
        _contactMale = contactMale,
        _contactFemale = contactFemale;

  final String _hello;
  final String _contactMale;
  final String _contactFemale;
  final ExampleTemplatedNumbers numbers;
  final ExampleTemplatedDate date;

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

  String contact({
    required Gender gender,
    required String lastName,
    String? locale,
  }) {
    if (gender == Gender.male) {
      return _contactMale.insertTemplateValues(
        {
          'last_name': lastName,
        },
        locale: locale,
      );
    }
    if (gender == Gender.female) {
      return _contactFemale.insertTemplateValues(
        {
          'last_name': lastName,
        },
        locale: locale,
      );
    }
    throw Exception();
  }
}

class ExampleTemplatedNumbers {
  const ExampleTemplatedNumbers({
    required String count,
    required String simple,
    required String formatted,
  })  : _count = count,
        _simple = simple,
        _formatted = formatted;

  final String _count;
  final String _simple;
  final String _formatted;

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
}

class ExampleTemplatedDate {
  const ExampleTemplatedDate({
    required String simple,
    required String pattern,
  })  : _simple = simple,
        _pattern = pattern;

  final String _simple;
  final String _pattern;

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
}

class ExamplePlurals {
  const ExamplePlurals({
    required String manZero,
    required String manOne,
    required String manMultiple,
  })  : _manZero = manZero,
        _manOne = manOne,
        _manMultiple = manMultiple;

  final String _manZero;
  final String _manOne;
  final String _manMultiple;

  String man({
    required Plural plural,
  }) {
    if (plural == Plural.zero) {
      return _manZero;
    }
    if (plural == Plural.one) {
      return _manOne;
    }
    if (plural == Plural.multiple) {
      return _manMultiple;
    }
    throw Exception();
  }
}
