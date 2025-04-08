## Stage 1: Build
FROM python:3.9 AS builder

WORKDIR /app

COPY . .

# Install dependencies into a target directory we'll copy later
RUN pip install --upgrade pip
RUN pip install --prefix=/install flask pytest

# Optional: Run tests
RUN pytest

## Stage 2: Distroless
FROM gcr.io/distroless/python3

WORKDIR /app

# Copy installed dependencies
COPY --from=builder /install /usr/local

# Copy application code
COPY --from=builder /app /app

EXPOSE 5000

CMD ["app.py"]
