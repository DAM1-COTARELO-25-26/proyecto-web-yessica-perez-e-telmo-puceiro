# Consultas XPath

A continuación 10 consultas XPath con explicación y resultados esperados (basado en `datos/catalogo.xml`).

## Consulta 1
- **Expresión XPath:** `/catalogo/producto/nombre`
- **Qué selecciona:** Selecciona todos los elementos `<nombre>` de los productos.
- **Resultado esperado (ejemplo concreto):** `['Seiko Prestage Cocktail', 'Orient Bambino', 'Oyster Perpetual 41 Pistachio', 'Audemars Piguet', ...]`
- **Contexto de uso:** Listar nombres para un índice o catálogo.

## Consulta 2
- **Expresión XPath:** `/catalogo/producto[@categoria='relojes']`
- **Qué selecciona:** Selecciona productos cuya categoría sea `relojes`.
- **Resultado esperado (ejemplo concreto):** `['R001', 'R002', 'R003', 'R004', 'R005', 'R006']`
- **Contexto de uso:** Filtrar por categoría para mostrar solo relojes.

## Consulta 3
- **Expresión XPath:** `/catalogo/producto[count(especificaciones/*) > 0]`
- **Qué selecciona:** Productos que tienen al menos una especificación.
- **Resultado esperado (ejemplo concreto):** IDs de productos que contienen especificaciones (la mayoría en este XML).
- **Contexto de uso:** Validación/filtrado para mostrar solo productos con ficha técnica.

## Consulta 4
- **Expresión XPath:** `/catalogo/producto/precio`
- **Qué selecciona:** Selecciona todos los elementos `<precio>`.
- **Resultado esperado (ejemplo concreto):** Valores de precio como `['340.00', '265.50', '8350.00', ...]`
- **Contexto de uso:** Cálculos de inventario, sumas, export.

## Consulta 5
- **Expresión XPath:** `sum(/catalogo/producto/precio)`
- **Qué selecciona:** Suma numérica de todos los precios.
- **Resultado esperado (ejemplo concreto):** `35638.0`
- **Contexto de uso:** Total de valor de catálogo.

## Consulta 6
- **Expresión XPath:** `//descripcion[contains(., 'automático')]`
- **Qué selecciona:** Descripciones que contienen la palabra 'automático' (u otra cadena).
- **Resultado esperado (ejemplo concreto):** Productos con descripción que incluye 'automático' → `['R001']`
- **Contexto de uso:** Buscar productos por palabra clave.

## Consulta 7
- **Expresión XPath:** `//producto[@id='R001']`
- **Qué selecciona:** Selecciona el producto con id `R001`.
- **Resultado esperado (ejemplo concreto):** `['Seiko Prestage Cocktail']` (nodo producto correspondiente).
- **Contexto de uso:** Acceso directo a la ficha de un producto por id.

## Consulta 8
- **Expresión XPath:** `//precio/ancestor::producto`
- **Qué selecciona:** El elemento `<producto>` que es ancestro del `<precio>` (navegación por ejes).
- **Resultado esperado (ejemplo concreto):** Lista de productos (todos los productos, cuando se evalúa por cada precio).
- **Contexto de uso:** Relacionar valores calculados con su producto padre.

## Consulta 9
- **Expresión XPath:** `//producto[@categoria='relojes' and precio > 200]`
- **Qué selecciona:** Productos de la categoría `relojes` cuyo precio sea mayor que 200.
- **Resultado esperado (ejemplo concreto):** `['R001','R002','R003', ...]` (IDs que cumplen la condición).
- **Contexto de uso:** Filtrado por múltiples condiciones.

## Consulta 10
- **Expresión XPath:** `/catalogo/producto[position() <= 3]`
- **Qué selecciona:** Los primeros 3 productos según el orden del XML.
- **Resultado esperado (ejemplo concreto):** `['R001','R002','R003']`
- **Contexto de uso:** Mostrar una muestra/paginado o "destacados".