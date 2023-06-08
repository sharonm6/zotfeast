## Data Format
- Schedule : 32 bits string
    - 0 -> Free
    - 1 -> Busy
- Time : int [0,32)
    - Current Time encoded to 30min intervals from 8am-12am
- Distance : float [0..10]
    - Distance from objective task in miles
- Task : Bit
    - 0 -> Buying Groceries
    - 1 -> Cooking Meal
- Duration : float [0..2]
    - Duration of current task
- Response : bit
    - 0 -> "no, don't send notification"
    - 1 -> "yes, send notification"

<!-- Schedule,Time,Distance,Task,Duration,Response -->