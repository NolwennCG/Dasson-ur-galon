<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="no" doctype-system="MM2_DUG_Poeme.dtd"/>

    <xsl:template match="/">
        <!--<xsl:processing-instruction name="xml-model">
            <xsl:text>href="../schema/BVH_Epistemon.rng" type="application/xml" schematypens="http://relaxng.org/ns/structure/1.0"</xsl:text>
        </xsl:processing-instruction>-->
        <xsl:element name="TEI">
            <xsl:element name="teiHeader">
                <xsl:element name="fileDesc">
                    <xsl:element name="titleStmt">
                        <xsl:element name="title">
                            <xsl:attribute name="type">main</xsl:attribute>
                            <xsl:text>Dasson ur galon</xsl:text>
                        </xsl:element>
                        <xsl:element name="title">
                            <xsl:attribute name="type">sub</xsl:attribute>
                            <xsl:apply-templates select="descendant::_3_head" mode="orig"/>
                            <xsl:apply-templates select="descendant::_3_head.main" mode="orig"/>
                        </xsl:element>
                        <xsl:element name="author">
                            <xsl:attribute name="key">Herrieu, Loeiz (1879-1953)</xsl:attribute>
                            <xsl:attribute name="ref">https://data.bnf.fr/fr/12041305/loeiz_herrieu/</xsl:attribute>
                            <xsl:text>Loeiz Herrieu</xsl:text>
                        </xsl:element>
                    </xsl:element>
                    <xsl:element name="editionStmt">
                        <xsl:element name="edition">
                            <xsl:text>Université de Lille</xsl:text>
                        </xsl:element>
                        <xsl:element name="respStmt">
                            <xsl:element name="name">
                                <xsl:attribute name="xml:id">NC</xsl:attribute>
                                <xsl:text>Nolwenn Chevalier</xsl:text>
                            </xsl:element>
                            <xsl:element name="resp">
                                <xsl:text>éditrice critique</xsl:text>
                            </xsl:element>
                        </xsl:element>
                    </xsl:element>
                    <xsl:element name="publicationStmt">
                        <xsl:element name="publisher">
                            <xsl:text>Université de Lille</xsl:text>
                        </xsl:element>
                        <xsl:element name="date">
                            <xsl:attribute name="when">2019</xsl:attribute>
                        </xsl:element>
                        <xsl:element name="availability">
                            <xsl:attribute name="status">restricted</xsl:attribute>
                            <xsl:element name="licence">
                                <xsl:attribute name="target">http://creativecommons.org/licenses/by-nc-nd/3.0/fr/</xsl:attribute>
                            </xsl:element>
                            <p>Copyright © 2014 Université de Lille.</p>
                            <p>Cette ressource électronique protégée par le code de la propriété intellectuelle sur les bases de données (L341-1) est mise à disposition de la communauté scientifique internationale par l’Université de Lille, selon les termes de la licence Creative Commons : « Attribution - Pas d’Utilisation Commerciale - Pas de Modification 3.0 France (CC BY-NC-ND 3.0 FR) ».</p>
                            <p>Attribution : afin de référencer la source, toute utilisation ou publication dérivée de cette ressource électroniques comportera le nom de l’Université de Lille et surtout l’adresse Internet de la ressource.</p>
                            <p>Pas d’Utilisation Commerciale : dans l’intérêt de la communauté scientifique, toute utilisation commerciale est interdite.</p>
                            <p>Pas de Modification : l’Université de Lille s’engage à améliorer et à corriger cette ressource électronique, notamment en intégrant toutes les contributions extérieures. La diffusion de versions modifiées de cette ressource n’est pas souhaitable.</p> 
                        </xsl:element>
                    </xsl:element>
                    <xsl:element name="sourceDesc">
                        <xsl:element name="bibl">
                            <xsl:element name="author"><xsl:text>Loeiz Herrieu</xsl:text></xsl:element><xsl:text>, </xsl:text>
                            <xsl:text>« </xsl:text><xsl:apply-templates select="descendant::_3_head.main" mode="reg"/><xsl:apply-templates select="descendant::_3_head" mode="reg"/><xsl:text> », </xsl:text>
                            <xsl:element name="title"><xsl:text>Dasson ur Galon</xsl:text></xsl:element><xsl:text>, </xsl:text>
                            <xsl:element name="pubPlace"><xsl:text>Brest</xsl:text></xsl:element><xsl:text>, </xsl:text>
                            <xsl:element name="publisher"><xsl:text>Brud Nevez</xsl:text></xsl:element><xsl:text>, </xsl:text>
                            <xsl:element name="date"><xsl:text>1983</xsl:text></xsl:element><xsl:text>, </xsl:text>
                            <xsl:element name="biblScope"><xsl:text>141 p.</xsl:text></xsl:element><xsl:text>. </xsl:text>
                            <xsl:text>PDF : </xsl:text>
                            <xsl:element name="ref"><xsl:attribute name="target">http://bibliotheque.idbe-bzh.org/data/cle_113/Dasson_ur_Galon_.pdf</xsl:attribute><xsl:text>Idbe-bzh</xsl:text></xsl:element><xsl:text>. </xsl:text>
                        </xsl:element>
                    </xsl:element>
                    <xsl:element name="profileDesc">
                        <xsl:element name="creation">
                            <xsl:element name="date">
                                <xsl:attribute name="when">1983</xsl:attribute>
                            </xsl:element>
                        </xsl:element>
                        <xsl:element name="langUsage">
                            <xsl:element name="language">
                                <xsl:attribute name="ident">bre</xsl:attribute>
                            </xsl:element>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
            <xsl:element name="body">
                <xsl:element name="div">
                    <xsl:attribute name="type">poem</xsl:attribute>
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    <!-- titre pour les métadonnées -->
    <xsl:template match="_3_head|_3_head.main" mode="reg">
        <xsl:apply-templates mode="reg"/>
    </xsl:template>
    <xsl:template match="node()[contains(name(), 'reg')]" mode="reg">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="node()[contains(name(), 'orig')]" mode="reg"/>
    <xsl:template match="Footnote|note-citation" mode="reg"/>
    
    <xsl:template match="_3_head|_3_head.main" mode="orig">
        <xsl:apply-templates mode="orig"/>
    </xsl:template>
    <xsl:template match="node()[contains(name(), 'orig')]" mode="orig">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="node()[contains(name(), 'reg')]" mode="orig"/>
    <xsl:template match="Footnote|note-citation" mode="orig"/>
    
    <xsl:template match="body|text">
        <xsl:apply-templates/>
    </xsl:template>
    
    <!-- Vérification des éléments indésirables -->
    <!--<xsl:template match="*">
        <xsl:text>
[</xsl:text>
            <xsl:value-of select="name()"/>
        <xsl:text>]</xsl:text>
            <xsl:apply-templates/>
    </xsl:template>-->
    
    <!--  TRAITEMENT DES ELEMENTS -->
    
    <!-- 1. Pour les éléments avec une seule balise dans <choice> : <element.attribut_1_orig> -->

    <xsl:template match="node()[contains(name(), '_1_')]">
        <xsl:variable name="element" select="substring-before(name(), '.')"/>
        <xsl:variable name="attribut" select="substring-before(substring-after(name(), '.'), '_1_')"/>
        <xsl:variable name="resp" select="substring-after(name(), '_1_')"/>
        <xsl:element name="{$element}">
            <xsl:attribute name="type">
                <xsl:value-of select="$attribut"/>
            </xsl:attribute>
            <xsl:element name="choice">
                <xsl:element name="{$resp}">
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:template>

    <!-- 2. Pour les éléments avec un choix dans le <choice> : <element.attribut_2_orig> -->

    <xsl:template match="node()[contains(name(), '_2_orig')]">
        <xsl:variable name="element" select="substring-before(name(), '.')"/>
        <xsl:variable name="attribut" select="substring-before(substring-after(name(), '.'), '_2_')"/>
        <xsl:variable name="same">
            <xsl:value-of select="$element"/>
            <xsl:text>.</xsl:text>
            <xsl:value-of select="$attribut"/>
            <xsl:text>_2_reg</xsl:text>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="name() = following-sibling::node()[1]/name()">
                <xsl:element name="{$element}">
                    <xsl:attribute name="type"><xsl:value-of select="$attribut"/></xsl:attribute>
                    <xsl:element name="choice">
                        <xsl:element name="orig">
                            <xsl:value-of select="."/>
                            <xsl:value-of select="following-sibling::node()[1]"/>
                        </xsl:element>
                        <xsl:if test="following-sibling::node()[2][contains(name(), $same)]">
                            <xsl:element name="reg">
                                <xsl:value-of select="following-sibling::node()[2]"/>
                                <xsl:if test="following-sibling::node()[3][contains(name(), $same)]">
                                    <xsl:value-of select="following-sibling::node()[3]"/>
                                </xsl:if>
                            </xsl:element>
                        </xsl:if>
                    </xsl:element>
                </xsl:element>
            </xsl:when>
            <xsl:when test="name() = preceding-sibling::node()[1]/name()"/>
            <xsl:when test="following-sibling::node()[1][contains(name(), $same)]">
                <xsl:element name="{$element}">
                    <xsl:attribute name="type"><xsl:value-of select="$attribut"/></xsl:attribute>
                    <xsl:element name="choice">
                        <xsl:element name="orig">
                            <xsl:value-of select="."/>
                        </xsl:element>
                        <xsl:element name="reg">
                            <xsl:value-of select="following-sibling::node()[1]"/>
                            <xsl:if test="following-sibling::node()[2][contains(name(), $same)]">
                                <xsl:value-of select="following-sibling::node()[2]"/>
                            </xsl:if>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="{$element}">
                    <xsl:attribute name="type"><xsl:value-of select="$attribut"/></xsl:attribute>
                    <xsl:element name="choice">
                        <xsl:element name="orig">
                            <xsl:value-of select="."/>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="node()[contains(name(), '_2_reg')]">
        <xsl:variable name="element" select="substring-before(name(), '.')"/>
        <xsl:variable name="attribut" select="substring-before(substring-after(name(), '.'), '_2_')"/>
        <xsl:variable name="same">
            <xsl:value-of select="$element"/>
            <xsl:text>.</xsl:text>
            <xsl:value-of select="$attribut"/>
            <xsl:text>_2_orig</xsl:text>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="preceding-sibling::node()[1][contains(name(), $same)]"/>
            <xsl:when test="name() = preceding-sibling::*[1]/name()"/>
            <xsl:otherwise>
                <xsl:element name="{$element}">
                    <xsl:attribute name="type">
                        <xsl:value-of select="$attribut"/>
                    </xsl:attribute>
                    <xsl:element name="choice">
                        <xsl:element name="reg">
                            <xsl:apply-templates/>
                            <xsl:if test="name() = following-sibling::*[1]/name()">
                                <xsl:value-of select="following-sibling::node()"/>
                            </xsl:if>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- 3. Pour les autres éléments sans <choice> : <_3_element> -->

    <xsl:template match="node()[contains(name(), '_3_')]">
        <xsl:choose>
            <xsl:when test=".[contains(name(), '.')]">
                <xsl:element name="{substring-before(substring-after(name(), '_3_'), '.')}">
                    <xsl:attribute name="type">
                        <xsl:value-of select="substring-after(name(), '.')"/>
                    </xsl:attribute>
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="{substring-after(name(), '_3_')}">
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- 4. Pour les autres éléments imbriqués sans <choice> : <element1_4_element2> -->

    <xsl:template match="node()[contains(name(), '_4_')]">
        <xsl:for-each select=".">
            <xsl:variable name="same" select="substring-before(name(), '_4_')"/>
            <xsl:if test="./following-sibling::node()[contains(name(), $same)]">
                <xsl:element name="{$same}">
                    <xsl:element name="{substring-after(.[contains(name(), $same)]/name(), '_4_')}">
                        <xsl:apply-templates/>
                    </xsl:element>
                    <xsl:if test="./following-sibling::node()[position()=2][contains(name(), $same)]">
                        <xsl:element name="{substring-after(./following-sibling::node()[position()=2]/name(), '_4_')}">
                            <xsl:value-of select="./following-sibling::node()[position()=2][contains(name(), $same)]"/>
                        </xsl:element>
                    </xsl:if>
                </xsl:element>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
    
    <!-- 6. Cas particuliers : parfois le <choice> continuer <orig> et <reg>, parfois il n'en contient qu'un des deux -->
    
    <xsl:template match="node()[contains(name(), '_3_sic')]">
        <xsl:choose>
            <xsl:when test="following-sibling::node()[1][contains(name(), '_3_corr')]">
                <xsl:element name="choice">
                    <xsl:element name="sic">
                        <xsl:apply-templates/>
                    </xsl:element>
                    <xsl:element name="corr">
                        <xsl:attribute name="resp">NC</xsl:attribute>
                        <xsl:value-of select="following-sibling::node()[1]"/>
                    </xsl:element>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="choice">
                    <xsl:element name="sic">
                        <xsl:apply-templates/>
                    </xsl:element>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="node()[contains(name(), '_3_corr')]">
        <xsl:choose>
            <xsl:when test="preceding-sibling::node()[1][contains(name(), '_3_sic')]"/>
            <xsl:otherwise>
                <xsl:element name="choice">
                    <xsl:element name="corr">
                        <xsl:attribute name="resp">NC</xsl:attribute>
                        <xsl:apply-templates/>
                    </xsl:element>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- 7. Traitement autres -->
    
    <xsl:template match="pb">
        <xsl:element name="pb">
            <xsl:attribute name="n">
                <xsl:value-of select="."/>
            </xsl:attribute>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="lg">
        <xsl:text>       
</xsl:text>
        <xsl:element name="lg">
            <xsl:apply-templates/>
            <xsl:text>     
</xsl:text>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="Footnote/mevital">
        <xsl:element name="hi">
            <xsl:attribute name="rend">i</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="Footnote">
        <xsl:element name="note">
            <xsl:attribute name="n">
                <xsl:value-of select="preceding::note-citation[1]"/>
            </xsl:attribute>
            <xsl:attribute name="resp">NC</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="note-citation"/>

</xsl:stylesheet>
