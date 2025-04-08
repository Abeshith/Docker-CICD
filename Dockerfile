##stage 1
FROM python:3.9 as builder

WORKDIR /app

COPY . .

RUN pip install flask pytest

RUN pytest

## stage 2
FROM gcr.io/distroless/python3

WORKDIR /app

COPY --from=builder /app /app

EXPOSE 5000

CMD ["app.py"]

