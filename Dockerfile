FROM ubuntu:latest
WORKDIR /app
RUN apt-get update && apt-get install -y python3 python3-pip
COPY requirement.txt .
RUN pip3 install --no-cache-dir -r requirement.txt
COPY requirement.txt .
RUN pip3 install --no-cache-dir -r requirement.txt
COPY app.py /app/
COPY templates/ ./templates
COPY static ./static
EXPOSE 5000
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
CMD ["flask","run"]
