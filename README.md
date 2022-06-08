## TF Serving With Docker

### Pull TensorFlow Serving Image

```
docker pull tensorflow/serving
```

### Starting container

```
docker run -p 8501:8501 --name tfserving_boston \
--mount type=bind,source=/{path to your directory with saved file}/TF-Docker-Serving/boston_model/,target=/models/boston_model \
-e MODEL_NAME=boston_model -t tensorflow/serving
```

### Single Invocation

```
curl -d '{"instances": [[0.09178, 0.0, 4.05, 0.0, 0.51, 6.416, 84.1, 2.6463, 5.0, 296.0, 16.6, 395.5, 9.04]]}' \
    -X POST http://localhost:8501/v1/models/boston_model:predict
```

### Invoke Shell Script

```
chmod +x predict.sh
./predict.sh data.json application/json
```
