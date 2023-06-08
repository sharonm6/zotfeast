import tkinter as tk


    
if __name__ == "__main__":
        
    # Schedule represented as a string
    schedule = "0110010110011000100101111110000100"

    # Create a Tkinter window
    window = tk.Tk()
    window.title("Schedule Display")


    create_schedule(schedule, 12,window)
    window.mainloop()
