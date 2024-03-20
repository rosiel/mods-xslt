<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:mods="http://www.loc.gov/mods/v3"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:import href="mods-nullifier-custom.xsl"/>
    
    <!-- VOICES - Dutch Thompson - Interviewer -->
    <xsl:template match="mods:mods/mods:name[mods:namePart/text()='Dutch Thompson']/mods:namePart/text()"/>
    
    <!-- VOICES - IGNORE that 'sound' is a dublin core type. -->
    <xsl:template match="mods:genre[@authority='dct' and text()='sound']/@authority"/>

    <!-- VOICES - extent -->
    <xsl:template match="mods:mods/mods:physicalDescription/mods:note/text()"/>
    
    <!-- TODO fix all these. -->
    <xsl:template match="mods:mods/mods:subject[@authority='paro']/@authority"/>
    <xsl:template match="mods:mods/mods:identifier[@type='paro']/@type"/>
    <xsl:template match="mods:mods/mods:genre[@authority='aat']/@authority"/>
    <xsl:template match="mods:mods/mods:physicalDescription/mods:note[@type='physical']/@type"/>
    <xsl:template match="mods:mods/mods:physicalDescription/mods:note[@type='physical']/text()"/>
    <xsl:template match="mods:mods/mods:physicalDescription/mods:form[@authority='marcform']/@authority"/>
    <xsl:template match="mods:mods/mods:subject/mods:cartographics/mods:scale/text()"/>
    <xsl:template match="mods:mods/mods:location/mods:physicalLocation/text()"/>
    
 

</xsl:stylesheet>