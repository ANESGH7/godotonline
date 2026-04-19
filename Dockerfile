FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    ca-certificates \
    libfontconfig1 \
    libpci-dev \
    libnss3 \
    libasound2 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# نسخ الملف المرفوع عبر GitHub Desktop
COPY online.x86_64 /app/online.x86_64
RUN chmod +x /app/online.x86_64

# إخبار رندر بالمنفذ
EXPOSE 10000
ENV PORT=10000

# التشغيل التلقائي
CMD ["./online.x86_64", "--headless", "--", "--port", "10000"]
