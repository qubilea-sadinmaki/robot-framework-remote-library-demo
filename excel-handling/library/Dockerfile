FROM python:latest

WORKDIR /opt/rfserver
RUN pip install robotframework-excellib robotremoteserver robotframework robotframework-datetime-tz 
ADD * ./
RUN mkdir exeldocs
ENV PYTHONPATH "${PYTHONPATH}:/opt/rfserver"

ENTRYPOINT ["python","main.py"]
