# استخدام نسخة مستقرة وخفيفة من Ubuntu
FROM ubuntu:22.04

# تثبيت المكتبات الضرورية لتشغيل Godot (Headless)
# هذه المكتبات تمنع أخطاء مثل "libfontconfig.so.1 not found"
RUN apt-get update && apt-get install -y \
    ca-certificates \
    libfontconfig1 \
    libpci-dev \
    libnss3 \
    libasound2 \
    && rm -rf /var/lib/apt/lists/*

# تحديد مجلد العمل داخل الحاوية
WORKDIR /app

# نسخ ملف اللعبة المصدّر (تأكد أن الاسم مطابق لملفك المرفوع)
COPY online.x86_64 /app/online.x86_64

# إعطاء صلاحية التنفيذ للملف
RUN chmod +x /app/online.x86_64

# رندر يستخدم المنفذ 10000 افتراضياً
ENV PORT=10000

# أمر التشغيل: 
# --headless: للعمل بدون واجهة رسومية (ضروري للسيرفر)
# --port: لتحديد المنفذ الذي سيستمع إليه السيرفر
CMD ["./online.x86_64", "--headless", "--", "--port", "10000"]