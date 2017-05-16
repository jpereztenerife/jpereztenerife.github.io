<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:strip-space elements="*"/>
  <xsl:output method="xml"
      doctype-public="-//W3C//DTD XHTML 1.1.//EN"
      doctype-system="http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd"
  />
  
  <!--Especificamos el nodo desde el que trabajaremos-->
  <xsl:template match="/notas">
    
    <!--Generamos el documento xhtml a partir de los datos de ese nodo y herederos-->
    <html lang="es">
      <head>
        <meta charset="UTF-8" />
        <title>Ejercicio 5: XHTML generado por XSLT</title>
        <style type="text/css">
          body {
            background-color:	#aed7d9;
          }
          table {
            border: 1px solid black;
            width: 97%;
            border-radius: 3px;
            background-color: #c9dfe0;
          }
          table th {
          background-color:	#B2886B;
          font-weight: 700;
          column-span: 3;
          }
          .subhead {
            background-color:	#FFE0CC;
            font-weight: 600;
          }
          table tr {
            border: 1px solid black;
          }
          table th, .subhead, .notas {
            text-align: center;
          }
          
        </style>
      </head>
      
      <body>
        <h1>Calificaciones de la convocatoria de Junio</h1>
        <br />
        <table align="center">
          <tr>
            <th colspan="3">DATOS</th>
            <th colspan="3">NOTAS</th>
          </tr>
          <tr class="subhead">
            <td>Nombre</td>
            <td>Apellidos</td>
            <td>Tareas</td>
            <td>Cuestionarios</td>
            <td>Examen</td>
            <td>Final</td>
          </tr>

          <!--Hacemos búsqueda de todos los elementos alumno-->
          <xsl:for-each select="/notas/alumno">
            <!--mostraremos sólo aquellos con convocatoria en Julio-->
            <xsl:if test="@convocatoria='Junio'">
              <tr>
                <!--Vamos mostrando los datos del alumno actual-->
                <td>
                  <xsl:value-of select ="nombre" />
                </td>
                <td>
                  <xsl:value-of select ="apellidos" />
                </td>
                <td class="notas">
                  <xsl:value-of select ="tareas" />
                </td>
                <td class="notas">
                  <xsl:value-of select ="cuestionarios" />
                </td>
                <td class="notas">
                  <xsl:value-of select ="examen" />
                </td>
                <td class="notas">
                  <!--Usamos condicionales para mostrar una nota u otra-->
                  <xsl:choose>
                    <xsl:when test="final&gt;=9">
                      SOBRESALIENTE
                    </xsl:when>
                    <xsl:when test="final&lt;9 and final&gt;=7">
                      NOTABLE
                    </xsl:when>
                    <xsl:when test="final&lt;7 and final&gt;=6">
                      BIEN
                    </xsl:when>
                    <xsl:when test="final&lt;6 and final&gt;=5">
                      SUFICIENTE
                    </xsl:when>
                    <xsl:otherwise>
											INSUFICIENTE
										</xsl:otherwise>
									</xsl:choose>
                </td>
              </tr>
            </xsl:if>
					</xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>



