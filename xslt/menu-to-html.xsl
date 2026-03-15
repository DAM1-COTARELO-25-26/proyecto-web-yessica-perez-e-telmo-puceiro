<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    
    
    <xsl:key name="kCategoria" match="producto" use="@categoria"/>
    
    <xsl:template match="/">
        
        <html lang="es">
            <head>
                <meta charset="utf-8"/>
                <meta name="viewport" content="width=device-width,initial-scale=1"/>
                <title>Menú / Catálogo generado</title>
                
                <link rel="stylesheet" href="/css/style.css"/>
            </head>
            <body>
                <header>
                    <h1>Catálogo generado</h1>
                    <p>Transformación XSLT: /xslt/menu-to-html.xsl</p>
                </header>
                <main>
                    <section id="resumen">
                        <h2>Resumen</h2>
                        <p>Total de productos: <strong><xsl:value-of select="count(/catalogo/producto)"/></strong></p>
                        <p>Precio total (EUR): <strong><xsl:value-of select="format-number(sum(/catalogo/producto/precio),'#,##0.00')"/></strong></p>
                        <p>Precio medio (EUR): <strong>
                                <xsl:variable name="total" select="sum(/catalogo/producto/precio)"/>
                                <xsl:value-of select="format-number($total div count(/catalogo/producto),'#,##0.00')"/>
                            </strong></p>
                    </section>
                    
                    <section id="productos">
                        <h2>Productos</h2>
                        
                        
                        <xsl:for-each select="/catalogo/producto">
                            <xsl:sort select="@categoria" data-type="text" order="ascending"/>
                            <xsl:sort select="number(precio)" data-type="number" order="descending"/>
                            
                            <article>
                                <header>
                                    <h3><xsl:value-of select="nombre"/></h3>
                                    <p class="meta">ID: <xsl:value-of select="@id"/> · Categoría: <xsl:value-of select="@categoria"/></p>
                                </header>
                                
                                <div class="descripcion">
                                    <p><xsl:value-of select="descripcion"/></p>
                                    
                                    <ul>
                                        <xsl:for-each select="especificaciones/*">
                                            <li><xsl:value-of select="name()"/>: <xsl:value-of select="."/></li>
                                        </xsl:for-each>
                                    </ul>
                                </div>
                                
                                <footer>
                                    
                                    <xsl:attribute name="class">
                                        <xsl:text>producto</xsl:text>
                                        <xsl:choose>
                                            <xsl:when test="number(precio) &gt; 200">
                                                <xsl:text> caro</xsl:text>
                                            </xsl:when>
                                            <xsl:when test="number(precio) &gt; 100">
                                                <xsl:text> medio</xsl:text>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:text> economico</xsl:text>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:attribute>
                                    
                                    <p class="precio"><strong><xsl:value-of select="concat(precio,' ', precio/@moneda)"/></strong></p>
                                    <p>Producto #<xsl:value-of select="position()"/></p>
                                </footer>
                            </article>
                            
                        </xsl:for-each>
                    </section>
                    
                    <section id="agrupacion">
                        <h2>Agrupado por categoría (Muenchian)</h2>
                        <xsl:for-each select="/catalogo/producto[generate-id() = generate-id(key('kCategoria', @categoria)[1])]">
                            <h3><xsl:value-of select="@categoria"/></h3>
                            <ul>
                                <xsl:for-each select="key('kCategoria', @categoria)">
                                    <li><xsl:value-of select="concat(nombre,' — ',precio,' ',precio/@moneda)"/></li>
                                </xsl:for-each>
                            </ul>
                        </xsl:for-each>
                    </section>
                    
                </main>
                
                <footer>
                    <p>Generado por XSLT — Fase 4</p>
                </footer>
                
            </body>
        </html>
        
    </xsl:template>
    
    
    <xsl:template match="producto">
        <div class="producto-template">
            <h4><xsl:value-of select="nombre"/></h4>
        </div>
    </xsl:template>
    
</xsl:stylesheet>