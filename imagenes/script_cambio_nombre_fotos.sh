#!/bin/bash

# --- Script para renombrar fotos secuencialmente ---
# Coloca este script dentro de tu carpeta "imagenes" y ejecútalo desde allí.

COUNT=1
# Busca todos los archivos que terminen en las extensiones de imagen más comunes (insensible a mayúsculas/minúsculas).
# El comando "find" es más seguro que "ls" para nombres de archivo con espacios.
find . -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" -o -iname "*.gif" \) -print0 | while IFS= read -r -d $'\0' file; do
  # Extrae la extensión del archivo original
  EXTENSION="${file##*.}"
  
  # Define el nuevo nombre del archivo
  NEW_NAME="foto${COUNT}.${EXTENSION}"
  
  # Renombra el archivo
  mv -v "$file" "$NEW_NAME"
  
  # Incrementa el contador para la siguiente foto
  COUNT=$((COUNT + 1))
done

echo ""
echo "✅ Proceso completado. Se han renombrado $((COUNT - 1)) fotos."