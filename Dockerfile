FROM postgres:11
ENV POSTGRES_USER orthology_admin
ENV POSTGRES_PASSWORD orthology_admin
ENV POSTGRES_DB orthologydata
ENV PGDATA /usr/local/lib/postgresql/data/pgdata
COPY config /docker-entrypoint-initdb.d/
RUN mkdir -p /usr/local/data && chown -R 999:999 /usr/local/data
