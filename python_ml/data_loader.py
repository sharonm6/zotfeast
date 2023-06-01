import datetime
from icalendar import Calendar


def is_day_in_event(event, target_date):
    if event.get("RRULE") is not None:
        recurrence = event.get("RRULE").to_ical().decode()
        if "UNTIL" in recurrence:
            end_date = datetime.datetime.strptime(recurrence.split(";UNTIL=")[1], "%Y%m%dT%H%M%S")
            if target_date > end_date.date():
                return False
        elif "COUNT" in recurrence:
            count = int(recurrence.split(";COUNT=")[1].split(";")[0])
            if count <= 0:
                return False
        elif "FREQ" not in recurrence:
            return False

        if "BYDAY" in recurrence:
            byday = recurrence.split(";BYDAY=")[1].split(",")
            weekdays = {
                "SU": 6,
                "MO": 0,
                "TU": 1,
                "WE": 2,
                "TH": 3,
                "FR": 4,
                "SA": 5
            }
            target_weekday = target_date.weekday()
            if target_weekday not in [weekdays[day] for day in byday]:
                return False

    start_date = event.get("DTSTART").dt.date()
    end_date = event.get("DTEND").dt.date()
    if target_date < start_date or target_date > end_date:
        return False

    if event.get("EXDATE") is not None:
        excluded_dates = event.get("EXDATE")
        if isinstance(excluded_dates, list):
            excluded_dates = [excluded_date.dts[0].dt.date() for excluded_date in excluded_dates]
        else:
            excluded_dates = [excluded_dates.dts[0].dt.date()]
        if target_date in excluded_dates:
            return False

    return True



def generate_encoding(ics_file : str, day : datetime):
    with open(ics_file, "rb") as f:
        cal_data = f.read()
    cal = Calendar.from_ical(cal_data)

    for event in cal.walk("VEVENT"):
        if is_day_in_event(event, day):
            print("hurrah")


        start_date = event.get("DTSTART").dt.date()
        freq = event.get("")
        if start_date == day:
            summary = event.get("SUMMARY")
            start_time = event.get("DTSTART").dt.time()
            end_time = event.get("DTEND").dt.time()
            print(f"Event: {summary}")
            print(f"Start Time: {start_time}")
            print(f"End Time: {end_time}")
            print("---")
    
if __name__ == "__main__":
    for day in range(1, 30):
        generate_encoding("data/schedule.ics", datetime.date(2023, 10, day))