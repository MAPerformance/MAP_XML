<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    
    <xsl:output method="text" encoding="UTF-8"/>
    
    <xsl:template match="/">
        <xsl:text>"title",</xsl:text>
        <xsl:text>"place",</xsl:text>
        <xsl:text>"lat",</xsl:text>
        <xsl:text>"lng",</xsl:text>
        <xsl:text>"URL",</xsl:text>
        <xsl:text>"list"</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:for-each select=".//div[parent::body]">
            <xsl:if test="contains(ab/location/geo,',')">
                <xsl:variable name="ID">
                    <xsl:value-of select="@xml:id"/>
                </xsl:variable>
                <xsl:variable name="settlement">
                    <xsl:value-of select="ab/location/settlement"/>
                </xsl:variable>
                    <xsl:text>"</xsl:text><xsl:value-of select="ab/title"/><xsl:text>",</xsl:text>
                    <xsl:text>"</xsl:text><xsl:value-of select="ab/location/settlement"/><xsl:text>",</xsl:text>
                    <xsl:text>"</xsl:text><xsl:value-of select="substring-before(ab/location/geo,',')"/><xsl:text>",</xsl:text>
                    <xsl:text>"</xsl:text><xsl:value-of select="substring-after(ab/location/geo,',')"/><xsl:text>",</xsl:text>
                <!-- <xsl:text>"file:///Users/gabaysimon/GitHub/MAP/MAP_XML/code/</xsl:text><xsl:value-of select="@xml:id"/><xsl:text>.html",</xsl:text> -->
                &lt;h1&gt;<xsl:value-of select="$settlement"/>&lt;/h1&gt;&lt;div style='overflow-y: auto;'&gt;&lt;ol&gt;
                <xsl:for-each select="//settlement">
                    <xsl:variable name="ID2">
                        <xsl:value-of select="../../../@xml:id"/>
                    </xsl:variable>
                    <xsl:if test="text()=$settlement">
                        &lt;li&gt;&lt;i&gt;<xsl:value-of select="../../title"/>&lt;/i&gt; (<xsl:value-of select="../../date/@when|../../date/@from"/>) [&lt;a href='file:///Users/gabaysimon/GitHub/MAP/MAP_XML/code<xsl:value-of select="$ID2"/>.html' target='_blank'&gt;Voir la fiche&lt;/a&gt;]&lt;/li&gt;
                    </xsl:if>
                </xsl:for-each>
                &lt;/ol&gt;&lt;/div&gt;
                <xsl:text>&#10;</xsl:text>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>