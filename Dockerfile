FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    ca-certificates \
    gh \
    libreoffice-core \
    libreoffice-writer \
    pandoc \
    texlive-full \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN command -v pdflatex \
    && command -v soffice \
    && command -v pandoc \
    && command -v gh \
    && soffice --headless --version

WORKDIR /workspace

CMD ["bash"]
