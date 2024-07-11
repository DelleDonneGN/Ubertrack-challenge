# syntax=docker/dockerfile:1

ARG PYTHON_VERSION=3.8.10
FROM python:${PYTHON_VERSION}-slim as base

ENV PYTHONDONTWRITEBYTECODE=1

ENV PYTHONUNBUFFERED=1

WORKDIR /app

ARG UID=10001
RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "/nonexistent" \
    --shell "/sbin/nologin" \
    --no-create-home \
    --uid "${UID}" \
    appuser

COPY . .
RUN pip install --upgrade pip 
RUN pip install -r requirements.txt --break-system-packages

USER appuser

EXPOSE 8888

CMD ["python", "app.py"]

