import json
from prediction import predict
import heatmate_db_connector as conn
from flask import Flask, request

app = Flask(__name__)

#route url of the api
@app.route('/')
def about_heartmate():
    print("Hello HeartMate")
    return "Hello HeartMate"

@app.route('/prediction', methods=['POST'])
def return_prediction():
    #dictionary to store the prediction result
    d = {}
    #list to arrange the risk factors
    riskFactors = []
    #Getting the user input data from the requests
    inputs = request.data
    #decoding the sent data
    inputs = json.loads(inputs.decode('utf-8'))
    #accessing the dictionary containing the user input data
    m = inputs['userInfo']
    #Arranging the user input data in the list
    riskFactors.append(int(m['age']))
    riskFactors.append(float(m['sysBP']))
    riskFactors.append(int(m['prevelantHyp']))
    riskFactors.append(float(m['diaBP']))
    riskFactors.append(float(m['glucose']))
    riskFactors.append(int(m['gender']))
    riskFactors.append(int(m['diabetes']))
    riskFactors.append(float(m['totChol']))
    riskFactors.append(float(m['bpMeds']))
    riskFactors.append(float(m['bmi']))

    #Getting the prediction result
    result = predict([riskFactors])
    #storing the test data inside the databse
    conn.add_test(m, result)

    #storing the prediction result in the dictionary
    d['result'] = result
    return d

if __name__ == "__main__":
    app.run()