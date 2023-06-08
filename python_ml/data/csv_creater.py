import pandas as pd
import random

def create_fake_schedule():
    # create a list of random 0 or 1 values with 32 elements
    # 0 = no class, 1 = class
    schedule = [random.randint(0, 1) for i in range(32)]
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

def create_fake_data(num):
    df = pd.DataFrame(columns=['Schedule', 'Time', 'Distance', 'Task', 'Duration', 'Response'])
    for i in range(num):
        df.loc[i] = [create_fake_schedule(), create_fake_time(), create_fake_dist(), create_fake_task(), create_fake_duration(), random.randint(0, 1)]
    return df

def save_data(df, filename):
    df.to_csv(filename, index=False)

if  __name__ == "__main__":
    # print("hi")
    fData = create_fake_data(100)
    save_data(fData, "input/input.csv")
