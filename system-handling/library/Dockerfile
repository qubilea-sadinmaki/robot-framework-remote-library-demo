FROM python:slim
WORKDIR /opt/rfserver
RUN pip install robotremoteserver 
COPY *.py ./
ENV PYTHONPATH "${PYTHONPATH}:/opt/rfserver"
ENTRYPOINT ["python","main.py"]
