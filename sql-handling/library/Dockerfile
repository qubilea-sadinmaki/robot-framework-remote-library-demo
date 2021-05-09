FROM python:latest

WORKDIR /opt/rfserver
RUN pip install robotframework-databaselibrary robotremoteserver robotframework pymysql PyMySQL[rsa]
ADD main.py ./
ENTRYPOINT ["python","main.py"]
