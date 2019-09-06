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
                <script src="../MM2_DUG_JavaScript/definition.js"/>
                <link rel="stylesheet"
                    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
                <link rel="stylesheet" href="../MM2_DUG_JavaScript/styles/atom-one-dark.css"/>
                <script src="../MM2_DUG_JavaScript/highlight.pack.js"/>
                <script>hljs.initHighlightingOnLoad();</script>
                <title>
                    <xsl:text>DUG Normalisation</xsl:text>
                </title>
            </head>

            <body onload="visualise_mots_clefs();">

                <div class="menu">
                    <ul id="menuplus">
                        <li>
                            <a href="MM2_DUG_Accueil.html">Accueil</a>
                        </li>
                        <li>
                            <a href="MM2_DUG_Projet.html">Projet</a>
                        </li>
                        <li>
                            <a href="MM2_DUG_Introduction.html">Introduction</a>
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
                    <h2>Sommaire</h2>
                    <div id="sommaire"> 
                    </div>
                    <h2>Lexique</h2>
                    <div id="definition"> </div>
                </div>

                <div id="texte_complet">
                    <xsl:apply-templates/>
                </div>

            </body>

        </html>
    </xsl:template>

    <!-- STRUCTURE COLONNE -->

    <xsl:template match="body">
        <xsl:apply-templates/>
    </xsl:template>
    
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

    <xsl:template match="lb">
        <br/>
    </xsl:template>

    <xsl:template match="ul | li | quote | bibl | figcaption | table | td | tr">
        <xsl:element name="{name()}">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="h1 | h2 | h3 | h4 | h5 | h6">
        <xsl:element name="{name()}">
            <xsl:attribute name="id">
                <xsl:value-of select="translate(., 'ABCDEFGHIJKLMNOPQRSTUVWXYZé -’', 'abcdefghijklmnopqrstuvwxyze__')"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="refbibl">
        <xsl:element name="span">
            <xsl:attribute name="title">
                <xsl:value-of select="@title"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="a">
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="@href"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="mevital">
        <xsl:element name="i">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="quote"/>
    
    <xsl:template match="bibl">
        <xsl:element name="blockquote">
            <xsl:value-of select="preceding-sibling::quote[1]"/>
            <xsl:element name="cite">
                <xsl:apply-templates/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="figure">
        <xsl:element name="figure">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="img">
        <xsl:element name="img">
            <xsl:attribute name="src">
                <xsl:text>../MM2_DUG_Images/</xsl:text>
                <xsl:value-of select="." disable-output-escaping="yes"/>
            </xsl:attribute>
        </xsl:element>
    </xsl:template>

    <xsl:template match="Text_20_body | body/Standard">
        <xsl:element name="p">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="code">
        <xsl:element name="div">
            <xsl:attribute name="class">code</xsl:attribute>
            <xsl:element name="pre">
                <xsl:text>Balisage TEI :</xsl:text>
                <xsl:element name="code">
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="voc">
        <xsl:element name="span">
            <xsl:choose>
                <xsl:when test="contains(., 'tonique')"><xsl:attribute name="class">motclef tonique</xsl:attribute></xsl:when>
                <xsl:when test="contains(., 'amuïs')"><xsl:attribute name="class">motclef amuït</xsl:attribute></xsl:when>
                <xsl:when test="contains(., 'compilatoire')"><xsl:attribute name="class">motclef compilatoire</xsl:attribute></xsl:when>
                <xsl:when test="contains(., 'brève')"><xsl:attribute name="class">motclef brève</xsl:attribute></xsl:when>
                <xsl:when test="contains(., 'diacritique')"><xsl:attribute name="class">motclef diacritique</xsl:attribute></xsl:when>
                <xsl:when test="contains(., 'digramme')"><xsl:attribute name="class">motclef digramme</xsl:attribute></xsl:when>
                <xsl:when test="contains(., 'diphtong')"><xsl:attribute name="class">motclef diphtong</xsl:attribute></xsl:when>
                <xsl:when test="contains(., 'épenth')"><xsl:attribute name="class">motclef épenth</xsl:attribute></xsl:when>
                <xsl:when test="contains(., 'ferm')"><xsl:attribute name="class">motclef ferm</xsl:attribute></xsl:when>
                <xsl:when test="contains(., 'final')"><xsl:attribute name="class">motclef final</xsl:attribute></xsl:when>
                <xsl:when test="contains(., 'fricativ')"><xsl:attribute name="class">motclef fricativ</xsl:attribute></xsl:when>
                <xsl:when test="contains(., 'graphème')"><xsl:attribute name="class">motclef graphème</xsl:attribute></xsl:when>
                <xsl:when test="contains(., 'hiatus')"><xsl:attribute name="class">motclef hiatus</xsl:attribute></xsl:when>
                <xsl:when test="contains(., 'initial')"><xsl:attribute name="class">motclef initial</xsl:attribute></xsl:when>
                <xsl:when test="contains(., 'intervocalique')"><xsl:attribute name="class">motclef intervocalique</xsl:attribute></xsl:when>
                <xsl:when test="contains(., 'KTL')"><xsl:attribute name="class">motclef KTL</xsl:attribute></xsl:when>
                <xsl:when test="contains(., 'longue')"><xsl:attribute name="class">motclef longue</xsl:attribute></xsl:when>
                <xsl:when test="contains(., 'métathèse')"><xsl:attribute name="class">motclef métathèse</xsl:attribute></xsl:when>
                <xsl:when test="contains(., 'monophtongaison')"><xsl:attribute name="class">motclef monophtongaison</xsl:attribute></xsl:when>
                <xsl:when test="contains(., 'mutation')"><xsl:attribute name="class">motclef mutation</xsl:attribute></xsl:when>
                <xsl:when test="contains(., 'nasal')"><xsl:attribute name="class">motclef nasal</xsl:attribute></xsl:when>
                <xsl:when test="contains(., 'normalis')"><xsl:attribute name="class">motclef normalis</xsl:attribute></xsl:when>
                <xsl:when test="contains(., 'occlusive')"><xsl:attribute name="class">motclef occlusive</xsl:attribute></xsl:when>
                <xsl:when test="contains(., 'ouvert')"><xsl:attribute name="class">motclef ouvert</xsl:attribute></xsl:when>
                <xsl:when test="contains(., 'palatal')"><xsl:attribute name="class">motclef palatal</xsl:attribute></xsl:when>
                <xsl:when test="contains(., 'peurunvan')"><xsl:attribute name="class">motclef peurunvan</xsl:attribute></xsl:when>
                <xsl:when test="contains(., 'skoueriekadur')"><xsl:attribute name="class">motclef skoueriekadur</xsl:attribute></xsl:when>
                <xsl:when test="contains(., 'spira')"><xsl:attribute name="class">motclef spira</xsl:attribute></xsl:when>
                <xsl:when test="contains(., 'tilde')"><xsl:attribute name="class">motclef tilde</xsl:attribute></xsl:when>
                <xsl:when test="contains(., 'trigramme')"><xsl:attribute name="class">motclef trigramme</xsl:attribute></xsl:when>
                <xsl:when test="contains(., 'vannetais')"><xsl:attribute name="class">motclef vannetais</xsl:attribute></xsl:when>
                <xsl:when test="contains(., 'vélaire')"><xsl:attribute name="class">motclef vélaire</xsl:attribute></xsl:when>
                <xsl:when test="contains(., 'vois')"><xsl:attribute name="class">motclef vois</xsl:attribute></xsl:when>
            </xsl:choose>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
