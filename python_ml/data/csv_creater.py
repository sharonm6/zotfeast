import os
import pandas as pd
import random

def create_fake_schedule():
    # create a list of random 0 or 1 values with 32 elements
    # 0 = no class, 1 = class
    schedule = [random.randint(0, 1) for i in range(32)]
    while sum(schedule) > 16:
        schedule = [random.randint(0, 1) for i in range(32)]
    return schedule

def conv_schedule_to_str(schedule):
    strSch = ""
    for i in range(32):
        strSch += str(schedule[i])
    return strSch

def create_fake_dist():
    # return a random number between 0 and 10 float
    return random.random() * 10

def create_fake_task():
    return random.randint(0, 1) # 0 = no task, 1 = task

def create_fake_duration():
    return random.random() * 2

def create_fake_time():
    return random.randint(0, 31)

def generate_response(schedule, time, dist, task, duration):
    duration /= .5
    dist_time = dist/2 # dist_time = dist * 15 min * 2 = dist * 30 min = dist
    
    if dist > 4:
        return 0
    if schedule[time] == '1':
        return 0
    elif '1' in schedule[time : int(time + duration + dist_time - 0.5)]:
        return 0
    if time > 28 or time < 4:
        return 0
    return 1

def create_fake_data(num):
    df = pd.DataFrame(columns=['Schedule', 'Time', 'Distance', 'Task', 'Duration', 'Response'])
    for i in range(num):
        schedule = create_fake_schedule()
        time = create_fake_time()
        dist = create_fake_dist()
        task = create_fake_task()
        duration = create_fake_duration()
        response = generate_response(schedule, time, dist, task, duration)
        df.loc[i] = [conv_schedule_to_str(schedule), time, dist, task, duration, response]
    return df

def save_data(df, filename, dir='input'):
    if os.path.isdir(dir) == False:
        os.mkdir(dir)
    df.to_csv(f'{dir}/{filename}', index=False)

if  __name__ == "__main__":
    fData = create_fake_data(10000)
    save_data(fData, "input.csv")

    # r = generate_response("0110010110011000100101111110000100", 13, 0.5, 0, 1.5)
    # print(f'response: {r}')
