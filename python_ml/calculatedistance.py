import math
def _toRadians(degrees):
    return degrees * (math.pi / 180)

def calculateDistance(latitude: float, longitude: float, task: int):  
    albertons = [33.65027288359544, -117.83136622883586]
    earthRadius = 3958.8

    current_latitude = latitude
    current_longitude = longitude
    a_lat = albertons[0]
    a_long = albertons[1]


    target_Lat = _toRadians(a_lat - current_latitude)
    target_Lon = _toRadians(a_long - current_longitude)

    y = math.sin(target_Lat / 2) * math.sin(target_Lat / 2) + math.cos(_toRadians(current_latitude)) * math.cos(_toRadians(a_lat)) * math.sin(target_Lon / 2) * math.sin(target_Lon / 2)
    z = 2 * math.asin(math.sqrt(y))
    miles = earthRadius * z

    return miles

print(calculateDistance(33.6,-117.84,1))

