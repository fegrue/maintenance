#!/bin/bash

# Skript, um rekursiv alle Dateien im Repository ausführbar zu machen

echo "Mache alle Dateien im Repository ausführbar..."

find . -type f -exec chmod +x {} \;

echo "Fertig. Alle Dateien sind nun ausführbar."