FROM python:3.10-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    git \
    ffmpeg \
    libgl1 \
    libglib2.0-0 \
 && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/Comfy-Org/ComfyUI.git .

RUN pip install --upgrade pip \
 && pip install -r requirements.txt

EXPOSE 8188

CMD ["python", "main.py", "--listen", "0.0.0.0"]
