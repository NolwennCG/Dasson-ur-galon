<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="/">
        <body>
            <xsl:apply-templates/>
        </body>
    </xsl:template>
    
    <xsl:template match="Text_20_body|Standard">
        <xsl:element name="p">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="mevital">
        <xsl:element name="i">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="mevgras">
        <xsl:element name="b">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="a">
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="."/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="lb">
        <br/>
    </xsl:template>
    
    <xsl:template
        match="ul | li | Standard/voc | Text_20_body/voc | quote | bibl | figcaption | table | td | tr">
        <xsl:element name="{name()}">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="Quotations|blockquote">
        <xsl:element name="blockquote">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="h1 | h2 | h3 | h4 | h5 | h6 |code">
        <xsl:element name="{name()}">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="Heading_20_4">
        <xsl:element name="h4">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="Footnote">
        <xsl:element name="span">
            <xsl:attribute name="title">
                <xsl:value-of select="."/>
            </xsl:attribute>
            <xsl:text>*</xsl:text>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="code_div">
        <xsl:element name="div">
            <xsl:attribute name="class">code_expl</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
</xsl:stylesheet>