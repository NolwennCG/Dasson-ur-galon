<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="form fo svg text style office" version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0"
    xmlns:style="urn:oasis:names:tc:opendocument:xmlns:style:1.0"
    xmlns:table="urn:oasis:names:tc:opendocument:xmlns:table:1.0"
    xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0"
    xmlns:svg="urn:oasis:names:tc:opendocument:xmlns:svg-compatible:1.0"
    xmlns:fo="urn:oasis:names:tc:opendocument:xmlns:xsl-fo-compatible:1.0"
    xmlns:form="urn:oasis:names:tc:opendocument:xmlns:form:1.0"
    xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:xlink="http://www.w3.org/1999/xlink">
    
    <!-- Pour BIBLIOGRAPHIE. Traitement bibliographie à partir de OpenOffice, Nolwenn CHEVALIER, 2019 -->

    <xsl:strip-space elements="*"/>

    <xsl:template match="/">
        <body>
            <xsl:apply-templates/>
        </body>
    </xsl:template>

    <xsl:template match="text:bibliography-mark">
        <xsl:variable name="type" select="@text:bibliography-type"/>
        <xsl:variable name="text" select="text()"/>
        <xsl:variable name="longueur" select="(string-length($text))-2"/>
        <xsl:element name="bibliography-mark">
                <xsl:choose>
                    <!--non publié-->
                    <xsl:when test="$type = 'unpublished'">
                        <xsl:if test="@text:author"><author><xsl:value-of select="@text:author"/></author>
                            <xsl:text>, </xsl:text></xsl:if>
                        <xsl:if test="@text:title"><title><xsl:value-of select="@text:title"/></title>
                            <xsl:text>, </xsl:text></xsl:if>
                        <xsl:if test="@text:year"><year><xsl:value-of select="@text:year"/></year>
                            <xsl:text>, </xsl:text></xsl:if>
                        <xsl:if test="@text:pages"><pages><xsl:value-of select="@text:pages"/></pages><xsl:text> p.</xsl:text></xsl:if>
                        <xsl:text>. 
</xsl:text>
                    </xsl:when>
                    <!--livre-->
                    <xsl:when test="$type = 'book'">
                        <xsl:if test="@text:author"><author><xsl:value-of select="@text:author"/></author>
                            <xsl:text>, </xsl:text></xsl:if>
                        <xsl:if test="@text:title"><title><xsl:value-of select="@text:title"/></title>
                            <xsl:text>, </xsl:text></xsl:if>
                        <xsl:if test="@text:edition"><xsl:text>vol </xsl:text><edition><xsl:value-of select="@text:edition"/></edition>
                            <xsl:text>, </xsl:text></xsl:if>
                        <xsl:if test="@text:address"><address><xsl:value-of select="@text:address"/></address>
                            <xsl:text>, </xsl:text></xsl:if>
                        <xsl:if test="@text:publisher"><publisher><xsl:value-of select="@text:publisher"/></publisher>
                            <xsl:text>, </xsl:text></xsl:if>
                        <xsl:if test="@text:year"><year><xsl:value-of select="@text:year"/></year>
                            <xsl:text>, </xsl:text></xsl:if>
                        <xsl:if test="@text:pages"><pages><xsl:value-of select="@text:pages"/></pages><xsl:text> p.</xsl:text></xsl:if>
                        <xsl:text>. 
</xsl:text>
                    </xsl:when>
                    <!--www-->
                    <xsl:when test="$type = 'www'">
                        <xsl:if test="@text:publisher"><publisher><xsl:value-of select="@text:publisher"/></publisher>
                            <xsl:text>, </xsl:text></xsl:if>
                        <xsl:if test="@text:title"><title><xsl:value-of select="@text:title"/></title>
                            <xsl:text>, </xsl:text></xsl:if>
                        <xsl:if test="@text:year"><year><xsl:value-of select="@text:year"/></year></xsl:if>
                        <xsl:text>. </xsl:text>
                        <xsl:if test="@text:url"><xsl:text>Disponible sur : &lt;</xsl:text><a><xsl:value-of select="@text:url"/></a><xsl:text>&gt;</xsl:text><xsl:text>.</xsl:text></xsl:if>
                        <xsl:text>
</xsl:text>
                    </xsl:when>
                    <!--magazine-->
                    <xsl:when test="$type = 'journal'">
                        <xsl:if test="@text:author"><author><xsl:value-of select="@text:author"/></author>
                            <xsl:text>, </xsl:text></xsl:if>
                        <xsl:if test="@text:title"><article><xsl:text>« </xsl:text><xsl:value-of select="@text:title"/><xsl:text> »</xsl:text></article>
                            <xsl:text>, </xsl:text></xsl:if>
                        <xsl:if test="@text:journal"><title><xsl:value-of select="@text:journal"/></title>
                            <xsl:text>, </xsl:text></xsl:if>
                        <xsl:if test="@text:address"><address><xsl:value-of select="@text:address"/></address>
                            <xsl:text>, </xsl:text></xsl:if>
                        <xsl:if test="@text:publisher"><publisher><xsl:value-of select="@text:publisher"/></publisher>
                            <xsl:text>, </xsl:text></xsl:if>
                        <xsl:if test="@text:number"><number><xsl:value-of select="@text:number"/></number>
                            <xsl:text>, </xsl:text></xsl:if>
                        <xsl:if test="@text:year"><year><xsl:value-of select="@text:year"/></year>
                            <xsl:text>, </xsl:text></xsl:if>
                        <xsl:if test="@text:pages"><pages><xsl:value-of select="@text:pages"/></pages><xsl:text> p.</xsl:text></xsl:if>
                        <xsl:text>. </xsl:text>
                        <xsl:text>
</xsl:text>
                    </xsl:when>
                    <!--thèse-->
                    <xsl:when test="$type = 'phdthesis'">
                        <xsl:if test="@text:author"><xsl:value-of select="@text:author"/>
                            <xsl:text>, </xsl:text></xsl:if>
                        <xsl:if test="@text:title"><xsl:value-of select="@text:title"/>
                            <xsl:text>, thèse de doctorat : </xsl:text>
                            <xsl:value-of select="@text:series"/>
                            <xsl:text>, </xsl:text></xsl:if>
                        <xsl:if test="@text:address"><xsl:value-of select="@text:address"/>
                            <xsl:text>, </xsl:text></xsl:if>
                        <xsl:if test="@text:publisher"><xsl:value-of select="@text:publisher"/>
                            <xsl:text>, </xsl:text></xsl:if>
                        <xsl:if test="@text:year"><xsl:value-of select="@text:year"/></xsl:if>
                        <xsl:text>. 
</xsl:text>
                    </xsl:when>
                </xsl:choose>    
            
        </xsl:element>
    </xsl:template>

    <xsl:template match="h2">
        <h2>
            <xsl:apply-templates/>
        </h2>
    </xsl:template>
    
    <xsl:template match="h3">
        <h3>
            <xsl:apply-templates/>
        </h3>
    </xsl:template>

</xsl:stylesheet>
