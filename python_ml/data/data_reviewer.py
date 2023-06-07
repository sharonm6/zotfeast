import tkinter as tk
import pandas as pd
import random
from display_sch import create_schedule



# Function to handle button clicks
def button_click(button_num):
    if button_num == 1:
        text_label.config(text="Button 1 clicked!")
    elif button_num == 2:
        text_label.config(text="Button 2 clicked!")


""" current time, 0-32 int
geodist, 0-10 float (miles)
task(cook/buy) 1 bit
task-duration 0-2 float (hr)
"""

def assembleWindow(window):
    create_schedule(df['Schedule'][idx], df['Time'][idx],window)
        
    
    # Create a label to display the text
    text_label = tk.Label(window, text=f"Dist: {df['Distance'][idx]} mile")
    text_label.grid(row=3, column=1)
    text_label = tk.Label(window, text=f"Task: {df['Task'][idx]}")
    text_label.grid(row=3, column=1)

    button1 = tk.Button(window, text="Button 1", command=lambda: button_click(1))
    button1.grid(row=0, column=1)


    button2 = tk.Button(window, text="Button 2", command=lambda: button_click(2))
    button2.grid(row=1, column=1)
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

    # # Data to be stored in the CSV file
    # data = {'Text': [text_label.cget("text")]}

    # # Create a DataFrame from the data
    # df = pd.DataFrame(data)

    # # Save the DataFrame to a CSV file
    # df.to_csv('data.csv', index=False)

        
