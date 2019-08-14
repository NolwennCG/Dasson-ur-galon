<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    
<!-- STRUCTURE GLOBALE -->
    
    <xsl:template match="/">
        <html lang="bre">
            <head>
                <meta charset="utf-8"></meta>
                <link href="../MM2_DUG_CSS/MM2_DUG_Poeme.css" rel="stylesheet" type="text/css"></link>
                <link href="../MM2_DUG_CSS/MM2_DUG.css" rel="stylesheet" type="text/css"></link>
                <script src="../MM2_DUG_highlightjs/sommaire.js"/>
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"></link>
                <title>
                    <xsl:variable name="filename" select="tokenize(base-uri(.), '/')[last()] "/>
                    <xsl:text>DUG </xsl:text>
                    <xsl:value-of select="$filename"/>
                </title>
            </head>
            
            <body onload="initialise_typo();">
                
                <div class="menu">
                    <ul id="menuplus">
                        <li><a href="../MM2_DUG_Accueil.html">Accueil</a></li>
                        <li><a href="MM2_DUG_Introduction.html">Introduction</a></li>
                        <li><a href="MM2_DUG_Langue.html">La langue</a></li>
                        <li><a href="MM2_DUG_Normalisation.html">Normalisation</a></li>
                        <li><a href="MM2_DUG_Analyse.html">Analyse lexicale</a></li>
                        <li><a href="MM2_DUG_Bibliographie.html">Bibliographie</a></li>
                        <li><a><i class="fa">&#xf0d7;</i></a>
                            <ul>
                                <li><a href="../MM2_DUG_Poemes/MM2_DUG_0.html">Dasson ur galon</a></li>
                                <li><a href="../MM2_DUG_Poemes/MM2_DUG_0D.html">Compilatoire</a></li>
                                <li><a href="../MM2_DUG_Poemes/MM2_DUG_FR.html">VF</a></li>
                                <li><a href="MM2_DUG_Glossaire.html">Glossaire</a></li>
                            </ul>
                        </li>
                    </ul>
                </div> 
            
            <div class="index">
                <xsl:element name="a">
                    <xsl:attribute name="href"><xsl:text>MM2_DUG_Lexique.html</xsl:text></xsl:attribute>
                    <button type="button"><i class="fa">&#xf02d;</i> Lexique</button> 
                </xsl:element>
                <div class="sommaire">
                    <h2>Sommaire</h2>
                </div>
            </div>
            
            <div id="texte_complet">
                <xsl:apply-templates/>
            </div>
            
            </body>
            
        </html>
    </xsl:template>

<!-- STRUCTURE COLONNE -->
    
    
    
</xsl:stylesheet>