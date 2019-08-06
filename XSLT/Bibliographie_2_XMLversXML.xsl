<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <!-- Pour BIBLIOGRAPHIE. Traitement bibliographie à partir de OpenOffice, Nolwenn CHEVALIER, 2019 -->

    <xsl:strip-space elements="*"/>

    <xsl:template match="/">
        <body>
            <xsl:apply-templates/>
        </body>
    </xsl:template>

    <xsl:template match="bibliography-mark">
        <xsl:variable name="type" select="@bibliography-type"/>
        <xsl:element name="bibl">
            <xsl:choose>

                <xsl:when test="$type = 'unpublished'">
                    <xsl:choose>
                        <!-- author -->
                        <xsl:when test="contains(@author, ',')">
                            <xsl:variable name="author1" select="substring-before(@author, ', ')"/>
                            <xsl:variable name="author2" select="substring-after(@author, ', ')"/>
                            <xsl:element name="author">
                                <surname>
                                    <xsl:value-of select="substring-after($author1, ' ')"/>
                                </surname>
                                <xsl:text> </xsl:text>
                                <forename>
                                    <xsl:value-of select="substring-before($author1, ' ')"/>
                                </forename>
                                <xsl:text>, </xsl:text>
                            </xsl:element>
                            <xsl:element name="author">
                                <surname>
                                    <xsl:value-of select="substring-after($author2, ' ')"/>
                                </surname>
                                <xsl:text> </xsl:text>
                                <forename>
                                    <xsl:value-of select="substring-before($author2, ' ')"/>
                                </forename>
                                <xsl:text>. </xsl:text>
                            </xsl:element>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:element name="author">
                                <surname>
                                    <xsl:value-of select="substring-after(@author, ' ')"/>
                                </surname>
                                <xsl:text> </xsl:text>
                                <forename>
                                    <xsl:value-of select="substring-before(@author, ' ')"/>
                                </forename>
                                <xsl:text>. </xsl:text>
                            </xsl:element>
                        </xsl:otherwise>
                    </xsl:choose>
                    <booktitle>
                        <xsl:value-of select="@title"/>
                    </booktitle>
                    <xsl:text>. </xsl:text>
                    <xsl:text>Non publié, </xsl:text>
                    <date>
                        <xsl:value-of select="@year"/>
                    </date>
                    <xsl:text>, </xsl:text>
                    <biblScope unit="page">
                        <xsl:value-of select="@pages"/>
                    </biblScope>
                    <xsl:text> f.</xsl:text>
                </xsl:when>

                <xsl:when test="$type = 'phdthesis'">
                    <xsl:choose>
                        <!-- author -->
                        <xsl:when test="contains(@author, ',')">
                            <xsl:variable name="author1" select="substring-before(@author, ', ')"/>
                            <xsl:variable name="author2" select="substring-after(@author, ', ')"/>
                            <xsl:element name="author">
                                <surname>
                                    <xsl:value-of select="substring-after($author1, ' ')"/>
                                </surname>
                                <xsl:text> </xsl:text>
                                <forename>
                                    <xsl:value-of select="substring-before($author1, ' ')"/>
                                </forename>
                                <xsl:text>, </xsl:text>
                            </xsl:element>
                            <xsl:element name="author">
                                <surname>
                                    <xsl:value-of select="substring-after($author2, ' ')"/>
                                </surname>
                                <xsl:text> </xsl:text>
                                <forename>
                                    <xsl:value-of select="substring-before($author2, ' ')"/>
                                </forename>
                                <xsl:text>. </xsl:text>
                            </xsl:element>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:element name="author">
                                <surname>
                                    <xsl:value-of select="substring-after(@author, ' ')"/>
                                </surname>
                                <xsl:text> </xsl:text>
                                <forename>
                                    <xsl:value-of select="substring-before(@author, ' ')"/>
                                </forename>
                                <xsl:text>. </xsl:text>
                            </xsl:element>
                        </xsl:otherwise>
                    </xsl:choose>
                    <booktitle>
                        <xsl:value-of select="@title"/>
                    </booktitle>
                    <xsl:text>. </xsl:text>
                    <xsl:text>Thèse de doctorat : </xsl:text>
                    <biblScope unit="discipline">
                        <xsl:value-of select="@series"/>
                    </biblScope>
                    <xsl:text>. </xsl:text>
                    <pubPlace>
                        <xsl:value-of select="@address"/>
                    </pubPlace>
                    <xsl:text> : </xsl:text>
                    <publisher>
                        <xsl:value-of select="@publisher"/>
                    </publisher>
                    <xsl:text>, </xsl:text>
                    <date>
                        <xsl:value-of select="@year"/>
                    </date>
                    <xsl:text>, </xsl:text>
                    <biblScope unit="page">
                        <xsl:value-of select="@pages"/>
                    </biblScope>
                    <xsl:text> f.</xsl:text>
                </xsl:when>

                <xsl:when test="$type = 'journal'">
                    <xsl:choose>
                        <!-- author -->
                        <xsl:when test="contains(@author, ',')">
                            <xsl:variable name="author1" select="substring-before(@author, ', ')"/>
                            <xsl:variable name="author2" select="substring-after(@author, ', ')"/>
                            <xsl:element name="author">
                                <surname>
                                    <xsl:value-of select="substring-after($author1, ' ')"/>
                                </surname>
                                <xsl:text> </xsl:text>
                                <forename>
                                    <xsl:value-of select="substring-before($author1, ' ')"/>
                                </forename>
                                <xsl:text>, </xsl:text>
                            </xsl:element>
                            <xsl:element name="author">
                                <surname>
                                    <xsl:value-of select="substring-after($author2, ' ')"/>
                                </surname>
                                <xsl:text> </xsl:text>
                                <forename>
                                    <xsl:value-of select="substring-before($author2, ' ')"/>
                                </forename>
                                <xsl:text>. </xsl:text>
                            </xsl:element>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:element name="author">
                                <surname>
                                    <xsl:value-of select="substring-after(@author, ' ')"/>
                                </surname>
                                <xsl:text> </xsl:text>
                                <forename>
                                    <xsl:value-of select="substring-before(@author, ' ')"/>
                                </forename>
                                <xsl:text>. </xsl:text>
                            </xsl:element>
                        </xsl:otherwise>
                    </xsl:choose>
                    <articletitle>
                        <xsl:value-of select="@title"/>
                    </articletitle>
                    <xsl:text>. </xsl:text>
                    <booktitle>
                        <xsl:value-of select="@journal"/>
                    </booktitle>
                    <xsl:text>, </xsl:text>
                    <date>
                        <xsl:value-of select="@year"/>
                    </date>
                    <xsl:text>, </xsl:text>
                    <biblScope unit="volume">
                        <xsl:value-of select="@number"/>
                    </biblScope>
                    <xsl:text>, </xsl:text>
                    <biblScope unit="page">
                        <xsl:value-of select="@pages"/>
                    </biblScope>
                    <xsl:text>.</xsl:text>
                </xsl:when>

                <xsl:when test="$type = 'www'">
                    <publisher>
                        <xsl:value-of select="@publisher"/>
                    </publisher>
                    <xsl:text>. </xsl:text>
                    <booktitle>
                        <xsl:value-of select="@title"/>
                    </booktitle>
                    <xsl:text> [en ligne]. </xsl:text>
                    <xsl:text>Disponible sur : &lt;</xsl:text>
                    <url>
                        <xsl:value-of select="@url"/>
                    </url>
                    <xsl:text>&gt; (consulté en 02/2019).</xsl:text>
                </xsl:when>

                <xsl:when test="$type = 'book'">
                    <xsl:choose><!-- author -->
                        <xsl:when test="contains(@author, ',')">
                            <xsl:variable name="author1" select="substring-before(@author, ', ')"/>
                            <xsl:variable name="author2" select="substring-after(@author, ', ')"/>
                            <xsl:element name="author">
                                <surname>
                                    <xsl:value-of select="substring-after($author1, ' ')"/>
                                </surname>
                                <xsl:text> </xsl:text>
                                <forename>
                                    <xsl:value-of select="substring-before($author1, ' ')"/>
                                </forename>
                                <xsl:text>, </xsl:text>
                            </xsl:element>
                            <xsl:element name="author">
                                <surname>
                                    <xsl:value-of select="substring-after($author2, ' ')"/>
                                </surname>
                                <xsl:text> </xsl:text>
                                <forename>
                                    <xsl:value-of select="substring-before($author2, ' ')"/>
                                </forename>
                                <xsl:text>. </xsl:text>
                            </xsl:element>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:element name="author">
                                <surname>
                                    <xsl:value-of select="substring-after(@author, ' ')"/>
                                </surname>
                                <xsl:text> </xsl:text>
                                <forename>
                                    <xsl:value-of select="substring-before(@author, ' ')"/>
                                </forename>
                                <xsl:text>. </xsl:text>
                            </xsl:element>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:choose> <!-- volume -->
                        <xsl:when test="@volume = @*">
                            <booktitle>
                                <xsl:value-of select="@title"/>
                            </booktitle>
                            <xsl:text>, </xsl:text>
                            <xsl:text>tome </xsl:text>
                            <biblScope unit="volume">
                                <xsl:value-of select="@volume"/>
                            </biblScope>
                        </xsl:when>
                        <xsl:otherwise>
                            <booktitle>
                                <xsl:value-of select="@title"/>
                            </booktitle>
                            <xsl:text>. </xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:if test="@edition = @*">
                        <biblScope unit="edition">
                            <xsl:text>(</xsl:text>
                            <xsl:value-of select="@edition"/>
                            <sup>ème</sup>
                            <xsl:text> éd.). </xsl:text>
                        </biblScope>
                    </xsl:if>
                    <pubPlace>
                        <xsl:value-of select="@address"/>
                    </pubPlace>
                    <xsl:text> : </xsl:text>
                    <publisher>
                        <xsl:value-of select="@publisher"/>
                    </publisher>
                    <xsl:text>, </xsl:text>
                    <date>
                        <xsl:value-of select="@year"/>
                    </date>
                    <xsl:text>, </xsl:text>
                    <biblScope unit="page">
                        <xsl:value-of select="@pages"/>
                    </biblScope>
                    <xsl:text> p.</xsl:text>
                    <xsl:if test="@series = @*">
                        <series>
                            <xsl:text> (</xsl:text>
                            <xsl:value-of select="@series"/>
                            <xsl:text>)</xsl:text>
                        </series>
                    </xsl:if>
                </xsl:when>

            </xsl:choose>
        </xsl:element>
    </xsl:template>

    <xsl:template match="h">
        <h2>
            <xsl:apply-templates/>
        </h2>
    </xsl:template>

</xsl:stylesheet>
