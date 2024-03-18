<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:mods="http://www.loc.gov/mods/v3"
    xmlns="http://www.loc.gov/mods/v3"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:import href="mods-extractor-custom.xsl"/>
    
    <!-- Put physical description note in field_note, prefixed by "Physical description: " -->
    <xsl:template match="mods:mods/mods:physicalDescription/mods:note[@type='physical']">
        <field_note>
            <xsl:text>Physical description: </xsl:text>
            <xsl:value-of select="normalize-space(.)"/>
        </field_note>
    </xsl:template>
    
    <!-- IMAGEINED - map scale -->
    <xsl:template match="mods:mods/mods:subject/mods:cartographics/mods:scale">
        <field_map_scale>
            <xsl:value-of select="normalize-space(.)" />
        </field_map_scale>
    </xsl:template>
    
    <!-- IMAGINED - physical location -->
    <xsl:template match="mods:mods/mods:location/mods:physicalLocation">
        <field_physical_location>
            <xsl:value-of select="normalize-space(.)" />
        </field_physical_location>
    </xsl:template>
    
    <!-- IMAGINED - part pages -->
    <xsl:template match="mods:mods/mods:part/mods:extent[@unit='pages']">
        <field_page_range>
            <xsl:for-each select="mods:start | mods:end">
                <xsl:value-of select="normalize-space()"/>
                <xsl:if test="(text() and position() != last())">-</xsl:if>
            </xsl:for-each>
            
        </field_page_range>
    </xsl:template>
    
    <!-- IMAGINED - PEIMHF identifiers -->
    <xsl:template match="mods:mods/mods:identifier[@type='peimhf']">
        <field_identifier_peimhf>
            <xsl:value-of select="text()"/>
        </field_identifier_peimhf>
    </xsl:template>
    
</xsl:stylesheet>