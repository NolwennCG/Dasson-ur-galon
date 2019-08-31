<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

<!-- STRUCTURE GLOBALE -->

    <xsl:template match="/">
        <xsl:comment>CHEVALIER Nolwenn. Projet Dasson ur Galon. </xsl:comment>
        <xsl:comment>Transformation XML-TEI vers HTML (version normalisé) : <xsl:value-of select="format-date(current-date(), '[M01]/[D01]/[Y0001]')"/> à <xsl:value-of select="format-dateTime(current-dateTime(), '[H01]:[m01]')"/>. </xsl:comment>
        <html lang="bre">
            <head>
                <meta charset="utf-8"></meta>
                <link href="../MM2_DUG_CSS/MM2_DUG_Poeme.css" rel="stylesheet" type="text/css"></link>
                <link href="../MM2_DUG_CSS/MM2_DUG.css" rel="stylesheet" type="text/css"></link>
                <script src="../MM2_DUG_highlightjs/typographie.js"/>
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"></link>
                <title>
                    <xsl:text>DUG p.</xsl:text>
                    <xsl:value-of select="descendant::pb[position()=1]/@n"/>
                    <xsl:text>-</xsl:text>
                    <xsl:value-of select="descendant::pb[position()=last()]/@n+1"/>
                </title>
            </head>

            <body onload="initialise_typo();">

                <div class="menu">
                    <ul id="menuplus">
                        <li><a href="../MM2_DUG_Accueil.html">Accueil</a></li>
                        <li><a href="MM2_DUG_0.html">Dasson ur galon</a></li>
                        <li><a href="MM2_DUG_0D.html">Compilatoire</a></li>
                        <li><a href="MM2_DUG_FR.html">Traduction</a></li>
                        <li><a href="../MM2_DUG_General/MM2_DUG_Glossaire.html">Glossaire</a></li>
                        <li><a><i class="fa">&#xf0d7;</i></a>
                            <ul>
                                <li><a href="../MM2_DUG_General/MM2_DUG_Projet.html">Le projet</a></li>
                                <li><a href="../MM2_DUG_General/MM2_DUG_Introduction.html">Introduction</a></li>
                                <li><a href="../MM2_DUG_General/MM2_DUG_Normalisation.html">Normalisation</a></li>
                                <li><a href="../MM2_DUG_General/MM2_DUG_Analyse.html">Analyse lexicale</a></li>
                                <li><a href="../MM2_DUG_General/MM2_DUG_Bibliographie.html">Bibliographie</a></li>
                            </ul>
                        </li>
                    </ul>
                </div> 

            <div class="index">

                <div class="index1">
                    <!-- Navigation haut : boutons -->
                    <xsl:element name="a">
                        <xsl:variable name="filename" select="tokenize(base-uri(.), '/')[last()] "/>
                        <xsl:attribute name="href">
                            <xsl:value-of select="substring-before($filename, '.')"/>
                            <xsl:text>D.html</xsl:text>
                        </xsl:attribute>
                        <button type="button"><i class="fa">&#xf02e;</i> Version compilatoire</button> 
                    </xsl:element>
                    <xsl:element name="a">
                        <xsl:variable name="filename" select="tokenize(base-uri(.), '/')[last()] "/>
                        <xsl:attribute name="href">
                            <xsl:text>MM2_DUG_FR.html#</xsl:text>
                            <xsl:value-of select="substring-before($filename, '.')"/>
                        </xsl:attribute>
                        <button type="button"><i class="fa">&#xf042;</i>  Traduction française</button> 
                    </xsl:element>
                    <xsl:element name="a">
                        <xsl:attribute name="href"><xsl:text>../MM2_DUG_General/MM2_DUG_Glossaire.html</xsl:text></xsl:attribute>
                        <button type="button"><i class="fa">&#xf02d;</i> Glossaire</button> 
                    </xsl:element>
                    <xsl:element name="a">
                        <xsl:variable name="filename" select="tokenize(base-uri(.), '/')[last()] "/>
                        <xsl:variable name="number" select="substring-before($filename, '.')"/>
                        <xsl:attribute name="href">
                            <xsl:text>https://www.fichier-pdf.fr/</xsl:text>
                            <xsl:value-of select="format-date(current-date(), '[Y0001]/[M01]/[D01]')"/>
                            <xsl:text>/mm2dug</xsl:text>
                            <xsl:value-of select="substring-after($number, '_DUG_')"/>
                        </xsl:attribute>
                        <button type="button"><i class="fa"></i> PDF</button> 
                    </xsl:element>
                </div>

                <xsl:element name="div"><xsl:attribute name="id"><xsl:text>definition</xsl:text></xsl:attribute>
                </xsl:element>

                <xsl:element name="div"><xsl:attribute name="id"><xsl:text>bibliographie</xsl:text></xsl:attribute>
                    <xsl:apply-templates select="descendant::sourceDesc/bibl"/>
                    <br/>
                    <xsl:element name="editor"><xsl:text>éd. Nolwenn Chevalier</xsl:text></xsl:element>
                </xsl:element>

                <!-- Navigation bas : flèches -->
                <div class="nav">
                    <xsl:variable name="filename" select="tokenize(base-uri(.), '/')[last()] "/>
                    <xsl:variable name="before" select="substring-before($filename,'.xml')"/>
                    <xsl:variable name="number" select="number(substring-after($before,'MM2_DUG_'))"/>
                    <xsl:element name="a">
                        <xsl:attribute name="href"><xsl:text>MM2_DUG_</xsl:text><xsl:value-of select="$number - 1"/><xsl:text>.html</xsl:text></xsl:attribute>
                        <i style="font-size:24px" class="fa">&#xf0d9;</i> 
                    </xsl:element>
                    <xsl:element name="a">
                        <xsl:attribute name="href"><xsl:text>MM2_DUG_</xsl:text><xsl:value-of select="$number + 1"/><xsl:text>.html</xsl:text></xsl:attribute>
                        <i style="font-size:24px" class="fa">&#xf0da;</i>
                    </xsl:element>
                </div>

            </div>

            <div id="texte_complet">
                <xsl:apply-templates/>
            </div>

            </body>

        </html>
    </xsl:template>

<!-- STRUCTURE COLONNE -->

    <xsl:template match="body">
        <xsl:element name="div">
            <xsl:attribute name="id">col1</xsl:attribute>
            <xsl:apply-templates mode="reg"/>
        </xsl:element>
        <xsl:element name="div">
            <xsl:attribute name="id">col2</xsl:attribute>
            <xsl:apply-templates mode="orig"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="teiHeader"/>

    <xsl:template match="ref">
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="@*"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="title">
        <xsl:element name="i">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="note" mode="#all"/>

<!-- MODE="#REG" -->

    <xsl:template match="head" mode="reg">
        <xsl:choose>
            <xsl:when test="@* = 'head'">
                <xsl:element name="h2">
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:when>
            <xsl:when test="@* = 'sub'">
                <xsl:element name="h3">
                    <xsl:apply-templates mode="reg"/>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="h2">
                    <xsl:apply-templates mode="reg"/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="l|lg" mode="reg">
        <xsl:element name="span">
            <xsl:attribute name="class">
                <xsl:value-of select="name()"/>
            </xsl:attribute>
            <xsl:apply-templates mode="reg"/>
        </xsl:element>
        <br/>
    </xsl:template>

    <xsl:template match="pb" mode="reg">
        <xsl:element name="span">
            <xsl:attribute name="class">pb</xsl:attribute>
            <xsl:text>[p.</xsl:text>
            <xsl:value-of select="@n"/>
            <xsl:text>]</xsl:text>
        </xsl:element>
    </xsl:template>

    <xsl:template match="*" mode="reg">
        <xsl:choose>
            <xsl:when test="@*">
                <xsl:element name="span">
                    <xsl:attribute name="class">
                        <xsl:value-of select="@*"/>
                    </xsl:attribute>
                    <xsl:apply-templates mode="reg"/>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="span">
                    <xsl:attribute name="class">
                        <xsl:value-of select="name()"/>
                    </xsl:attribute>
                    <xsl:apply-templates mode="reg"/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="cit|dateline" mode="reg">
        <xsl:element name="div">
            <xsl:attribute name="class">
                <xsl:value-of select="name()"/>
            </xsl:attribute>
            <xsl:apply-templates mode="reg"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="orig|sic" mode="reg"/>

    <xsl:template match="reg" mode="reg">
        <xsl:choose>
            <xsl:when test="text()">
                <xsl:apply-templates mode="reg"/>
            </xsl:when>
            <xsl:otherwise/>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="corr" mode="reg">
        <xsl:element name="span">
            <xsl:attribute name="class">
                <xsl:value-of select="name()"/>
            </xsl:attribute>
            <xsl:apply-templates mode="reg"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="choice" mode="reg">
        <xsl:choose>
            <xsl:when test="./*/text()">
                <xsl:apply-templates mode="reg"/>
            </xsl:when>
            <xsl:otherwise/>
        </xsl:choose>
    </xsl:template>

<!-- MODE="#ORIG" -->

    <xsl:template match="head" mode="orig">
        <xsl:choose>
            <xsl:when test="@* = 'head'">
                <xsl:element name="h2">
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:when>
            <xsl:when test="@* = 'sub'">
                <xsl:element name="h3">
                    <xsl:apply-templates mode="orig"/>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="h2">
                    <xsl:apply-templates mode="orig"/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="cit|dateline" mode="orig">
        <xsl:element name="div">
            <xsl:attribute name="class">
                <xsl:value-of select="name()"/>
            </xsl:attribute>
            <xsl:apply-templates mode="orig"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="l|lg" mode="orig">
        <xsl:element name="span">
            <xsl:attribute name="class">
                <xsl:value-of select="name()"/>
            </xsl:attribute>
            <xsl:apply-templates mode="orig"/>
        </xsl:element>
        <br/>
    </xsl:template>

    <xsl:template match="pb" mode="orig">
        <xsl:element name="span">
            <xsl:attribute name="class">pb</xsl:attribute>
            <xsl:text>[p.</xsl:text>
            <xsl:value-of select="@n"/>
            <xsl:text>]</xsl:text>
        </xsl:element>
    </xsl:template>

    <xsl:template match="*" mode="orig">
        <xsl:choose>
            <xsl:when test="@*">
                <xsl:element name="span">
                    <xsl:attribute name="class">
                        <xsl:value-of select="@*"/>
                    </xsl:attribute>
                    <xsl:apply-templates mode="orig"/>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="span">
                    <xsl:attribute name="class">
                        <xsl:value-of select="name()"/>
                    </xsl:attribute>
                    <xsl:apply-templates mode="orig"/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="reg|corr" mode="orig"/>

    <xsl:template match="orig" mode="orig">
        <xsl:choose>
            <xsl:when test="text()">
                <xsl:apply-templates mode="orig"/>
            </xsl:when>
            <xsl:otherwise/>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="sic" mode="orig">
        <xsl:element name="span">
            <xsl:attribute name="class">
                <xsl:value-of select="name()"/>
            </xsl:attribute>
            <xsl:apply-templates mode="orig"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="choice" mode="orig">
        <xsl:choose>
            <xsl:when test="./*/text()">
                <xsl:apply-templates mode="orig"/>
            </xsl:when>
            <xsl:otherwise/>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>