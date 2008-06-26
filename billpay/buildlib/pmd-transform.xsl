<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" 
	 indent="yes"  />
<xsl:param name="package" select="files"/>
<xsl:param name="rulesets" select="'not defined'"/>
<xsl:param name="today" select="today"/>
<xsl:param name="context-root" select="context-root"/>

<xsl:template match="/pmd">
	<html>
	<head>
	<META HTTP-EQUIV="Content-Style-Type" CONTENT="text/css"/>
	<title>PMD Results for <xsl:value-of select="$package"/></title>
	<!-- Style taken from the JDepend stylesheet in ${ant.home}/etc/jdepend.xsl -->
	<style type="text/css">
	  body {
		font:normal 68% verdana,arial,helvetica;
		color:#000000;
	  }
	  table tr td, tr th {
		  font-size: 68%;
	  }
	  table.details tr th{
		font-weight: bold;
		text-align:left;
		background:#a6caf0;
	  }
	  table.details tr td{
		background:#eeeee0;
	  }
	  
	  table.summary tr th{
		font-weight: bold;
		text-align:left;
		background:#d6caf0;
	  }
	  table.summary tr td{
		background:#eeeee0;
	  }
	  
	  p {
		line-height:1.5em;
		margin-top:0.5em; margin-bottom:1.0em;
		margin-left:2em;
		margin-right:2em;
	  }
	  h1 {
		margin: 0px 0px 5px; font: 165% verdana,arial,helvetica
	  }
	  h2 {
		margin-top: 1em; margin-bottom: 0.5em; font: bold 125% verdana,arial,helvetica
	  }
	  h3 {
		margin-bottom: 0.5em; font: bold 115% verdana,arial,helvetica
	  }
	  h4 {
		margin-bottom: 0.5em; font: bold 100% verdana,arial,helvetica
	  }
	  h5 {
		margin-bottom: 0.5em; font: bold 100% verdana,arial,helvetica
	  }
	  h6 {
		margin-bottom: 0.5em; font: bold 100% verdana,arial,helvetica
	  }
	  .Error {
		font-weight:bold; color:red;
	  }
	  .Failure {
		font-weight:bold; color:purple;
	  }
	  .Properties {
		text-align:right;
	  }
	  </style>
	</head>
	<body>
	<h1>Static Analysis of <xsl:value-of select="$package"/> source code</h1>
	<p align="right">Run with <a href="http://pmd.sourceforge.net">PMD</a> on <xsl:value-of select="$today"/></p>
	<table class="summary">
		<tr><th>Rulesets Used</th> <th>Items Found</th></tr>
		<tr><td><xsl:value-of select="$rulesets"/></td>
			<td><xsl:value-of select="count(//violation)" /></td>
			</tr>
	</table>
	<hr size="2" />
	<xsl:apply-templates/>
	</body>
	</html>
</xsl:template>

<xsl:template match="//file">
	<xsl:variable name="filename" select="@name"/>
	<table class="details">
	<tr>
	<th colspan="3">
		<xsl:value-of select="$filename"/></th>
	</tr>
	<xsl:for-each select="violation">
		<tr>
		<xsl:variable name="lineNum" select="@line"/>
		<td><a href="{$context-root}/{$filename}.html#{$lineNum}">Line <xsl:value-of select="@line"/></a></td>
		<td><xsl:value-of select="."/></td>
		<td><xsl:value-of select="@rule"/></td>
		</tr>
	</xsl:for-each>
	</table>
	<p/>
</xsl:template>

</xsl:stylesheet>