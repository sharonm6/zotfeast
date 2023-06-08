import tkinter as tk
import pandas as pd
import random
# from display_sch import create_schedule


# Function to create labels based on the schedule
def create_schedule(schedule, inTime, windowA):
    labels = []

    for i in range(len(schedule)):
        time = f"{(8 + i // 2)% 12}:{i % 2 * 3}0"
        label = tk.Label(windowA, text=f"{time} - {'Busy' if schedule[i] == '1' else 'Free'}")
        if schedule[i] == '1':
            label.config(foreground="red")
        if i == inTime:
            label.config(foreground="green")
        if i == inTime and schedule[i] == '1':
            label.config(foreground="purple")

        label.grid(row=i, column=0, sticky="w")
        labels.append(label)
    return labels

def create_dist(dist, windowA):
    dist = round(dist, 2)
    text_label = tk.Label(windowA, text=f"Dist: {dist} mile")
    text_label.grid(row=3, column=1)
    return text_label

def create_task(task, windowA):
    out = "Cook" if task == '1' else "Buy"
    text_label = tk.Label(windowA, text=f"Task: {out}")
    text_label.grid(row=4, column=1)
    return text_label

def create_duration(dur, windowA):
    # out = "Cook" if task == '1' else "Buy"
    dur = round(dur*60, 2)
    text_label = tk.Label(windowA, text=f"Duration: {dur} minutes")
    text_label.grid(row=5, column=1)
    return text_label

def buttonClicked(ans,window):
    # write ans to df (response)
    
    global idx
    df.loc[idx, ('Response')] = ans
    idx += 1
    for widget in window.winfo_children():
        widget.destroy()
    # window.destroy()
    assembleWindow(window)
    pass



# # Function to handle button clicks
# def button_click(button_num):
#     if button_num == 1:
#         text_label.config(text="Button 1 clicked!")
#     elif button_num == 2:
#         text_label.config(text="Button 2 clicked!")


""" current time, 0-32 int
geodist, 0-10 float (miles)
task(cook/buy) 1 bit
task-duration 0-2 float (hr)
"""

def assembleWindow(window):
    create_schedule(df['Schedule'][idx], df['Time'][idx],window)
    create_dist(df['Distance'][idx],window)
    create_task(df['Task'][idx],window)
    create_duration(df['Duration'][idx],window)
    
    buttonY = tk.Button(window, text="Yes", command=lambda: buttonClicked(1,window))
    buttonY.grid(row=0, column=1)

    buttonN = tk.Button(window, text="No", command=lambda: buttonClicked(0,window))
    buttonN.grid(row=1, column=1)
    pass


if __name__ == "__main__":
    # import csv data from input/input.csv
    df = pd.read_csv("input/input.csv")
    idx = 0

        
    # Create a Tkinter window
    window = tk.Tk()
    window.title("Sample Data Reviewer")

    assembleWindow(window)
    window.mainloop()
    df.to_csv("input/input.csv", index=False)

    # # Data to be stored in the CSV file
    # data = {'Text': [text_label.cget("text")]}

    # # Create a DataFrame from the data
    # df = pd.DataFrame(data)

    # # Save the DataFrame to a CSV file
    # df.to_csv('data.csv', index=False)

        
