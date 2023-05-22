FROM golang:alpine
RUN go install github.com/rverton/webanalyze/cmd/webanalyze@latest
WORKDIR /app
RUN mkdir -p /app/log 
ENV host_name https://www.happiestminds.com/
RUN ["webanalyze", "-update"]
ENTRYPOINT ["sh", "-c", "webanalyze -host ${host_name} >> /app/log/logFile.log && tail -f /dev/null"]