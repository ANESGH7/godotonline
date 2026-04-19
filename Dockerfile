FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    ca-certificates \
    libfontconfig1 \
    libpci-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# تأكد أن الاسم هنا يطابق الملف الموجود في GitHub تماماً
COPY online.sh /app/server.x86_64
RUN chmod +x /app/server.x86_64

ENV PORT=10000

# تشغيل الملف
CMD ["./server.x86_64", "--headless", "--", "--port", "10000"]
