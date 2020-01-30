final _selectedDay = DateTime.now();
Map<DateTime, List> events={
      _selectedDay.subtract(Duration(days: 30)): [
        'Ensalada de Frutas',
        'Paquete de Almendras',
        'Manzanas Deshidratadas'
      ],
      _selectedDay.subtract(Duration(days: 19)): [
        'Ciruelas Frescas',
      ],
      _selectedDay.subtract(Duration(days: 18)): [
        'Zumo de Zanahoria',
        'Sandwich de Palta',
      ],
      _selectedDay.subtract(Duration(days: 11)): [
        'Zumo de Naranja',
        'Sandwich de atún',
      ],
      _selectedDay.subtract(Duration(days: 10)): [
        'Zumo de Manzana',
        'Galletas de Avena',
      ],
      _selectedDay.subtract(Duration(days: 3)): [
        'Zumo de Frutos Rojos',
        'Galletas de Avena',
      ],
      _selectedDay.subtract(Duration(days: 2)): [
        'Zumo de Piña',
      ],
      _selectedDay: [
        'Ensalada de frutas',
      ],
      _selectedDay.add(Duration(days: 1)): [
        'Zumo de Zanahoria',
        'Sandwich de Palta',
      ],
      _selectedDay.add(Duration(days: 2)): Set.from([
        'Ensalada de Frutas',
        'Paquete de Almendras',
        'Manzanas Deshidratadas'
      ]).toList(),
      _selectedDay.add(Duration(days: 7)): [
        'Zumo de Manzana',
        'Galletas de Avena',
      ],
      _selectedDay.add(Duration(days: 8)): [
        'Zumo de Manzana',
        'Galletas de Avena',
      ],
      _selectedDay.add(Duration(days: 15)): [
        'Zumo de Manzana',
        'Galletas de Avena',
      ],
      _selectedDay.add(Duration(days: 16)): [
        'Zumo de Manzana',
        'Galletas de Avena',
      ],
      _selectedDay.add(Duration(days: 20)): [
        'Zumo de Manzana',
        'Galletas de Avena',
      ],
    };