FROM joshua5201/jenkins-slave-rails
MAINTAINER Tsung-en Hsiao <joshua841025@gmail.com>

RUN apt-get update && apt-get install -y --no-install-recommends postgresql-client postgresql postgresql-contrib libpq-dev
RUN /etc/init.d/postgresql start && sudo -u postgres createuser --createdb -s jenkins

COPY ./start_postgres.sh /home/jenkins/start_postgres.sh
ENTRYPOINT ["/home/jenkins/start_postgres.sh"]

