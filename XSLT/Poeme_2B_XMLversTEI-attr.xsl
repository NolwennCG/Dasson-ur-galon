<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="*">
        <xsl:element name="{local-name()}">
            <xsl:for-each select="attribute::*">
                <xsl:attribute name="{local-name()}">
                    <xsl:value-of select="."/>
                </xsl:attribute>
            </xsl:for-each>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="pc">
        <xsl:element name="{local-name()}">
            <xsl:for-each select="attribute::*">
                <xsl:attribute name="{local-name()}">
                    <xsl:text>signes_de_ponctuation.</xsl:text>
                    <xsl:value-of select="."/>
                </xsl:attribute>
            </xsl:for-each>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="corr|sic">
        <xsl:element name="{local-name()}">
            <xsl:attribute name="class">
                <xsl:text>correction.</xsl:text>
                <xsl:value-of select="local-name()"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="seg|abbr">
        <xsl:variable name="metaplasmes">
            <xsl:text>metaplasmes.</xsl:text>
            <xsl:value-of select="@*"/>
        </xsl:variable>
        <xsl:variable name="assimilations">
            <xsl:text>assimilation_des_consonnes.</xsl:text>
            <xsl:value-of select="@*"/>
        </xsl:variable>
        <xsl:variable name="diacritiques">
            <xsl:text>diacritiques.</xsl:text>
            <xsl:value-of select="@*"/>
        </xsl:variable>
        <xsl:variable name="phonetiques">
            <xsl:text>modifications_phonétiques.</xsl:text>
            <xsl:value-of select="@*"/>
        </xsl:variable>
        <xsl:element name="{local-name()}">
            <xsl:for-each select="attribute::*">
                <xsl:attribute name="{local-name()}">
                    <xsl:choose>
                        <xsl:when test="contains(., 'conson') or contains(. , 'voyelle') or contains(. , 'metathese')">
                            <xsl:value-of select="$metaplasmes"/>
                        </xsl:when>
                        <xsl:when test="contains(., 'voisement') or contains(. , 'nasal')">
                            <xsl:value-of select="$assimilations"/>
                        </xsl:when>
                        <xsl:when test="contains(., 'diacritique') or contains(. , 'ramiste') or contains(. , 'signe')">
                            <xsl:value-of select="$diacritiques"/>
                        </xsl:when>
                        <xsl:when test="contains(., 'tongaison')">
                            <xsl:value-of select="$phonetiques"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:text>autre.</xsl:text>
                            <xsl:value-of select="."/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:attribute>
            </xsl:for-each>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
</xsl:stylesheet>