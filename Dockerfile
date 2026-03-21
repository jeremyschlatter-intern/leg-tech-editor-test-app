FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt gunicorn

COPY . .

# Collect data on build so the DB is ready
RUN python scripts/collect_data.py || true

EXPOSE 8080

CMD ["gunicorn", "--bind", "0.0.0.0:8080", "app.web:app"]
