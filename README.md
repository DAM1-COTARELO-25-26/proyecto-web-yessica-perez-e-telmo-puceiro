[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/0esC98hF)

# 💎 Catálogo de Complementos

## 🧭 Descripción del proyecto
Este proyecto consiste en un **sitio web tipo catálogo** que presenta diferentes complementos de moda: **relojes, pulseras y anillos**.  
El objetivo es ofrecer una página sencilla, clara y visual donde los usuarios puedan informarse sobre los productos, sus materiales y precios, y contactar para realizar consultas o pedidos.

## 🎯 Público objetivo
El sitio está dirigido a **personas interesadas en la moda y los accesorios**, especialmente jóvenes y adultos que buscan artículos elegantes para informarse o comprar.

## 🎨 Paleta de colores y tipografía
- **Colores:** negro, blanco, dorado  
- **Tipografía:** fuente elegante y legible.  

## 🗂️ Estructura del sitio
El sitio web está formado por **cinco páginas principales**:

1. **index.html** – Página de inicio. Presenta destacados del catálogo, marcas colaboradoras y una breve introducción.
2. **relojes.html** – Catálogo de relojes con nombre, descripción, material y precio.  
3. **pulseras.html** – Catálogo de pulseras con nombre, descripción, material y precio.  
4. **anillos.html** – Catálogo de anillos con nombre, descripción, material y precio.  
5. **contacto.html** – Página de contacto con formulario para consultas o pedidos.  

## 📊 Estructura de Datos XML

### Descripción
Este proyecto utiliza XML para estructurar el catálogo completo de productos (relojes, pulseras y anillos) de la tienda TELSIC, permitiendo una gestión organizada de especificaciones, precios y disponibilidad.

### Archivos
**`/datos/catalogo.xml`**: Contiene la base de datos con 18 productos y sus detalles técnicos.
**`/datos/catalogo.dtd`**: Validador DTD externo que asegura la estructura y jerarquía de los elementos.
**`/datos/catalogo.xsd`**: Schema XSD que aplica restricciones avanzadas de tipos de datos y patrones.

### Estructura principal
El árbol XML se organiza en una jerarquía de 3 niveles de profundidad:
1. **Nivel 1 (Raíz):** `<catalogo>`, que actúa como el contenedor global de todos los productos.
2. **Nivel 2 (Entidad):** `<producto>`, que utiliza atributos como `id` (identificador único) y `categoria` (metadato de clasificación).
3. **Nivel 3 (Detalles):** Elementos que contienen la información específica: `<nombre>`, `<descripcion>`, `<especificaciones>`, `<precio>`, `<fechaRegistro>` y `<disponible>`.

### Validación
El catálogo ha sido validado satisfactoriamente sin errores. 
👉 **[/datos/validacion.md](./datos/validacion.md)**.

## 👥 Autores del grupo
**Yessica Pérez López y Telmo Puceiro Romero**  
**Asignatura:** Lenguajes de Marcas  
**Entrega:** 3 –  Datos estructurados con XML
## Fase 4 - Transformación XSLT y consultas XPath

Archivos añadidos / modificados:
- `/xslt/menu-to-html.xsl` — Hoja de transformación XSLT (XSLT 1.0 compatible).
- `/datos/menu.xml` — Copia del `catalogo.xml` usada como fuente.
- `/menu.html` — HTML5 generado por la transformación XSLT.
- `/datos/consultas-xpath.md` — 10 consultas XPath documentadas.
- `/img/menu-generado.png` y `/img/xpath-testing.png` —.

Cómo ejecutar la transformación:

1. **Desde un navegador**:
   `<?xml-stylesheet type="text/xsl" href="/xslt/menu-to-html.xsl"?>`


2. **Usando xsltproc (línea de comandos)**:
   ```bash
   xsltproc xslt/menu-to-html.xsl datos/menu.xml > menu.html