## Steps
To-do: Cleanup

### Starting container
docker run -p 8501:8501 --name tfserving_boston \
--mount type=bind,source=/{path to your directory with saved file}/TF-Docker-Serving/boston/,target=/models/boston \
-e MODEL_NAME=boston -t tensorflow/serving


### Single Invocation
curl -d '{"instances": [[0.09178, 0.0, 4.05, 0.0, 0.51, 6.416, 84.1, 2.6463, 5.0, 296.0, 16.6, 395.5, 9.04]]}' \
    -X POST http://localhost:8501/v1/models/boston:predict
