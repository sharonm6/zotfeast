import os
import pandas as pd
import random

def create_fake_availaibilities(): # number of events within next 2.5 hrs
    return random.randint(0,5)

def create_fake_dist():
    # return a random number between 0 and 10 float
    return random.random() * 10

def create_fake_task():
    return random.randint(0, 1) # 0 = no task, 1 = task

def create_fake_duration():
    return random.random() * 2

def create_fake_time():
    return random.randint(0, 31)

def generate_response(nEvents, dist, task, duration):
    duration /= 2
    dist_time = dist/2 # dist_time = dist * 15 min * 2 = dist * 30 min = dist
    
    if dist > 4:
        return 0
    if nEvents == 0:
        return 1
    if nEvents + dist_time + duration > 5:
        return 0
    return 1

def create_fake_data(num):
    df = pd.DataFrame(columns=['NumEvents', 'Distance', 'Task', 'Duration', 'Response'])
    for i in range(num):
        nEvents = create_fake_availaibilities()
        dist = create_fake_dist()
        task = create_fake_task()
        duration = create_fake_duration()
        response = generate_response(nEvents, dist, task, duration)
        df.loc[i] = [nEvents, dist, task, duration, response]
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
