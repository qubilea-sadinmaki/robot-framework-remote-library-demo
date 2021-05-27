FROM python:alpine
WORKDIR /opt/rfserver
RUN pip install robotremoteserver robotframework-ftplibrary robotframework 
COPY *.py ./
COPY files files/
RUN mkdir downloads
ENV PYTHONPATH "${PYTHONPATH}:/opt/rfserver"
ENTRYPOINT ["python","main.py"]
