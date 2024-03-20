<?xml version="1.0" encoding="UTF-8"?>
<!-- About this stylesheet
        
        This stylesheet imports mods-extractor.xsl so that any template in this file 
        will take precedence over the identical (named or select) template in mods-extractor.xsl.
        
        This is where I put extra matching and extracting code that applies to all of my MODS
        that is not in the MIG mapping. Corresponding templates are added to mods-nullifier-custom.xsl
        to indicate that we've extracted those values.
        
        I have several collections that need special treatment so I created additional files
        named mods-extractor-custom-collectionName.xsl which import this spreadsheet the way this
        spreadsheet imports mods-extractor.xsl
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:mods="http://www.loc.gov/mods/v3"
    xmlns="http://www.loc.gov/mods/v3"
    exclude-result-prefixes="xs"
    version="2.0">

    <xsl:import href="mods-extractor.xsl"/>
    
    <!-- CUSTOM: Name role text is mapped to relator code, even if no authority -->
    <xsl:template name="nameRole">
        <!--relator term, defaults to relators:ctb per mapping -->
        <xsl:choose>
            <xsl:when
                test="mods:role/mods:roleTerm[@authority = 'marcrelator' and @type = 'code']">
                <xsl:value-of
                    select="mods:role/mods:roleTerm[@authority = 'marcrelator' and @type = 'code']/text()"/>
                <xsl:text>:</xsl:text>
            </xsl:when>
            <!-- CUSTOM: Here's where name role text is mapped to relator code, even if no authority -->
            <xsl:when
                test="mods:role/mods:roleTerm[@type = 'text']">
                <xsl:variable name="roleText"
                    select="mods:role/mods:roleTerm[@type = 'text']/text()"/>
                <xsl:variable name="roleText"
                    select="concat(upper-case(substring($roleText, 1, 1)), substring($roleText, 2))"/>
                <xsl:variable name="roleCode"
                    select="document('relators.xml')/relators/relator[text() = $roleText]/@code"/>
                <xsl:choose>
                    <xsl:when test="$roleCode">
                        <xsl:value-of select="$roleCode"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:comment>DATA ERROR: Relator text could not be found in code list.</xsl:comment>
                        <xsl:value-of select="$roleText"/>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:text>:</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>relators:ctb</xsl:text>
                <xsl:text>:</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
</xsl:stylesheet>