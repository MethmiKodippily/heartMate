import pickle


def predict(inputs):
    model = pickle.load(open('pickles/randomForest.pickle', 'rb'))

    # Loading the scaler
    scaler = pickle.load(open('pickles/scaler.pickle', 'rb'))

    parameters = scaler.transform(inputs)

    predict = model.predict(parameters)

    if predict == 0:
        return "Negative"
    else:
        return "Positive"
