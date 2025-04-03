FROM mongo
ARG MONGO_INITDB_ROOT_USERNAME
ARG MONGO_INITDB_ROOT_PASSWORD
RUN apt update && apt install -y cron
RUN echo "0 */6 * * * mongodump --username ${MONGO_INITDB_ROOT_USERNAME} --password ${MONGO_INITDB_ROOT_PASSWORD} --out /backups/\$(date +\%d-\%m-\%Y.\%H:\%M:\%S)" | crontab