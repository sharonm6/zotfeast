from flask import Flask, make_response
import datetime


# Initializing flask app
app = Flask(__name__)
 

# @app.route('/lyrics/<trackID>')
# def get_lyrics(trackID):
#     try: 
#         return get_lyrics(trackID)
#     except Exception as e:
#         return "Oops"

# @app.route('/subtitles/<query>')    # QUERY = "SONG-ARTIST"
# def get_lyrics_from_query(query):
#     try: 
#         return get_data3(query)
#     except Exception as e:
#         return "Oops"
    

# Content-Disposition: attachment; filename=calender.ics;
# In your Flask route your code should look something like the following:

@app.route('/calendar/')
def calendar():
    #  Get the calendar data
    _calendar = make_calendar()

    #  turn calendar data into a response
    response = make_response(_calendar)
    response.headers["Content-Disposition"] = "attachment; filename=calendar.ics"
    return response




from get_lyrics import get_lyrics
from spotify_id import search_tracks
from get_data import get_data3

if __name__ == '__main__':
    app.run(debug=True,host='0.0.0.0')
