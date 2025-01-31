<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="@*|node()">
  <xsl:copy>
    <xsl:apply-templates select="@*|node()"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="classpath">
  <xsl:copy>
    <xsl:apply-templates select="@*|node()"/>
    <classpathentry kind="lib" path="/Android-Couchbase/lib/commons-compress-1.0.jar"/>
  </xsl:copy>
</xsl:template>

</xsl:stylesheet>