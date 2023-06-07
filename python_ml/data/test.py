import tkinter as tk

# Schedule represented as a string
schedule = "000100100110"

# Create a Tkinter window
window = tk.Tk()
window.title("Schedule Display")

# Create a list to hold the labels
labels = []

# Function to create labels based on the schedule
def create_labels(schedule):
    # Calculate the number of 30-minute intervals (48 intervals from 8am-12am)
    num_intervals = len(schedule)

    # Create labels for each interval
    for i in range(num_intervals):
        # Determine the time based on the index (8am + 30 minutes * index)
        time = f"{8 + i // 2}:{i % 2 * 3}0"

        # Create a label with the time and schedule status
        label = tk.Label(window, text=f"{time} - {'Busy' if schedule[i] == '1' else 'Free'}")

        # Set the foreground color of the label
        if schedule[i] == '1':
            label.config(foreground="red")

        # Use the grid geometry manager to position the label
        label.grid(row=i, column=0, sticky="w")

        # Add the label to the list
        labels.append(label)

# Call the function to create labels
create_labels(schedule)

# Create buttons
button1 = tk.Button(window, text="Button 1")
button1.grid(row=0, column=1, padx=10, pady=10)

button2 = tk.Button(window, text="Button 2")
button2.grid(row=1, column=1, padx=10, pady=10)

# Start the Tkinter event loop
window.mainloop()
