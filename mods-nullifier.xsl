<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:mods="http://www.loc.gov/mods/v3"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
    xmlns="http://www.loc.gov/mods/v3"
    exclude-result-prefixes="xs mods xsi" version="2.0">

    <xsl:strip-space elements="*"/>

    <!-- IdentityTransform  from http://www.usingxml.com/Transforms/XslIdentity -->
    <xsl:output indent="yes"/>
    <xsl:template match="/ | @* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="mods:mods">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
            <xsl:element name="file"><xsl:value-of select="tokenize(base-uri(),'/')[last()]"/></xsl:element>
            
        </xsl:copy>
    </xsl:template>

    <!-- Start Metadata extraction -->
    <!-- Elements matched here will not be part of the output. -->

    <xsl:template match="@*[name() = 'xsi:schemaLocation']"/>
    <xsl:template match="mods:mods/(@version)"></xsl:template>

    <xsl:template match="mods:mods/mods:titleInfo[not(@type)][1]/mods:nonSort[1]/text()"/>
    <xsl:template match="mods:mods/mods:titleInfo[not(@type)][1]/mods:title[1]/text()"/>
    <xsl:template match="mods:mods/mods:titleInfo[not(@type)][1]/mods:subTitle[1]/text()"/>
    <xsl:template match="mods:mods/mods:titleInfo[not(@type)][1]/mods:partNumber[1]/text()"/>
    <xsl:template match="mods:mods/mods:titleInfo[not(@type)][1]/mods:partName[1]/text()"/>

    <xsl:template
        match="mods:mods/mods:titleInfo[@type = 'alternative' or @type = 'uniform' or @type = 'abbreviated']/mods:nonSort[1]/text()"/>
    <xsl:template
        match="mods:mods/mods:titleInfo[@type = 'alternative' or @type = 'uniform' or @type = 'abbreviated']/mods:title[1]/text()"/>
    <xsl:template
        match="mods:mods/mods:titleInfo[@type = 'alternative' or @type = 'uniform' or @type = 'abbreviated']/mods:subTitle[1]/text()"/>
    <xsl:template
        match="mods:mods/mods:titleInfo[@type = 'alternative' or @type = 'uniform' or @type = 'abbreviated']/mods:partNumber[1]/text()"/>
    <xsl:template
        match="mods:mods/mods:titleInfo[@type = 'alternative' or @type = 'uniform' or @type = 'abbreviated']/mods:partName[1]/text()"/>
    <xsl:template
        match="mods:mods/mods:titleInfo[@type = 'alternative' or @type = 'uniform' or @type = 'abbreviated']/@type"/>

    <xsl:template match="mods:mods/mods:titleInfo[@type = 'translated']/mods:nonSort/text()"/>
    <xsl:template match="mods:mods/mods:titleInfo[@type = 'translated']/mods:title/text()"/>
    <xsl:template match="mods:mods/mods:titleInfo[@type = 'translated']/mods:subTitle/text()"/>
    <xsl:template match="mods:mods/mods:titleInfo[@type = 'translated']/mods:partNumber/text()"/>
    <xsl:template match="mods:mods/mods:titleInfo[@type = 'translated']/mods:partName/text()"/>
    <xsl:template match="mods:mods/mods:titleInfo[@type = 'translated']/(@type | @xml:lang)"/>



    <xsl:template
        match="mods:mods/mods:name[@type = 'personal' or @type = 'corporate' or @type = 'family']/@type"/>
    <xsl:template
        match="mods:mods/mods:name[@type = 'personal' or @type = 'corporate' or @type = 'family']/mods:namePart/text()"/>
    <xsl:template
        match="mods:mods/mods:name[@type = 'personal' or @type = 'corporate' or @type = 'family']/mods:namePart/@type"/>
    <xsl:template
        match="mods:mods/mods:name[@type = 'personal' or @type = 'corporate' or @type = 'family']/mods:role/mods:roleTerm[@authority = 'marcrelator' and @type = 'code']/(@authority | @type)"/>
    <xsl:template
        match="mods:mods/mods:name[@type = 'personal' or @type = 'corporate' or @type = 'family']/mods:role/mods:roleTerm[@authority = 'marcrelator' and @type = 'code']/text()"/>
    <xsl:template
        match="mods:mods/mods:name[@type = 'personal' or @type = 'corporate' or @type = 'family']/mods:role/mods:roleTerm[@authority = 'marcrelator' and @type = 'text']/(@authority | @type)"/>
    <xsl:template
        match="mods:mods/mods:name[@type = 'personal' or @type = 'corporate' or @type = 'family']/mods:role/mods:roleTerm[@authority = 'marcrelator' and @type = 'text']/text()"/>


    <xsl:template match="mods:mods/mods:typeOfResource/text()"/>
    <xsl:template match="mods:mods/mods:typeOfResource/@collection"/>

    <xsl:template
        match="mods:mods/mods:originInfo/mods:place/mods:placeTerm[@authority = 'marccountry' and @type = 'code']/text()"/>
    <xsl:template
        match="mods:mods/mods:originInfo/mods:place/mods:placeTerm[@authority = 'marccountry' and @type = 'code']/@authority"/>
    <xsl:template
        match="mods:mods/mods:originInfo/mods:place/mods:placeTerm[@authority = 'marccountry' and @type = 'code']/@type"/>

    <xsl:template
        match="mods:mods/mods:originInfo/mods:place/mods:placeTerm[not(@authority) and @type = 'text']/text()"/>
    <xsl:template
        match="mods:mods/mods:originInfo/mods:place/mods:placeTerm[not(@authority) and @type = 'text']/@type"/>

    <xsl:template match="mods:genre/text()"/>

    <xsl:template match="mods:mods/mods:originInfo/mods:publisher/text()"/>
    <xsl:template match="mods:mods/mods:originInfo/mods:dateIssued/text()"/>
    <xsl:template match="mods:mods/mods:originInfo/mods:dateCreated/text()"/>
    <xsl:template match="mods:mods/mods:originInfo/mods:dateValid/text()"/>
    <xsl:template match="mods:mods/mods:originInfo/mods:dateCaptured/text()"/>
    <xsl:template match="mods:mods/mods:originInfo/mods:dateModified/text()"/>
    <xsl:template match="mods:mods/mods:originInfo/mods:copyrightDate/text()"/>
    <xsl:template match="mods:mods/mods:originInfo/mods:dateOther/text()"/>

    <xsl:template match="mods:mods/mods:originInfo/mods:frequency/text()"/>
    <xsl:template match="mods:mods/mods:originInfo/mods:issuance/text()"/>
    <xsl:template match="mods:mods/mods:originInfo/mods:edition/text()"/>


    <xsl:template match="mods:languageTerm[@type = 'text']/text()"/>
    <xsl:template match="mods:languageTerm[@type = 'text']/@type"/>
    <xsl:template match="mods:languageTerm[@authority = 'iso639-2b' and @type = 'code']/text()"/>
    
    <xsl:template match="mods:languageTerm[@authority = 'iso639-2b' and @type = 'code']/(@authority | @type)"/>

    <xsl:template match="mods:mods/mods:physicalDescription/mods:form/text()"/>
    <xsl:template match="mods:mods/mods:physicalDescription/mods:extent/text()"/>
    <xsl:template match="mods:mods/mods:physicalDescription/mods:internetMediaType/text()"/>

    <xsl:template match="mods:mods/mods:abstract/text()"/>

    <xsl:template match="mods:mods/mods:tableOfContents/text()"/>


    <xsl:template match="mods:mods/mods:note/text()"/>
    <xsl:template match="mods:mods/mods:note/@displayLabel"/>
    <xsl:template match="mods:mods/mods:note/@type"/>

    <xsl:template match="mods:mods/mods:subject/mods:topic/text()"/>
    <xsl:template
        match="mods:mods/mods:subject/mods:name[count(mods:namePart) = 1]/mods:namePart/text()"/>
    <xsl:template
        match="mods:mods/mods:subject/mods:name/mods:namePart[@type = 'given' or @type = 'family' or @type = 'date']/text()"/>
    <xsl:template
        match="mods:mods/mods:subject/mods:name/mods:namePart[@type = 'given' or @type = 'family' or @type = 'date']/@type"/>
    <xsl:template match="mods:mods/mods:subject/mods:geographic/text()"/>
    <xsl:template
        match="mods:mods/mods:subject/mods:hierarchicalGeographic/(mods:continent | mods:country | mods:province | mods:region | mods:state | mods:territory | mods:county | mods:city | mods:citySection | mods:island | mods:area)/text()"/>
    <xsl:template match="mods:mods/mods:subject/mods:cartographics/mods:coordinates/text()"/>
    <xsl:template match="mods:mods/mods:subject/mods:temporal/text()"/>

    <xsl:template match="mods:mods/mods:classification/text()"/>
    <xsl:template
        match="mods:mods/mods:classification[@authority = 'lcc' or @authority = 'ddc']/@authority"/>


    <xsl:template match="mods:mods/mods:identifier/text()"/>
    <xsl:template
        match="mods:mods/mods:identifier[@type = 'isbn' or @type = 'oclc' or @type = 'local']/@type"/>

    <xsl:template match="mods:accessCondition/text()"/>

</xsl:stylesheet>
