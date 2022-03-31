FROM python
WORKDIR /tests_project/
COPY requirements.txt .
RUN pip install -r requirements.txt
ENV ENV=dev
CMD python -m pytest -s --alluredir=test+results/ /tests_project/tests/

'''
DOCKER setup:
docker pull python
docker build -t pytest_runner .
docker run --rm --mount type=bind,src={path to framework},target=/tests_project/ pytest_runner

docker-compose up --build
'''