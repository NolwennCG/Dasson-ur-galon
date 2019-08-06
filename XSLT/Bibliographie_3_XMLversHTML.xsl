<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    
<!-- POUR :
     - Bibliographie -->
    
    <!-- STRUCTURE GLOBALE -->
    
    <!--    <xsl:strip-space elements="*"/>-->
    
    <xsl:template match="/">
        <html lang="fr">
            <head>
                <meta charset="utf-8"/>
                <link href="../MM2_DUG_CSS/MM2_DUG.css" rel="stylesheet" type="text/css"/>
                <link href="../MM2_DUG_CSS/MM2_DUG_Generale.css" rel="stylesheet" type="text/css"/>
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
                <title>
                    <xsl:text>DUG Bibliographie</xsl:text>
                </title>
            </head>
            <body>
                
                <div class="menu">
                    <ul id="menuplus">
                        <li><a href="MM2_DUG_Accueil.html">Accueil</a></li>
                        <li><a href="MM2_DUG_Introduction.html">Introduction</a></li>
                        <li><a href="MM2_DUG_Langue.html">La langue</a></li>
                        <li><a href="MM2_DUG_Normalisation.html">Normalisation</a></li>
                        <li><a href="MM2_DUG_Analyse.html">Analyse lexicale</a></li>
                        <li><a href="MM2_DUG_Bibliographie.html">Bibliographie</a></li>
                        <li><a><i class="fa">&#xf0d7;</i></a>
                            <ul>
                                <li><a href="../MM2_DUG_Poemes/MM2_DUG_0.html">Dasson ur galon</a></li>
                                <li><a href="../MM2_DUG_Poemes/MM2_DUG_0D.html">Compilatoire</a></li>
                                <li><a href="MM2_DUG_FR.html">Traduction française</a></li>
                                <li><a href="MM2_DUG_Glossaire.html">Glossaire</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                
                <div class="index">

                </div>
                
                <div id="texte_complet">
                    <xsl:apply-templates/>
                </div>
                
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="*">
        <xsl:element name="span">
            <xsl:attribute name="class">
                <xsl:value-of select="local-name()"/>
            </xsl:attribute>
            <xsl:if test="@unit=@*">
                <xsl:attribute name="name">
                    <xsl:value-of select="@unit"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="body">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="h2">
        <xsl:element name="h2">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bibl">
        <xsl:element name="div">
            <xsl:attribute name="class">
                <xsl:value-of select="local-name()"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
</xsl:stylesheet>