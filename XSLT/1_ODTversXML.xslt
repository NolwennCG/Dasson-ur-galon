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
    <xsl:template match="/">
        <xsl:text>
</xsl:text>
        <text>
            <body>
                <xsl:apply-templates/>
            </body>
        </text>
    </xsl:template>

    <xsl:template match="*">
        <xsl:element name="{name()}">
            <xsl:for-each select="./@*">
                <xsl:attribute name="{name()}">
                    <xsl:value-of select="."/>
                </xsl:attribute>
            </xsl:for-each>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>


    <!-- élément supprimés -->
    <xsl:template
        match="text:s | office:scripts | office:forms | office:font-face-decls | office:automatic-styles | text:sequence-decls | text:bookmark-start | text:tracked-changes | text:changed-region | text:deletion | text:change | text:change-start | text:change-end | text:soft-page-break"/>
    <!-- |  |  |  |  |  |  |  |  |  |  |  -->

    <!-- balises englobantes supprimées -->
    <xsl:template
        match="text:note | text:note-body | office:document-content | office:body | office:text">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="text:h">
        <xsl:variable name="element">
            <xsl:text>h</xsl:text>
            <xsl:value-of select="@text:outline-level"/>
        </xsl:variable>
        <xsl:text>
        
</xsl:text>
        <xsl:element name="{$element}">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="text:note-citation">
        <xsl:element name="note-citation">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <!-- élément text:p -->
    <xsl:template match="text:p">
        <xsl:choose>
            <xsl:when test="contains(., 'lg')">
                <xsl:value-of select="." disable-output-escaping="yes"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>
</xsl:text>
                <!--<xsl:variable name="StyleEnCours" select="./@text:style-name"/>-->
                <xsl:variable name="StyP" select="./@text:style-name"/>
                <xsl:variable name="StyleEnCours">
                    <xsl:choose>
                        <xsl:when test="contains($StyP, '_5f_')">
                            <xsl:value-of select="substring-before($StyP, '_5f_')"/>
                            <xsl:text>_</xsl:text>
                            <xsl:value-of select="substring-after($StyP, '_5f_')"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="$StyP"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>

                <xsl:variable name="Balise">
                    <xsl:choose>
                        <xsl:when
                            test="/office:document-content/office:automatic-styles/style:style/@style:name = ./@text:style-name">
                            <xsl:value-of
                                select="/office:document-content/office:automatic-styles/style:style[@style:name = $StyleEnCours]/@style:parent-style-name"
                            />
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="./@text:style-name"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:variable name="element">
                    <xsl:value-of select="replace($Balise, '(_f_)|(_5f_)|(-)', '_')"/>
                </xsl:variable>
                <xsl:element name="{$element}">
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>

    </xsl:template>


    <!-- élément text:span -->
    <xsl:template match="text:span">
        <!--<xsl:variable name="StyCarEnCours" select="./@text:style-name"/>-->
        <xsl:variable name="StyCar" select="./@text:style-name"/>
        <xsl:variable name="StyCarEnCours">
            <xsl:choose>
                <xsl:when test="contains($StyCar, '_5f_')">
                    <xsl:value-of select="substring-before($StyCar, '_5f_')"/>
                    <xsl:text>_</xsl:text>
                    <xsl:value-of select="substring-after($StyCar, '_5f_')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$StyCar"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="Balise">
            <xsl:choose>
                <xsl:when
                    test="/office:document-content/office:automatic-styles/style:style[@style:name = $StyCarEnCours]/@style:parent-style-name">
                    <xsl:value-of
                        select="/office:document-content/office:automatic-styles/style:style[@style:name = $StyCarEnCours]/@style:parent-style-name"
                    />
                </xsl:when>
                <xsl:when
                    test="/office:document-content/office:automatic-styles/style:style[@style:name = $StyCarEnCours]/style:text-properties/@fo:font-variant = 'small-caps'"
                    >mevpc</xsl:when>
                <xsl:when
                    test="/office:document-content/office:automatic-styles/style:style[@style:name = $StyCarEnCours]/style:text-properties/@style:text-position = 'super 58%'"
                    >mevexp</xsl:when>
                <xsl:when
                    test="/office:document-content/office:automatic-styles/style:style[@style:name = $StyCarEnCours]/style:text-properties/@fo:font-style = 'italic'"
                    >mevital</xsl:when>
                <!--<xsl:when test="/office:document-content/office:automatic-styles/style:style[@style:name = $StyCarEnCours]/style:text-properties/@style:font-style-complex = 'italic'"></xsl:when>-->
                <xsl:when
                    test="/office:document-content/office:automatic-styles/style:style[@style:name = $StyCarEnCours]/style:text-properties/@fo:font-weight = 'bold'"
                    >mevgras</xsl:when>
                <xsl:when
                    test="/office:document-content/office:automatic-styles/style:style[@style:name = $StyCarEnCours]/style:text-properties/@fo:font-size"/>
                <xsl:when
                    test="/office:document-content/office:automatic-styles/style:style[@style:name = $StyCarEnCours]/style:text-properties/@style:font-weight-complex = 'bold'"/>
                <xsl:when
                    test="/office:document-content/office:automatic-styles/style:style[@style:name = $StyCarEnCours]/style:text-properties/@style:font-name = 'Arial'"/>
                <xsl:when
                    test="/office:document-content/office:automatic-styles/style:style[@style:name = $StyCarEnCours]/style:text-properties/@style:font-name = 'Times New Roman'"/>
                <xsl:when
                    test="/office:document-content/office:automatic-styles/style:style[@style:name = $StyCarEnCours]/style:text-properties/@style:font-name = 'Courier New'"/>
                <xsl:when
                    test="/office:document-content/office:automatic-styles/style:style[@style:name = $StyCarEnCours]/style:text-properties/@fo:language"/>
                <xsl:when
                    test="/office:document-content/office:automatic-styles/style:style[@style:name = $StyCarEnCours]/style:text-properties/@style:text-underline-style = 'none'"/>
                <xsl:otherwise>
                    <xsl:value-of select="$StyCarEnCours"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="Balise_trans" select="translate($Balise, '5', '')"/>
        <xsl:choose>
            <xsl:when test="$Balise_trans = ''">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="{replace($Balise_trans, '(_f_)|(_5f_)|(-)', '_')}">
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="text:line-break">
        <xsl:element name="lb"/>
    </xsl:template>

    <!-- tableau -->
    <xsl:template match="table:table">
        <xsl:element name="table">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="table:table-row">
        <xsl:element name="tr">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="table:table-cell">
        <xsl:element name="td">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="table:table-column"/>
    
    <!-- élément text:a -->
    <xsl:template match="text:a">
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="@xlink:href"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <!-- élément text:list -->
    <xsl:template match="text:list">
        <xsl:element name="ul">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="text:list-item">
        <xsl:element name="li">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <!-- élément text:bibliography-mark -->
    <xsl:template match="bibliography-mark">
        <xsl:variable name="type" select="@bibliography-type"/>
        <xsl:variable name="text" select="text()"/>
        <xsl:variable name="longueur" select="(string-length($text))-2"/>
        <xsl:element name="span">
            <xsl:attribute name="title">
                <xsl:choose>
                    <!--non publié-->
                    <xsl:when test="$type = 'unpublished'">
                        <xsl:if test="@author"><xsl:value-of select="@author"/></xsl:if>
                        <xsl:if test="@year"> <xsl:text> (</xsl:text><xsl:value-of select="@year"/><xsl:text>). </xsl:text></xsl:if>
                        <xsl:if test="@title"><xsl:value-of select="@title"/></xsl:if>
                        <xsl:text>. </xsl:text>
                    </xsl:when>
                    <!--livre-->
                    <xsl:when test="$type = 'book'">
                        <xsl:if test="@author"><xsl:value-of select="@author"/></xsl:if>
                        <xsl:if test="@year"><xsl:text> (</xsl:text><xsl:value-of select="@year"/><xsl:text>)</xsl:text></xsl:if><xsl:text>. </xsl:text>
                        <xsl:if test="@title"><xsl:value-of select="@title"/><xsl:text>. </xsl:text></xsl:if>
                        <xsl:if test="@address"><xsl:value-of select="@address"/><xsl:text> : </xsl:text></xsl:if>
                        <xsl:if test="@publisher"><xsl:value-of select="@publisher"/></xsl:if>
                        <xsl:text>. </xsl:text>
                    </xsl:when>
                    <!--www-->
                    <xsl:when test="$type = 'www'">
                        <xsl:if test="@publisher"><xsl:value-of select="@publisher"/><xsl:text>. </xsl:text></xsl:if>
                        <xsl:if test="@title"><xsl:value-of select="@title"/><xsl:text> [en ligne]. </xsl:text></xsl:if>
                        <xsl:if test="@url"><xsl:text>Disponible sur : &lt;</xsl:text><xsl:value-of select="@url"/><xsl:text>&gt;</xsl:text></xsl:if>
                        <xsl:text>.</xsl:text>
                    </xsl:when>
                    <!--magazine-->
                    <xsl:when test="$type = 'journal'">
                        <xsl:if test="@author"><xsl:value-of select="@author"/></xsl:if>
                        <xsl:if test="@year"><xsl:text> (</xsl:text><xsl:value-of select="@year"/><xsl:text>)</xsl:text></xsl:if><xsl:text>. </xsl:text>
                        <xsl:if test="@title"><xsl:value-of select="@title"/><xsl:text>, </xsl:text></xsl:if>
                        <xsl:if test="@number"><xsl:value-of select="@number"/></xsl:if>
                        <xsl:text>. </xsl:text>
                    </xsl:when>
                    <!--thèse-->
                    <xsl:when test="$type = 'phdthesis'">
                        <xsl:if test="@author"><xsl:value-of select="@author"/></xsl:if>
                        <xsl:if test="@year"><xsl:text> (</xsl:text><xsl:value-of select="@year"/><xsl:text>)</xsl:text></xsl:if><xsl:text>. </xsl:text>
                        <xsl:if test="@title"><xsl:value-of select="@title"/><xsl:text>. Thèse de doctorat : </xsl:text><xsl:value-of select="@series"/></xsl:if><xsl:text>. </xsl:text>
                        <xsl:if test="@address"><xsl:value-of select="@address"/></xsl:if>
                        <xsl:if test="@publisher"><xsl:text> : </xsl:text><xsl:value-of select="@publisher"/></xsl:if><xsl:text>. </xsl:text>
                    </xsl:when>
                </xsl:choose>    
            </xsl:attribute>
            <xsl:value-of select="substring($text,2,$longueur)"/>
            <xsl:text>,</xsl:text>
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>
