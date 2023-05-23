// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localizations.dart';

// **************************************************************************
// SheetLocalizationGenerator
// **************************************************************************

final localizedLabels = <Locale, AppLocalizationsData>{
  Locale.fromSubtags(languageCode: 'fr'): const AppLocalizationsData(
    multiline: 'C\'est\n\nun\n\nExemple multiligne.',
    plurals: const AppLocalizationsDataPlurals(
      manMultiple: 'hommes',
      manOne: 'homme',
      manZero: 'hommes',
    ),
    templated: const AppLocalizationsDataTemplated(
      contactFemale: 'Mme {{last_name}}',
      contactMale: 'M. {{last_name}}',
      hello: 'Bonjour {{first_name}}!',
      date: const AppLocalizationsDataTemplatedDate(
        pattern: 'Aujourd\'hui : {{date:DateTime[EEE, M/d/y]}}',
        simple: 'Aujourd\'hui : {{date:DateTime}}',
      ),
      numbers: const AppLocalizationsDataTemplatedNumbers(
        formatted: 'Le prix est de {{price:double[compactCurrency]}}',
        simple: 'Le prix est de {{price:double}}€',
        count: 'Il y a {{count:int}} éléments.',
      ),
    ),
    dates: const AppLocalizationsDataDates(
      month: const AppLocalizationsDataDatesMonth(
        april: 'avril',
        march: 'février',
        february: 'février',
        january: 'Janvier',
      ),
      weekday: const AppLocalizationsDataDatesWeekday(
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
  Locale.fromSubtags(languageCode: 'en'): const AppLocalizationsData(
    multiline: 'This is\n\na\n\nmultiline example.',
    plurals: const AppLocalizationsDataPlurals(
      manMultiple: 'men',
      manOne: 'man',
      manZero: 'man',
    ),
    templated: const AppLocalizationsDataTemplated(
      contactFemale: 'Mrs {{last_name}}!',
      contactMale: 'Mr {{last_name}}!',
      hello: 'Hello {{first_name}}!',
      date: const AppLocalizationsDataTemplatedDate(
        pattern: 'Today : {{date:DateTime[EEE, M/d/y]}}',
        simple: 'Today : {{date:DateTime}}',
      ),
      numbers: const AppLocalizationsDataTemplatedNumbers(
        formatted: 'The price is {{price:double[compactCurrency]}}',
        simple: 'The price is {{price:double}}\$',
        count: 'There are {{count:int}}\ items.',
      ),
    ),
    dates: const AppLocalizationsDataDates(
      month: const AppLocalizationsDataDatesMonth(
        april: 'april',
        march: 'march',
        february: 'february',
        january: 'january',
      ),
      weekday: const AppLocalizationsDataDatesWeekday(
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
      const AppLocalizationsData(
    multiline: '这是\n\nA\n\n多行示例。',
    plurals: const AppLocalizationsDataPlurals(
      manMultiple: '男人',
      manOne: '男人',
      manZero: '男人',
    ),
    templated: const AppLocalizationsDataTemplated(
      contactFemale: '夫人{{last_name}}',
      contactMale: '先生{{last_name}}',
      hello: '你好{{first_name}}!',
      date: const AppLocalizationsDataTemplatedDate(
        pattern: '今日 : {{date:DateTime[EEE, M/d/y]}}',
        simple: '今日 : {{date:DateTime}}',
      ),
      numbers: const AppLocalizationsDataTemplatedNumbers(
        formatted: '価格は{{price:double[compactCurrency]}}です',
        simple: '価格は{{price:double}}¥です',
        count: '{{count:int}}個のアイテムがあります',
      ),
    ),
    dates: const AppLocalizationsDataDates(
      month: const AppLocalizationsDataDatesMonth(
        april: '四月',
        march: '游行',
        february: '二月',
        january: '一月',
      ),
      weekday: const AppLocalizationsDataDatesWeekday(
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

class AppLocalizationsData {
  const AppLocalizationsData({
    required this.multiline,
    required this.plurals,
    required this.templated,
    required this.dates,
  });

  final String multiline;
  final AppLocalizationsDataPlurals plurals;
  final AppLocalizationsDataTemplated templated;
  final AppLocalizationsDataDates dates;
}

class AppLocalizationsDataPlurals {
  const AppLocalizationsDataPlurals({
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

class AppLocalizationsDataTemplated {
  const AppLocalizationsDataTemplated({
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
  final AppLocalizationsDataTemplatedDate date;
  final AppLocalizationsDataTemplatedNumbers numbers;

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

class AppLocalizationsDataTemplatedDate {
  const AppLocalizationsDataTemplatedDate({
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

class AppLocalizationsDataTemplatedNumbers {
  const AppLocalizationsDataTemplatedNumbers({
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

class AppLocalizationsDataDates {
  const AppLocalizationsDataDates({
    required this.month,
    required this.weekday,
  });

  final AppLocalizationsDataDatesMonth month;
  final AppLocalizationsDataDatesWeekday weekday;
}

class AppLocalizationsDataDatesMonth {
  const AppLocalizationsDataDatesMonth({
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

class AppLocalizationsDataDatesWeekday {
  const AppLocalizationsDataDatesWeekday({
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
