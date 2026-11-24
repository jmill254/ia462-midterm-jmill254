# Stage 1 - Builder
FROM python:3.15-slim@sha256:65a65fc7b30b06cb6df4930fd4650697cb23f4c2698ab81fc87e4b031bc36928 AS builder

WORKDIR /app

COPY requirements.lock ./requirements.txt

RUN pip wheel --no-cache-dir --require-hashes --wheel-dir /wheels -r requirements.txt

# Stage 2 - Runtime
FROM python:3.15-slim@sha256:65a65fc7b30b06cb6df4930fd4650697cb23f4c2698ab81fc87e4b031bc36928

RUN groupadd --system appgroup && \
    useradd --system --gid appgroup --home /app --shell /usr/sbin/nologin appuser

WORKDIR /app

COPY requirements.lock ./requirements.txt
COPY --from=builder /wheels /wheels

RUN pip install --no-cache-dir --no-index --find-links=/wheels --require-hashes -r requirements.txt && \
    rm -rf /wheels

COPY --chown=appuser:appgroup app/ ./app/

ENV PYTHONDONTWRITEBYTECODE=1

USER appuser

EXPOSE 5000

CMD ["python3", "app/app.py"]