from flask import Flask
from flask import render_template
import dbconnect

app = Flask(__name__)

map_data = dbconnect.get_map()
top10_data = dbconnect.get_top10()
gender_data = dbconnect.get_gender()
continent_data = dbconnect.get_continent()
total_data = dbconnect.get_total()
age_data = dbconnect.get_age()

@app.route('/separate')
def hello_world():
    show_string = "COVID-19 Dashboard <br/>" \
                  "图表细节待优化 <br/>" \
                  "<a href='/map'>map</a> <br/>" \
                  "<a href='/top10'>top10</a> <br/>" \
                  "<a href='/gender'>gender</a> <br/>" \
                  "<a href='/trend/conf'>confirmed trend</a> <br/>" \
                  "<a href='/trend/death'>death trend</a> <br/>" \
                  "<a href='/continent'>continent</a> <br/>" \
                  "<a href='/total'>total</a> <br/>" \
                  "<a href='/age'>age</a>"
    return show_string

@app.route('/map')
def show_map():
    return render_template('world_map_flask_demo.html',map_data = map_data)

@app.route('/top10')
def show_top_10():
    return render_template('top10_flask_demo.html', top10_data = top10_data)

@app.route('/gender')
def show_gender():
    return render_template('gender_flask_demo.html', gender_data = gender_data)

@app.route('/trend/conf')
def show_conf_trend():
    return render_template('trend_conf_flask_demo.html', trend_data = dbconnect.get_trend('new_cases'))

@app.route('/trend/death')
def show_death_trend():
    return render_template('trend_death_flask_demo.html', trend_data = dbconnect.get_trend('new_deaths'))

@app.route('/continent')
def show_continent():
    return render_template('continent_flask_demo.html', continent_data = continent_data)

@app.route('/total')
def show_total():
    return render_template('trend_total_flask_demo.html', total_data = total_data)

@app.route('/age')
def show_age():
    return render_template('age_flask_demo.html', age_data = age_data)

@app.route('/')
def show_index():
    return render_template('index_final.html',
                           map_data=map_data,
                           age_data=age_data,
                           total_data=total_data,
                           continent_data=continent_data,
                           trend_deaths_data=dbconnect.get_trend('new_deaths'),
                           trend_conf_data=dbconnect.get_trend('new_deaths'),
                           gender_data=gender_data,
                           top10_data=top10_data
                           )

if __name__ == '__main__':
    app.run()
