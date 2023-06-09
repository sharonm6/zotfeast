import math

def calculateDistance(longitude: float, latitude: float, task: int):
    random_location = [37.7,-122.40] # x1,x2    
    albertons = [33.650,-117.83139] # y1,y2

    x1 = random_location[0]
    x2 = random_location[1]
    y1 = albertons[0]
    y2 = albertons[1]

    distance = math.sqrt(((x2-x1)**2 + (y2-y1)**2))
    
    return distance

