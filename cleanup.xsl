<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:template match="*[descendant::text() or descendant-or-self::*/@*[string()]]">
        <xsl:copy>
            <xsl:apply-templates select="node()[string-length(normalize-space(.))!=0 or descendant-or-self::*/@*[string()]]|@*"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="@*[string()]">
        <xsl:copy/>
    </xsl:template>
    
</xsl:stylesheet>