FROM ubuntu:latest
LABEL maintainer="0x4f@tuta.io"
LABEL name="openTransmit"
# working dir within docker image
WORKDIR /usr/src/app
# copy all files to docker image
COPY . .
# Update the image to the latest packages and download dependencies
RUN apt update && apt upgrade -y
RUN apt install git -y
RUN apt install python -y
RUN apt install python3-pip -y
RUN apt install samba -y
RUN apt install samba-common -y
# Install Python QR Code dependency via pip
RUN yes | pip install -r requirements.txt
# Expose port for SMB over NetBIOS 
# Expose port for SMB over TCP
EXPOSE 139
EXPOSE 445
# Run opentransmit
CMD ["opentransmit.py"]
ENTRYPOINT ["python"]