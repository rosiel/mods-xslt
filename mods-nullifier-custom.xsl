<?xml version="1.0" encoding="UTF-8"?>
<!-- About this stylesheet
    
    This stylesheet removes text elements and attributes that are in mods-extractor-custom.xsl.
    It imports mods-nullifier.xsl so that templates in this stylesheet will override
    templates with the same name or select values in mods-nullifier.xsl.
    
    See mods-nullifier.xsl for more details.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:mods="http://www.loc.gov/mods/v3"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:import href="mods-nullifier.xsl"/>
    
    <!-- CUSTOM: Name role text is mapped to relator code, even if no authority -->
    <xsl:template match="mods:role/mods:roleTerm[@type = 'text']/(@type | text())"/>
    
    <!-- CUSTOM: ignore accessCondition type -->
    <xsl:template match="mods:mods/mods:accessCondition[@type='useAndReproduction' or @type='restrictionOnAccess']/@type"/>
    
    <!-- CUSTOM: ignore recordInfo -->
    <xsl:template match="mods:mods/mods:recordInfo"/>
    
    

</xsl:stylesheet>