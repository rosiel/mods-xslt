<?xml version="1.0" encoding="UTF-8"?>
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