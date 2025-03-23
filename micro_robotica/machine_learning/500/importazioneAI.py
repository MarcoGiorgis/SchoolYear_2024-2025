import joblib
model = joblib.load("./my_mlp.joblib")
leModel = joblib.load("./leModel.joblib")
leTransmission = joblib.load("./leTransmission.joblib")

macchinaTest=[[30, 15, 205, 3700]]
print(model.predict(macchinaTest))