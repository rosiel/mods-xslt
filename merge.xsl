<?xml version="1.0" encoding="UTF-8"?>
<!-- this is from https://www.oxygenxml.com/forum/general-xml-questions/topic11375.html -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:mods="http://www.loc.gov/mods/v3">

    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>

    <xsl:template match="/">
        
        <mods:modsCollection xmlns="http://www.loc.gov/mods/v3"
            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
            
            <xsl:variable name="folderURI" select="resolve-uri('.',base-uri())"/>
            
            <xsl:for-each select="collection(concat($folderURI, '?select=*.xml;recurse=yes'))">
                
                <xsl:apply-templates mode="copy" select="."/>
                
            </xsl:for-each>
            
        </mods:modsCollection>
    </xsl:template>
    
    <!-- Deep copy template -->
    
    <xsl:template match="node()|@*" mode="copy">
        
        <xsl:copy>
            
            <xsl:apply-templates mode="copy" select="@*"/>
            
            <xsl:apply-templates mode="copy"/>
            
        </xsl:copy>
        
    </xsl:template>
    
    
    <!-- Handle default matching -->
    
    <xsl:template match="*"/>

</xsl:stylesheet>
