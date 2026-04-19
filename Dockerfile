FROM ubuntu:22.04

# تثبيت المكتبات اللازمة لتشغيل جودو على لينكس
RUN apt-get update && apt-get install -y \
    ca-certificates \
    libfontconfig1 \
    libpci-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# نسخ ملف الخادم
COPY server.x86_64 /app/server.x86_64
RUN chmod +x /app/server.x86_64

# رندر يمرر المنفذ عبر متغير بيئة يسمى PORT
ENV PORT=10000

# تشغيل الخادم في وضع headless
CMD ["./server.x86_64", "--headless", "--", "--port", "10000"]