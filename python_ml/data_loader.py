import datetime
from icalendar import Calendar

def is_day_in_event(event, target_date: datetime):
    start_date = event.get("DTSTART").dt.date()
    if target_date < start_date:
        return False

    end_date = event.get("DTEND").dt.date()

    if event.get("RRULE") is not None:
        recurrence = event.get("RRULE").to_ical().decode()

        if "UNTIL" in recurrence:
            until = datetime.datetime.strptime(recurrence.split(";UNTIL=")[1], "%Y%m%dT%H%M%S")
            if target_date > until.date():
                return False

        elif "COUNT" in recurrence:
            count = int(recurrence.split(";COUNT=")[1].split(";")[0])
            if count <= 0:
                return False
            
            if ";FREQ=" in recurrence:
                freq = recurrence.split(";FREQ=")[1].split(";")[0]
            elif "FREQ" in recurrence:
                freq = recurrence.split("FREQ=")[1].split(";")[0]
            else:
                return False
            
            if freq == "DAILY":
                if target_date > end_date:
                    return False

            elif freq == "WEEKLY":
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
                else:
                    if target_date.weekday() != start_date.weekday():
                        return False

            elif freq == "MONTHLY":
                if target_date.day != start_date.day:
                    return False

            elif freq == "YEARLY":
                if target_date.month != start_date.month or target_date.day != start_date.day:
                    return False

            if freq == "DAILY":
                num_occurrences = (target_date - start_date).days + 1
            elif freq == "WEEKLY":
                num_occurrences = (target_date - start_date).days // 7 + 1
            elif freq == "MONTHLY":
                num_occurrences = (target_date.year - start_date.year) * 12 + (target_date.month - start_date.month) + 1
            elif freq == "YEARLY":
                num_occurrences = target_date.year - start_date.year + 1

            if num_occurrences > count:
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

def get_day_interval_encoding(event, interval_encoding: list[int]):
    start_time = event.get("DTSTART").dt.time()
    end_time = event.get("DTEND").dt.time()

    start_minutes = start_time.hour * 60 + start_time.minute
    end_minutes = end_time.hour * 60 + end_time.minute

    for i in range(start_minutes // 30, end_minutes // 30 + 1):
        interval_encoding[i] = 1

    return interval_encoding

def generate_encoding(ics_file : str, day : datetime):
    with open(ics_file, "rb") as f:
        cal_data = f.read()
    cal = Calendar.from_ical(cal_data)

    interval_encoding = [0] * 48

    for event in cal.walk("VEVENT"):
        if is_day_in_event(event, day):
            print(event.get("SUMMARY"))
            interval_encoding = get_day_interval_encoding(event, interval_encoding)

    print('Final interval encoding:', interval_encoding)

    return 'DONE'
    
if __name__ == "__main__":
    # with open('data/schedule_s.ics', "rb") as f:
    #     cal_data = f.read()
    # cal = Calendar.from_ical(cal_data)

    # event = cal.walk("VEVENT")[0]

    # res = is_day_in_event(event, datetime.date(2023, 9, 28))
    # print('RES', res)

    # print(generate_encoding("data/schedule_s.ics", datetime.date(2023, 9, 25)))
    print(generate_encoding("data/schedule_s.ics", datetime.date(2023, 10, 3)))