<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    
    <xsl:output method="html" indent="yes" name="html" encoding="UTF-8"/>
    
    <xsl:template match="div[parent::body]">
        <xsl:variable name="ID">
            <xsl:value-of select="@xml:id"/>
        </xsl:variable>
        <xsl:result-document href="{$ID}.html" format="html">
            <xsl:element name="html">
                <xsl:element name="head">
                    <xsl:element name="title"><xsl:text>MAPerformance</xsl:text></xsl:element>
                    <xsl:element name="link">
                        <xsl:attribute name="rel">
                            <xsl:text>stylesheet</xsl:text>
                        </xsl:attribute>
                        <xsl:attribute name="href">
                            <xsl:text>../css/MAPerformance.css</xsl:text>
                        </xsl:attribute>
                    </xsl:element>
                </xsl:element>
                <xsl:element name="body">
                    <xsl:element name="h1">
                        <xsl:value-of select="ab/title"/>
                    </xsl:element>
                    <xsl:element name="div">
                        <xsl:attribute name="class">
                            <xsl:text>info</xsl:text>
                        </xsl:attribute>
                        <xsl:if test="ab/location/settlement/text()">
                            <xsl:text>Lieu: </xsl:text><xsl:value-of select="ab/location/settlement"/><br/>
                        </xsl:if>
                        <xsl:if test="ab/location/region/text()">
                            <xsl:text>Région: </xsl:text><xsl:value-of select="ab/location/region"/><br/>
                        </xsl:if>
                        <xsl:if test="ab/location/country/text()">
                            <xsl:text>Pays: </xsl:text><xsl:value-of select="ab/location/country"/><br/>
                        </xsl:if>
                        <xsl:text>Date: </xsl:text>
                        <xsl:if test="ab/date/@when">
                            <xsl:value-of select="ab/date/@when"/><br/>
                        </xsl:if>
                        <xsl:if test="ab/date/@from">
                            <xsl:value-of select="ab/date/@from"/><xsl:text>-</xsl:text><xsl:value-of select="ab/date/@to"/><br/>
                        </xsl:if>
                        
                        <!-- Mots clefs -->
                        <xsl:text>Informations clefs:</xsl:text><br/>
                        <xsl:element name="ul">
                            <xsl:attribute name="class">
                                <xsl:text>keywords</xsl:text>
                            </xsl:attribute>
                            <xsl:if test="list[@type='General']/item/text()">
                                <xsl:element name="li">
                                    <xsl:for-each select="list[@type='General']/item">
                                        <xsl:value-of select="."/>
                                        <xsl:text> // </xsl:text>
                                    </xsl:for-each>
                                </xsl:element>
                            </xsl:if>
                            <xsl:if test="list[@type='Time']/item/text()">
                                <xsl:element name="li">
                                    <xsl:for-each select="list[@type='Time']/item">
                                        <xsl:value-of select="."/>
                                        <xsl:text> // </xsl:text>
                                    </xsl:for-each>
                                </xsl:element>
                            </xsl:if>
                            <xsl:if test="list[@type='People']/item/text()">
                                <xsl:element name="li">
                                    <xsl:for-each select="list[@type='People']/item">
                                        <xsl:value-of select="."/>
                                        <xsl:text> // </xsl:text>
                                    </xsl:for-each>
                                </xsl:element>
                            </xsl:if>
                            <xsl:if test="list[@type='Location']/item/text()">
                                <xsl:element name="li">
                                    <xsl:for-each select="list[@type='Location']/item">
                                        <xsl:value-of select="."/>
                                        <xsl:text> // </xsl:text>
                                    </xsl:for-each>
                                </xsl:element>
                            </xsl:if>
                        </xsl:element>
                        
                        <!-- Comm. et bibliographie -->
                        <xsl:if test="note/text()">
                            <xsl:element name="div">
                                <xsl:attribute name="class">
                                    <xsl:text>commentaries</xsl:text>
                                </xsl:attribute>
                                <xsl:text>Remarques: </xsl:text>
                                <xsl:value-of select="note"/>
                            </xsl:element>
                        </xsl:if>
                        <xsl:if test="listBibl/bibl/text()">
                            <xsl:element name="div">
                                <xsl:attribute name="class">
                                    <xsl:text>bibliography</xsl:text>
                                </xsl:attribute>
                                <xsl:text>Bibliographie: </xsl:text>
                                <xsl:for-each select="listBibl/bibl">
                                    <xsl:value-of select="."/>
                                    <xsl:text> // </xsl:text>
                                </xsl:for-each>
                            </xsl:element>
                        </xsl:if>
                    </xsl:element>
                    
                    <!-- Doc -->
                    <xsl:if test="div[@type='Documentation']">
                        <xsl:element name="div">
                            <xsl:attribute name="class">
                                <xsl:text>Documentation</xsl:text>
                            </xsl:attribute>
                            <xsl:element name="h2">
                                <xsl:value-of select="div/div/head"/>
                            </xsl:element>
                            <xsl:element name="div">
                                <xsl:attribute name="class">
                                    <xsl:text>transcription</xsl:text>
                                </xsl:attribute>
                                <xsl:value-of select="div/div/div[@type='transcription']"/>
                            </xsl:element>
                            <xsl:element name="div">
                                <xsl:attribute name="class">
                                    <xsl:text>translation</xsl:text>
                                </xsl:attribute>
                                <xsl:value-of select="div/div/div[@type='translation']"/>
                            </xsl:element>
                        </xsl:element>
                    </xsl:if>
                </xsl:element>
            </xsl:element>
        </xsl:result-document>
    </xsl:template>
    
</xsl:stylesheet>