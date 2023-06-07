import tkinter as tk


# Function to create labels based on the schedule
def create_schedule(schedule, inTime, windowA):
    labels = []

    # Create labels for each interval
    for i in range(len(schedule)):
        # Determine the time based on the index (8am + 30 minutes * index)
        time = f"{(8 + i // 2)% 12}:{i % 2 * 3}0"

        # Create a label with the time and schedule status
        label = tk.Label(windowA, text=f"{time} - {'Busy' if schedule[i] == '1' else 'Free'}")
        
        if schedule[i] == '1':
            label.config(foreground="red")
        if i == inTime:
            label.config(foreground="green")
        if i == inTime and schedule[i] == '1':
            label.config(foreground="purple")

        # Use the grid geometry manager to position the label
        label.grid(row=i, column=0, sticky="w")
        labels.append(label)
    return labels
    
if __name__ == "__main__":
        
    # Schedule represented as a string
    schedule = "0110010110011000100101111110000100"

    # Create a Tkinter window
    window = tk.Tk()
    window.title("Schedule Display")


    create_schedule(schedule, 12,window)
    window.mainloop()
