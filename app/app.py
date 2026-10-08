import os
import socket

from flask import Flask, jsonify

app = Flask(__name__)

BUSINESS = os.environ.get("BUSINESS", "unknown")
ENVIRONMENT = os.environ.get("ENVIRONMENT", "unknown")


@app.get("/")
def index():
    return jsonify(
        message=f"Hello from business {BUSINESS} ({ENVIRONMENT})",
        pod=socket.gethostname(),
    )


@app.get("/healthz")
def healthz():
    return "ok"


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
