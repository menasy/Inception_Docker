# Inception
Docker konteynerleri ile NGINX, WordPress ve MariaDB servislerini içeren bir web altyapısı projesi.

<img src="https://raw.githubusercontent.com/menasy/Project_icons/main/InceptionImages/42ContainerImage.png" alt="42ContainerImage" width="700"/>

> 🚀 **Medium Yazısı:** [Docker / 42 Inception Projesi – Deneyim ve Öğrenim Süreci]()  
> 📄 **Dokümantasyon PDF:** [Docker-Inception.pdf](https://github.com/menasy/Inception_Docker/raw/main/Docker-Inception.pdf)

---

## Proje Hakkında

Bu proje, 42 eğitim programı kapsamında Docker teknolojisini öğrenmek ve birden fazla servisi bir arada çalıştıran güvenli, ölçeklenebilir bir web altyapısı oluşturmak amacıyla geliştirilmiştir. Servisler arasında iletişimi ve veri kalıcılığını Docker'ın sunduğu araçlarla sağlayan bir mimari içerir.

---

## İçerik

<img src="https://raw.githubusercontent.com/menasy/Project_icons/main/InceptionImages/inceptionArtitech.png" alt="inceptionArtitech" width="600"/>

- **NGINX**: Reverse proxy olarak yapılandırılmış, TLS/SSL sertifikaları ile güvenli bağlantı sağlayan web sunucusu  
- **WordPress + PHP-FPM**: UNIX soketleri üzerinden NGINX ile iletişim kuran WordPress kurulumu  
- **MariaDB**: WordPress için gerekli veritabanı sunucusu  
- **Docker Compose**: Tüm servisleri tek bir komutla başlatan yapılandırma

---

## Özellikler

<img src="https://raw.githubusercontent.com/menasy/Project_icons/main/InceptionImages/dockerGlobal.png" alt="dockerGlobal" width="500"/>

- Docker konteynerleştirme teknolojisi  
- Dockerfile yapılandırması ve optimizasyonu  
- HTTPS protokolü ve güvenli iletişim  
- UNIX soketleri ile servisler arası haberleşme  
- Docker volume'lar ile veri kalıcılığı  
- İzole edilmiş Docker ağı

---

## Kurulum

```bash
# Projeyi klonlayın
git clone https://github.com/menasy/Inception_Docker.git
cd Inception_Docker

# Sistemi başlatın
make up
