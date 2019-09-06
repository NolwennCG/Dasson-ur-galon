<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

    <!-- STRUCTURE GLOBALE -->

    <xsl:template match="/">
        <html lang="bre">
            <head>
                <meta charset="utf-8"/>
                <link href="../MM2_DUG_CSS/MM2_DUG.css" rel="stylesheet" type="text/css"/>
                <link href="../MM2_DUG_CSS/MM2_DUG_Generale.css" rel="stylesheet" type="text/css"/>
                <link href="../MM2_DUG_CSS/MM2_DUG_Normalise.css" rel="stylesheet" type="text/css"/>
                <link rel="stylesheet"
                    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
                <title>
                    <xsl:variable name="filename" select="tokenize(base-uri(.), '/')[last()] "/>
                    <xsl:text>DUG </xsl:text>
                    <xsl:value-of select="substring-before($filename, '.')"/>
                </title>
            </head>

            <body>

                <div class="menu">
                    <ul id="menuplus">
                        <li>
                            <a href="MM2_DUG_Accueil.html">Accueil</a>
                        </li>
                        <li>
                            <a href="MM2_DUG_Projet.html">Projet</a>
                        </li>
                        <li>
                            <a href="MM2_DUG_introduction.html">Introduction</a>
                        </li>
                        <li>
                            <a href="MM2_DUG_Normalisation.html">Normalisation</a>
                        </li>
                        <li>
                            <a href="MM2_DUG_Analyse.html">Analyse lexicale</a>
                        </li>
                        <li>
                            <a href="MM2_DUG_Bibliographie.html">Bibliographie</a>
                        </li>
                        <li>
                            <a>
                                <i class="fa">&#xf0d7;</i>
                            </a>
                            <ul>
                                <li>
                                    <a href="../MM2_DUG_Poemes/MM2_DUG_0.html">Dasson ur galon</a>
                                </li>
                                <li>
                                    <a href="../MM2_DUG_Poemes/MM2_DUG_0D.html">Compilatoire</a>
                                </li>
                                <li>
                                    <a href="../MM2_DUG_Poemes/MM2_DUG_FR.html">Traduction française</a>
                                </li>
                                <li>
                                    <a href="MM2_DUG_Glossaire.html">Glossaire</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>

                <div class="index">
                    <!--<div id="sommaire">
                        <h7>Sommaire</h7>
                    </div>-->
                    <!--<h7>Lexique</h7>
                    <div id="definition"> </div>-->
                </div>

                <div id="texte_complet">
                    <xsl:apply-templates/>
                </div>

            </body>

        </html>
    </xsl:template>

    <xsl:template match="body">
        <xsl:apply-templates/>
    </xsl:template>
    
    <!-- INTRODUCTION -->
    
    <!-- Tous les éléments et leurs attributs matchés à l'identique -->
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
    
    <!-- BIBLIOGRAPHIE -->
    
    <xsl:template match="bibliography-mark/*">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="bibliography-mark/a">
        <xsl:variable name="lien" select="substring-before(substring-after(., '//') , '/')"/>
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="."/>
            </xsl:attribute>
            <xsl:value-of select="$lien"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bibliography-mark/title">
        <xsl:element name="i">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="bibliography-mark">
        <xsl:element name="span">
            <xsl:apply-templates/>
        </xsl:element>
        <br/>
    </xsl:template>
    
    <xsl:template match="h1 | h2 | h3 | h4 | h5 | h6">
        <xsl:element name="{name()}">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>
