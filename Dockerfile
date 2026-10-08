# Old base image + old dependencies are intentional: this is a demo for vulnerability scanning.
FROM python:3.9-slim-bullseye

WORKDIR /app
COPY app/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY app/app.py .

RUN useradd -u 10001 -m appuser
USER 10001
ENV BUSINESS=b
EXPOSE 8080
CMD ["python", "app.py"]
