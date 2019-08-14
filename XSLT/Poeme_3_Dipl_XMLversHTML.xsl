<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    
    <!-- STRUCTURE GLOBALE -->
    
    <!--    <xsl:strip-space elements="*"/>-->
    
    <xsl:template match="/">
        <html lang="bre">
            <head>
                <meta charset="utf-8"></meta>
                <link href="../MM2_DUG_CSS/MM2_DUG_Poeme.css" rel="stylesheet" type="text/css"></link>
                <link href="../MM2_DUG_CSS/MM2_DUG_PoemeD.css" rel="stylesheet" type="text/css"></link>
                <link href="../MM2_DUG_CSS/MM2_DUG.css" rel="stylesheet" type="text/css"></link>
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"></link>
                <script src="../MM2_DUG_highlightjs/checkboxes.js"></script>
                <script src="../MM2_DUG_highlightjs/typographie.js"></script>
                <title>
                    <xsl:text>DUG p.</xsl:text>
                    <xsl:value-of select="descendant::pb[position()=1]/@n"/>
                    <xsl:text>-</xsl:text>
                    <xsl:value-of select="descendant::pb[position()=last()]/@n+1"/>
                </title>
            </head>
            
            <body onload="initialise_checkboxes(); initialise_typo()">
                
                <div class="menu">
                    <ul id="menuplus">
                        <li><a href="../MM2_DUG_Accueil.html">Accueil</a></li>
                        <li><a href="MM2_DUG_0.html">Dasson ur galon</a></li>
                        <li><a href="MM2_DUG_0D.html">Compilatoire</a></li>
                        <li><a href="MM2_DUG_FR.html">VF</a></li>
                        <li><a><i class="fa">&#xf0d7;</i></a>
                            <ul>
                                <li><a href="../MM2_DUG_General/MM2_DUG_Introduction.html">Introduction</a></li>
                                <li><a href="../MM2_DUG_General/MM2_DUG_Langue.html">La langue</a></li>
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
                                <xsl:text>.html</xsl:text>
                            </xsl:attribute>
                            <button type="button"><i class="fa">&#xf02e;</i> Version normalisée</button> 
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
                            <xsl:attribute name="href">
                                <xsl:text>https://github.com/NolwennCH/Dasson-ur-galon/blob/master/XML/</xsl:text>
                                <xsl:value-of select="substring-before($filename, '.')"/>
                                <xsl:text>.xml</xsl:text>
                            </xsl:attribute>
                            <button type="button"><i class="fa"></i> Fichier XML</button>
                        </xsl:element>
                    </div>

                    <xsl:element name="div">
                        <xsl:attribute name="id"><xsl:text>definition1</xsl:text></xsl:attribute>
                        <input type="checkbox" name="norm" id="affiche_tout"
                            value="affiche_tout" onclick="affiche_tout_tout();"/><label for="affiche_tout">Select all</label>
                        <hr/>
                        <xsl:element name="div"><xsl:attribute name="id"><xsl:text>definition2</xsl:text></xsl:attribute>
                        </xsl:element>
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
                            <xsl:attribute name="href"><xsl:text>MM2_DUG_</xsl:text><xsl:value-of select="$number - 1"/><xsl:text>D.html</xsl:text></xsl:attribute>
                            <button type="button"><i style="font-size:24px" class="fa">&#xf0d9;</i></button> 
                        </xsl:element>
                        <xsl:element name="a">
                            <xsl:attribute name="href"><xsl:text>MM2_DUG_</xsl:text><xsl:value-of select="$number + 1"/><xsl:text>D.html</xsl:text></xsl:attribute>
                            <button type="button"><i style="font-size:24px" class="fa">&#xf0da;</i></button>
                        </xsl:element>
                    </div>
                    
                </div>
                
                <div id="texte_complet">
                    <xsl:apply-templates/>
                <hr/>
                    <div class="back">
                        <xsl:for-each select="descendant::note">    
                            <xsl:element name="span">
                                <xsl:attribute name="class">back</xsl:attribute>
                                <xsl:element name="sup">
                                    <xsl:attribute name="id">
                                        <xsl:text>ref</xsl:text>
                                        <xsl:value-of select="@n"/>
                                    </xsl:attribute>
                                    <xsl:element name="a">
                                        <xsl:attribute name="href">
                                            <xsl:text>#fn</xsl:text>
                                            <xsl:value-of select="@n"/>
                                        </xsl:attribute>
                                        <xsl:value-of select="@n"/>
                                    </xsl:element>   
                                    <xsl:apply-templates/>
                            </xsl:element>
                            <br/>
                            </xsl:element>
                        </xsl:for-each>
                    </div>
                </div>
                
            </body>
        </html>
    </xsl:template>
    
    <!-- STRUCTURE COLONNE -->
    
    <xsl:template match="body">
        <xsl:element name="div">
            <xsl:attribute name="id">col3</xsl:attribute>
            <xsl:apply-templates/>
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
    
    <xsl:template match="TEI">
        <xsl:apply-templates/>
    </xsl:template>
    
    <!-- ELEMENTS -->
    
    <xsl:template match="head">
        <xsl:choose>
            <xsl:when test="@* = 'head'">
                <xsl:element name="h2">
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:when>
            <xsl:when test="@* = 'sub'">
                <xsl:element name="h3">
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="h2">
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="cit|dateline|quote">
        <xsl:element name="div">
            <xsl:attribute name="class">
                <xsl:value-of select="name()"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="div">
        <xsl:element name="div">
            <xsl:attribute name="type">
                <xsl:value-of select="@type"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="salute">
        <xsl:element name="div">
            <xsl:attribute name="class">salute</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="lg">
        <xsl:element name="div">
            <xsl:attribute name="class">lg</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
        <br/>
    </xsl:template>
    
    <xsl:template match="l">
        <xsl:element name="div">
            <xsl:attribute name="class">l</xsl:attribute>
            <xsl:element name="ul">
                <xsl:attribute name="class">sidenotes</xsl:attribute>
                <xsl:element name="li">
                    <xsl:for-each select="descendant::note">        
                        <xsl:element name="span">
                            <xsl:attribute name="class">over</xsl:attribute>
                            <xsl:element name="span">
                                <xsl:attribute name="class">num</xsl:attribute>
                                <xsl:element name="a">
                                    <xsl:attribute name="href">
                                        <xsl:text>#ref</xsl:text>
                                        <xsl:value-of select="@n"/>
                                    </xsl:attribute>
                                    <xsl:value-of select="./@n"/>
                                </xsl:element>
                            </xsl:element>
                            <xsl:apply-templates/>
                        </xsl:element>
                    </xsl:for-each>
                </xsl:element>
            </xsl:element>
            <xsl:element name="span">
                <xsl:attribute name="class">l</xsl:attribute>
                <xsl:apply-templates/>
            </xsl:element>
        </xsl:element>
        <br/>
    </xsl:template>
    
    <xsl:template match="note">
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:text>#ref</xsl:text>
                <xsl:value-of select="@n"/>
            </xsl:attribute>
            <xsl:attribute name="id">
                <xsl:text>fn</xsl:text>
                <xsl:value-of select="@n"/>
            </xsl:attribute>
            <xsl:value-of select="@n"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="pb">
        <xsl:element name="span">
            <xsl:attribute name="class">pb</xsl:attribute>
            <xsl:text>[p.</xsl:text>
            <xsl:value-of select="@n"/>
            <xsl:text>]</xsl:text>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="*">
        <xsl:choose>
            <xsl:when test="@type">
                <xsl:element name="span">
                    <xsl:attribute name="class">
                        <xsl:value-of select="@type"/>
                    </xsl:attribute>
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="span">
                    <xsl:attribute name="class">
                        <xsl:value-of select="name()"/>
                    </xsl:attribute>
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose> 
    </xsl:template>

    <xsl:template match="choice">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="orig">
        <xsl:element name="span">
            <xsl:attribute name="class">
                <xsl:value-of select="local-name()"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="reg">
        <xsl:element name="span">
            <xsl:attribute name="class">
                <xsl:value-of select="local-name()"/>
            </xsl:attribute>
            <xsl:text>[</xsl:text>
            <xsl:apply-templates/>
            <xsl:text>]</xsl:text>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="sic">
        <xsl:element name="span">
            <xsl:attribute name="class">correction</xsl:attribute>
            <xsl:element name="span">
                <xsl:attribute name="class">
                    <xsl:text>orig</xsl:text>
                </xsl:attribute>
                <xsl:apply-templates/>
            </xsl:element>
            <xsl:element name="span">
                <xsl:attribute name="class">
                    <xsl:text>reg</xsl:text>
                </xsl:attribute>
                <xsl:text>[</xsl:text>
                <xsl:value-of select="following-sibling::corr"/>
                <xsl:text>]</xsl:text>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="corr"/>
    
    <xsl:template match="hi">
        <xsl:element name="{@*}">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
</xsl:stylesheet>