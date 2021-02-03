import numpy as np
import datetime as dt

import sqlalchemy
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy import create_engine, func

from flask import Flask, jsonify

#################################################
# Database Setup
#################################################
engine = create_engine("sqlite:///Resources/hawaii.sqlite")

# reflect an existing database into a new model
Base = automap_base()

# reflect the tables
Base.prepare(engine, reflect=True)

# Save reference to the table
Measurement = Base.classes.measurement

#################################################
# Flask Setup
#################################################
app = Flask(__name__)

#################################################
# Flask Routes
#################################################

@app.route("/")
def welcome():
    """List all available api routes."""
    return (
        f"Available Routes:<br/>"
        f"Measurements: /api/v1.0/measurements<br/>"
        f"/api/v1.0/stations"
    )

@app.route("/api/v1.0/date")
def date():
    # Create our session (link) from Python to the DB
    session = Session(engine)

    """Return a list of all temperature measurements"""
    # Query all dates
    results = session.query(Measurement.date).all()

    session.close()

    # Convert list of tuples into normal list
    all_temperature = list(np.ravel(results))

    return jsonify(all_temperature)

@app.route("/api/v1.0/measurements")
def measurements():
# Create our session (link) from Python to the DB
    session = Session(engine)

"""Return a list of measuement data including the date, temperature, and prcp of each measurement"""
# Query all measurements
results = session.query(Measurement.date, Measurement.tobs, Measurement.prcp).all()

session.close()

# Create a dictionary from the row data and append to a list of all_measuements
all_measurements = []
for date, tobs, prcp in results:
    measurement_dict = {}
    measurement_dict["date"] = name
    measurement_dict["tobs"] = age
    measurement_dict["prcp"] = sex
    all_measurement.append(measurement_dict)

return jsonify(all_measurement)

if __name__ == '__main__':
    app.run(debug=True)