FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt gunicorn

COPY . .

# DB is pre-populated (copied from witness-database)

EXPOSE 8080

CMD ["gunicorn", "--bind", "0.0.0.0:8080", "app.web:app"]
