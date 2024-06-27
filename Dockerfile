FROM python:3.9-buster

WORKDIR /app

# Install OpenGL dependencies
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev \
    libgl1-mesa-dev \
    libglu1-mesa-dev

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY screenshot.py .

CMD ["python", "screenshot.py"]
