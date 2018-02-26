<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes="#all" version="2.0">  
  <xsl:output method="xml" encoding="UTF-8"/>
  <!--The identity template for the default transformation:-->
  <xsl:template match="node()|@*"> 
    <xsl:copy> 
      <xsl:apply-templates select="node()|@*"/> 
    </xsl:copy> 
  </xsl:template>
  <!--Remove all worm elements:-->
  <xsl:template match="//worm"/>
  <!--Rename non-green fruits-->
  <xsl:template match="/basket/fruits/*[not(@color='green')]">
    <trash>
      <xsl:apply-templates select="node()|@*"/>
    </trash>
  </xsl:template>
  <!--Add "extraQuality" attribute to pears:-->
  <xsl:template match="//pear[@weight &gt; 100 and @shinyness&gt;1]">
    <xsl:copy>
      <xsl:attribute select="'true'" name="extraQuality"/>
      <xsl:apply-templates select="node()|@*"/>
    </xsl:copy>
  </xsl:template>
  <!--Add grossWeight element to basket:-->
  <xsl:template match="/basket">
    <xsl:copy>
      <grossWeight>
        <xsl:value-of select="sum(fruits/*/@weight)"/>
      </grossWeight>
      <xsl:apply-templates select="node()|@*"/>
    </xsl:copy>
  </xsl:template> 
</xsl:stylesheet>