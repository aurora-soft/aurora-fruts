import 'package:flutter/material.dart';

import '../../common_widgets/titlesBar.dart';
import 'package:table_calendar/table_calendar.dart';

class SchedulePage extends StatefulWidget {
  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  CalendarController _calendarController;
  Map<DateTime, List> _events;
  List _selectedEvents;

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
    final _selectedDay = DateTime.now();

    _events = {
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

    _selectedEvents = _events[_selectedDay] ?? [];
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
          right: 16.0,
          left: 16.0,
          top: MediaQuery.of(context).padding.top + 24.0),
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back_ios),
                color: Colors.black,
              ),
              SizedBox(width: 8.0),
              TitlesBar(h1: 'Mi', h2: 'Calendario'),
            ],
          ),
          _listSchedule(context),
          Expanded(child: _buildEventList())
        ],
      ),
    );
  }

  Widget _listSchedule(BuildContext context) {
    return TableCalendar(
        calendarController: _calendarController,
        events: _events,
        onDaySelected: _onDaySelected,
        builders: CalendarBuilders(
          markersBuilder: (context, date, events, holidays) {
            final children = <Widget>[];

            if (events.isNotEmpty) {
              children.add(
                Positioned(
                  left: 2,
                  bottom: 2,
                  child: _buildEventsMarker(date, events),
                ),
              );
            }
            return children;
          },
        ));
  }

  Widget _buildEventsMarker(DateTime date, List events) {
    List<Widget> l = [];

    if (events.isNotEmpty) {
      for (var item in events) {
        l.add(Container(
          width: 6,
          height: 6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.black54,
          ),
        ));
      }

      return Container(
        child: Row(children: l),
      );
    }
  }

  Widget _buildEventList() {
    return Container(
      child: ListView(
        children: _selectedEvents
            .map((event) => Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.8),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  margin: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  child: ListTile(
                    title: Text(event.toString()),
                    subtitle: Text('Hora de entrega: 09:00 A.M.'),
                    onTap: () => print('$event tapped!'),
                  ),
                ))
            .toList(),
      ),
    );
  }

  void _onDaySelected(DateTime day, List events) {
    print('CALLBACK: _onDaySelected');
    setState(() {
      _selectedEvents = events;
    });
  }
}
