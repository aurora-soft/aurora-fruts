import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:aurora_fruts/ui/templates/section_base.dart' as baseTemplate;
import 'package:aurora_fruts/data/example/events_example.dart' as eventsExample;

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
    _events = eventsExample.events;
    _selectedEvents = _events[_selectedDay] ?? [];
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return baseTemplate.SectionBase(
      title: 'Mi',
      subtitle: 'Calendario',
      body: Column(
        children: <Widget>[
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
                  bottom: 0,
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
          margin: EdgeInsets.only(left: 1.0),
          width: 5,
          height: 5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.black54,
          ),
        ));
      }
      return Container(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: l),
      );
    }
  }

  Widget _buildEventList() {
    return Container(
      child: ListView(
        shrinkWrap: true,
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
    setState(() {
      _selectedEvents = events;
    });
  }
}
