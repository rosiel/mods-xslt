<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:mods="http://www.loc.gov/mods/v3"
    xmlns="http://www.loc.gov/mods/v3"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:import href="mods-extractor-custom.xsl"/>
    
    
    <!-- VOICES - Dutch Thompson - Interviewer -->
    <xsl:template match="mods:mods/mods:name[mods:namePart/(text()='Dutch Thompson' or text()='Thompson, Reg &quot;Dutch&quot;')]">
        <xsl:comment>TODO: Normalize Dutch Thompson's name</xsl:comment>
        <field_linked_agent>
            <xsl:text>relators:ivr:person:</xsl:text>
            <xsl:call-template name="name"></xsl:call-template>
        </field_linked_agent>
    </xsl:template>
    
    <!-- VOICES - Interviewee -->
    <xsl:template match="mods:mods/mods:name[mods:namePart/(text()!='Dutch Thompson' and text()!='Thompson, Reg &quot;Dutch&quot;') and not(role)]">
        <!-- TODO: confirm role is interviewee -->
        <field_linked_agent>
            <xsl:text>relators:ive:person:</xsl:text>
            <xsl:call-template name="name"></xsl:call-template>
        </field_linked_agent>
    </xsl:template>
    
    <!-- VOICES - extent-->
    <xsl:template match="mods:mods/mods:physicalDescription/mods:note">
        <field_extent>
            <xsl:value-of select="text()"/>
        </field_extent>
    </xsl:template>
    
</xsl:stylesheet>