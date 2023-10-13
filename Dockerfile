FROM ubuntu:latest
MAINTAINER Gia Huy "giahuytrieu3@gmail.com"

# Update the package list and install Python and pip
RUN apt update -y && \
    apt install -y python3 python3-pip python3-dev build-essential

# Set the working directory in the container
WORKDIR /flask_app

# Copy your application files into the container
COPY . /flask_app

# Install or upgrade Flask and Werkzeug using pip
RUN pip3 install --upgrade Flask Werkzeug

# Install your application's Python dependencies from requirements.txt
RUN pip3 install -r requirements.txt

# Define the entry point and command to run your Flask application
ENTRYPOINT ["python3"]
CMD ["flask_docker.py"]

