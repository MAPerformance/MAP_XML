<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="xml" indent="yes" name="xml" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="div[parent::body]">
        <xsl:variable name="ID">
            <xsl:value-of select="@xml:id"/>
        </xsl:variable>
        <xsl:result-document href="xml/{$ID}.xml" format="xml">
            <xsl:element name="TEI">
                <xsl:element name="teiHeader">
                    <xsl:element name="fileDesc">
                        <xsl:element name="titleStmt">
                            <xsl:element name="title">
                                <xsl:value-of
                                    select="./div[@type = 'metadata']/list/item/title/text()"/>
                            </xsl:element>
                            <xsl:copy-of select="ancestor::TEI//respStmt"/>
                        </xsl:element>
                        <xsl:copy-of select="ancestor::TEI//publicationStmt"/>
                        <xsl:copy-of select="ancestor::TEI//sourceDesc"/>
                    </xsl:element>
                    <xsl:copy-of select="ancestor::TEI//revisionDesc"/>
                </xsl:element>
                <xsl:element name="text">
                    <xsl:element name="body">
                        <xsl:copy-of select="." exclude-result-prefixes="#all"/>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>
