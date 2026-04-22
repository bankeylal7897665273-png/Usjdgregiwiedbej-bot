FROM python:3.9

WORKDIR /code

# 1. Zip file copy karo
COPY code.zip .

# 2. Unzip install karo aur file ko kholo
RUN apt-get update && apt-get install -y unzip
RUN unzip code.zip

# 3. Agar files kisi folder ke andar hain, to unhe bahar nikalo (Flatten)
RUN cp -r */* . 2>/dev/null || :

# 4. Libraries install karo
RUN pip install --no-cache-dir --upgrade -r requirements.txt

# 5. Hugging Face ka Port set karo
ENV PORT=7860

# 6. Bot start karo
CMD ["python", "app.py"]
