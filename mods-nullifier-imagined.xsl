<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:mods="http://www.loc.gov/mods/v3"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:import href="mods-nullifier-custom.xsl"/>
    
    <!-- IMAGINED - Put physical description note in field_note, prefixed by "Physical description: " -->
    <xsl:template match="mods:mods/mods:physicalDescription/mods:note[@type='physical']/@type"/> 
    <xsl:template match="mods:mods/mods:physicalDescription/mods:note[@type='physical']/text()"/>
    
    <!-- IMAGINED - marcform - ignore -->
    <xsl:template match="mods:mods/mods:physicalDescription/mods:form[@authority='marcform']/@authority"/>
    
    <!-- IMAGINED - map scale -->
    <xsl:template match="mods:mods/mods:subject/mods:cartographics/mods:scale/text()"/>
    
    <!-- IMAGINED - physical location -->
    <xsl:template match="mods:mods/mods:location/mods:physicalLocation/text()"/>
    
    <!-- IMAGINED - page range -->
    <xsl:template match="mods:mods/mods:part/mods:extent[@unit='pages']/(mods:start | mods:end)"/>
    <xsl:template match="mods:mods/mods:part/mods:extent[@unit='pages']/@unit"/>
    
    <!-- IMAGINED - empty lctgm genres -->
    <xsl:template match="mods:mods/mods:genre[@authority='lcgtm']/@authority"/>
    
    <!-- IMAGINED - PEIMHF identifiers -->
    <xsl:template match="mods:mods/mods:identifier[@type='peimhf']/(text() | @type)"/>
    
    <!-- IMAGINED - PEIMHF subjects -->
    <xsl:template match="mods:mods/mods:subject[@authority='peimhf']/@authority"/>
    
    <!-- TODO fix all these. -->
    <xsl:template match="mods:mods/mods:subject[@authority='paro']/@authority"/> <!-- what is paro? -->
    <xsl:template match="mods:mods/mods:identifier[@type='paro']/@type"/> <!-- what is paro? -->
    <xsl:template match="mods:mods/mods:genre[@authority='aat']/@authority"/> <!-- inconsistent terms -->
    <xsl:template match="mods:mods/mods:accessCondition[@type='useAndReproduction' or @type='restrictionOnAccess']/@type"/> <!-- ignore these? -->
    
    <xsl:template match="mods:mods/mods:relatedItem"></xsl:template>
    
    
    
</xsl:stylesheet>