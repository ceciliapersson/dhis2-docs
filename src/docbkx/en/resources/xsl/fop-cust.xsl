<!-- 
     This is the XSL FO (PDF) stylesheet for the DHIS2 reference
    documentation.

    Thanks are due to Christian Bauer of the Hibernate project
    team  and Spring project for writing the original stylesheet upon which this one
    is based.
-->

<!DOCTYPE xsl:stylesheet [
    <!ENTITY copyright "&#xA9;">
]>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0" xmlns:dc="http://purl.org/dc/elements/1.1/"
                xmlns="http://www.w3.org/TR/xhtml1/transitional"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
				xmlns:xlink="http://www.w3.org/1999/xlink"
				xmlns:d="http://docbook.org/ns/docbook"
                exclude-result-prefixes="#default">
                
<xsl:import href="urn:docbkx:stylesheet"/>

<!-- 
<xsl:param name="draft.mode">yes</xsl:param>
 -->

<!--###################################################
                      Extensions
    ################################################### -->  

    <!-- These extensions are required for table printing and other stuff -->
    <xsl:param name="use.extensions">1</xsl:param>
    <xsl:param name="tablecolumns.extension">0</xsl:param>
<!--
    <xsl:param name="callout.extensions">1</xsl:param>
-->
    <!-- FOP provide only PDF Bookmarks at the moment -->
    <xsl:param name="fop1.extension">1</xsl:param>
    <xsl:param name="fop1.extensions">1</xsl:param>
<!--
    <xsl:param name="graphicsize.extension">1</xsl:param>
    <xsl:param name="graphicsize.use.img.src.path">0</xsl:param>
	<xsl:param name="ignore.image.scaling" select="0"></xsl:param>
-->
<!--###################################################
                   Global attributes
    ################################################### --> 
    <xsl:attribute-set name="xref.properties">
		<xsl:attribute name="color">blue</xsl:attribute>
		<xsl:attribute name="text-decoration">underline</xsl:attribute>
    </xsl:attribute-set>
	 <!-- Hide URL but show footnotes instead -->
     <xsl:param name="ulink.show" select="0"/>
     <xsl:param name="ulink.footnotes" select="1"/>
<!--###################################################
                   Custom Title Page
    ################################################### --> 
    
	<xsl:template name="book.titlepage.before.recto"/>
    <xsl:template name="book.titlepage.recto">
        <fo:block padding-before="5mm">
            <fo:table table-layout="fixed" width="175mm">
                <fo:table-column column-width="175mm"/>
                <fo:table-body>
					<fo:table-row >
						<fo:table-cell text-align="center">
							<fo:block text-align="center" font-size="22pt" font-weight="bold" padding-before="70mm">
							    <xsl:value-of select="d:title" />
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row >
                        <fo:table-cell text-align="center">
                            <fo:block padding-before="5mm">
                                <fo:external-graphic scaling="uniform" src="file:./resources/images/dhis2_images/logo.png"/>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
					<fo:table-row >
						<fo:table-cell text-align="center">
							<fo:block text-align="center" font-size="14pt" font-weight="bold" padding-before="10mm">
							    <xsl:value-of select="d:info/d:releaseinfo" />
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
                </fo:table-body>
            </fo:table>
        </fo:block>	
	</xsl:template>

    <!-- Prevent blank pages in output -->    
 
	 <xsl:template name="book.titlepage.verso">
	      <fo:block padding-before="50mm">
            <fo:table table-layout="fixed" width="175mm">
                <fo:table-column column-width="175mm"/>
                <fo:table-body>
					<fo:table-row >
						<fo:table-cell text-align="left">
							<fo:block text-align="left" font-size="12pt">
								 <xsl:text>&copyright; </xsl:text>
							    <xsl:value-of select="d:info/d:copyright/d:year" />
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				    <fo:table-row >
						<fo:table-cell text-align="left">
							<fo:block text-align="left" font-size="12pt">
								 <xsl:value-of select="d:info/d:copyright/d:holder" />
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row >
						<fo:table-cell text-align="left">
							<fo:block text-align="left" font-size="12pt" padding-before="15mm">
							    <xsl:text>Revision </xsl:text><xsl:value-of select="d:info/d:revhistory/d:revision/d:revnumber" />
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row >
						<fo:table-cell text-align="left">
							<fo:block text-align="left" font-size="12pt" padding-before="15mm">
								 <xsl:value-of select="d:info/d:revhistory/d:revision/d:date" />
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row >
						<fo:table-cell text-align="left">
							<fo:block text-align="left" font-size="12pt">
								 <xsl:value-of select="d:info/d:revhistory/d:revision/d:revremark" />
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					
					<fo:table-row >
						<fo:table-cell text-align="left" padding-before="15mm">
							<fo:block text-align="left" font-size="12pt" >
								 <xsl:value-of select="d:info/d:legalnotice/d:formalpara[@xml:id='warranty']" />
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
						<fo:table-row >
						<fo:table-cell text-align="left" padding-before="15mm">
							<fo:block text-align="left" font-size="12pt" >
								 <xsl:value-of select="d:info/d:legalnotice/d:formalpara[@xml:id='license']" />
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
	             </fo:table-body>
            </fo:table>
        </fo:block>	-->
	</xsl:template> 
    
		
<!--###################################################
                      Header
    ################################################### -->  

    <!-- More space in the center header for long text -->
    <xsl:attribute-set name="header.content.properties">
        <xsl:attribute name="font-family">DejaVu Sans</xsl:attribute>
        <xsl:attribute name="font-size">9pt</xsl:attribute>
		
<!--
        <xsl:attribute name="font-family">
            <xsl:value-of select="$body.fontset"/>
        </xsl:attribute>

        <xsl:attribute name="margin-left">-5em</xsl:attribute>
        <xsl:attribute name="margin-right">-5em</xsl:attribute>
-->
    </xsl:attribute-set>


	<xsl:template name="header.content">
	  <xsl:param name="pageclass" select="''"/>
	  <xsl:param name="sequence" select="''"/>
	  <xsl:param name="position" select="''"/>
	  <xsl:param name="gentext-key" select="''"/>
<!--
	  <fo:block>
	    <xsl:value-of select="$pageclass"/>
	    <xsl:text>, </xsl:text>
	    <xsl:value-of select="$sequence"/>
	    <xsl:text>, </xsl:text>
	    <xsl:value-of select="$position"/>
	    <xsl:text>, </xsl:text>
	    <xsl:value-of select="$gentext-key"/>
	  </fo:block>
-->

	  <fo:block>

	    <!-- sequence can be odd, even, first, blank -->
	    <!-- position can be left, center, right -->
	    <xsl:choose>

	      <xsl:when test="$sequence = 'blank'">
	        <!-- nothing for blank pages -->
			<xsl:text>Blank</xsl:text>
	      </xsl:when>

		  <xsl:when test="$pageclass = 'lot' and $position='right'">
	        <xsl:text>Contents</xsl:text>
	      </xsl:when>

 		  <xsl:when test="$position='right'">
	        <xsl:if test="$pageclass != 'titlepage'">
				  <fo:retrieve-marker retrieve-class-name="section.head.marker"
	                                  retrieve-position="first-including-carryover"
	                                  retrieve-boundary="page-sequence"/>
	        </xsl:if>
	      </xsl:when>

  	 	  <xsl:when test="$position='left'">
	        <xsl:if test="$pageclass != 'titlepage'">
               <xsl:apply-templates select="." mode="titleabbrev.markup"/>
	        </xsl:if>
	      </xsl:when>

<!--
  	 	  <xsl:when test="$position='right'">
	        <xsl:if test="$pageclass != 'titlepage'">
               <xsl:apply-templates select="." mode="titleabbrev.markup"/>
	        </xsl:if>
	      </xsl:when>

	      <xsl:when test="($sequence='odd' or $sequence='even') and $position='center'">
	        <xsl:if test="$pageclass != 'titlepage'">

	          <xsl:choose>
	            <xsl:when test="ancestor::book and ($double.sided != 0)">
	              <fo:retrieve-marker retrieve-class-name="section.head.marker"
	                                  retrieve-position="first-including-carryover"
	                                  retrieve-boundary="page-sequence"/>
					<xsl:apply-templates select="." mode="title.markup"/>
	            </xsl:when>
	            <xsl:otherwise>
	              <xsl:apply-templates select="." mode="titleabbrev.markup"/>
	            </xsl:otherwise>
	          </xsl:choose>
	        </xsl:if>
	      </xsl:when>
-->

  	 	  <xsl:when test="$position='center'">
	       	<xsl:text> </xsl:text>
	      </xsl:when>

		  <xsl:when test="$double.sided != 0">
	        <xsl:if test="$pageclass != 'titlepage'">
	          <xsl:choose>
	            	<xsl:when test="$sequence = 'even' and $position='left'">
						<xsl:if test="$pageclass != 'titlepage'">
			               <xsl:apply-templates select="." mode="titleabbrev.markup"/>
				        </xsl:if>
					</xsl:when>
					<xsl:when test="$sequence = 'odd' and $position='right'">
						<xsl:if test="$pageclass != 'titlepage'">
			               <xsl:apply-templates select="." mode="titleabbrev.markup"/>
				        </xsl:if>
					</xsl:when>
					<xsl:when test="$sequence = 'first' and $position='right'">
						<xsl:if test="$pageclass != 'titlepage'">
			               <xsl:apply-templates select="." mode="titleabbrev.markup"/>
				        </xsl:if>
					</xsl:when>
	          </xsl:choose>
	        </xsl:if>
	      </xsl:when>


	    </xsl:choose>
	  </fo:block>
	</xsl:template>


<!--###################################################
                      Custom Footer
    ################################################### -->  
    <xsl:attribute-set name="footer.content.properties">
        <xsl:attribute name="font-family">DejaVu Sans</xsl:attribute>
        <xsl:attribute name="font-size">9pt</xsl:attribute>
    </xsl:attribute-set>
   
	<xsl:template name="footer.content">
		<xsl:param name="pageclass" select="''" />
		<xsl:param name="sequence" select="''" />
		<xsl:param name="position" select="''" />
		<xsl:param name="gentext-key" select="''" />
		<xsl:variable name="Version">
			<xsl:if test="d:bookinfo/d:releaseinfo">
				<xsl:value-of select="d:bookinfo/d:title" /><xsl:text> (</xsl:text><xsl:value-of select="d:bookinfo/d:releaseinfo" /><xsl:text>)</xsl:text>
			</xsl:if>
		</xsl:variable>

		<xsl:choose>
			<xsl:when test="$sequence='blank'">
<!--
				<xsl:if test="$position = 'center'">
					<xsl:value-of select="$Version" />
				</xsl:if>
-->
			</xsl:when>

			<!-- for double sided printing, print page numbers on alternating sides (of the page) -->
			<xsl:when test="$double.sided != 0">
				<xsl:choose>
					<xsl:when test="$sequence = 'even' and $position='left'">
						<fo:page-number />
					</xsl:when>
					<xsl:when test="$sequence = 'odd' and $position='right'">
						<fo:page-number />
					</xsl:when>
					<xsl:when test="$sequence = 'first' and $position='right'">
						<fo:page-number />
					</xsl:when>
					<xsl:when test="$sequence = 'odd' and $position='left'">
						<xsl:value-of select="$Version" />
					</xsl:when>
				</xsl:choose>
			</xsl:when>

			<!-- for single sided printing, print all page numbers on the right (of the page) -->
			<xsl:when test="$double.sided = 0">
				<xsl:choose>
					<xsl:when test="$position='left'">
						<xsl:value-of select="$Version" />
					</xsl:when>
					<xsl:when test="$position='right'">
						<fo:page-number />
					</xsl:when>
				</xsl:choose>
			</xsl:when>
		</xsl:choose>
	</xsl:template>   
    
<!--###################################################
                   Custom Toc Line
    ################################################### -->
    
    <!-- The default DocBook XSL TOC printing is seriously broken... -->
    <xsl:template name="xxxtoc.line">
        <xsl:variable name="id">
            <xsl:call-template name="object.id"/>
        </xsl:variable>

        <xsl:variable name="label">
            <xsl:apply-templates select="." mode="label.markup"/>
        </xsl:variable>

        <!-- justify-end removed from block attributes (space problem in title.markup) -->
        <fo:block  end-indent="{$toc.indent.width}pt"
                   last-line-end-indent="-{$toc.indent.width}pt"
                   white-space-treatment="preserve"
                   text-align="left"
                   white-space-collapse="false">
            <fo:inline keep-with-next.within-line="always">
                <!-- print Chapters in bold style -->
                <xsl:choose>
                    <xsl:when test="local-name(.) = 'chapter'">
                        <xsl:attribute name="font-weight">bold</xsl:attribute>
                    </xsl:when>
                </xsl:choose>        
                <fo:basic-link internal-destination="{$id}">
                    <xsl:if test="$label != ''">
                        <xsl:copy-of select="$label"/>
                        <fo:inline white-space-treatment="preserve"
                                    white-space-collapse="false">
                            <xsl:value-of select="$autotoc.label.separator"/>
                        </fo:inline>
                    </xsl:if>
                    <xsl:apply-templates select="." mode="title.markup"/>
                </fo:basic-link>
            </fo:inline>
            <fo:inline keep-together.within-line="always">
            <xsl:text> </xsl:text>
            <fo:leader leader-pattern="dots"
                        leader-pattern-width="3pt"
                        leader-alignment="reference-area"
                        keep-with-next.within-line="always"/>
            <xsl:text> </xsl:text>
            <fo:basic-link internal-destination="{$id}">
                <fo:page-number-citation ref-id="{$id}"/>
            </fo:basic-link>
            </fo:inline>
        </fo:block>
    </xsl:template>


<!--###################################################
                      Table Of Contents
    ################################################### -->   

    <!-- Generate the TOCs for named components only -->
    <xsl:param name="generate.toc">
        book   toc
    </xsl:param>
    
    <!-- Show only Sections up to level 3 in the TOCs -->
    <xsl:param name="toc.section.depth">3</xsl:param>
    
    <!-- Dot and Whitespace as separator in TOC between Label and Title-->
    <xsl:param name="autotoc.label.separator" select="'.  '"/>

	<xsl:attribute-set name="toc.line.properties">
	  <xsl:attribute name="font-weight">
		<xsl:choose>
		    <xsl:when test="self::chapter | self::preface | self::appendix">bold</xsl:when>
		    <xsl:otherwise>normal</xsl:otherwise>
		</xsl:choose>
	  </xsl:attribute>
	</xsl:attribute-set>

<!--###################################################
                   Paper & Page Size
    ################################################### -->  
    
    <!-- Paper type, no headers on blank pages, no double sided printing -->
    <xsl:param name="paper.type" select="'A4'"/>
    <xsl:param name="double.sided">1</xsl:param>
    <xsl:param name="headers.on.blank.pages">0</xsl:param>
    <xsl:param name="footers.on.blank.pages">0</xsl:param>

    <!-- Space between paper border and content (chaotic stuff, don't touch) -->
    <xsl:param name="page.margin.top">5mm</xsl:param>
    <xsl:param name="region.before.extent">10mm</xsl:param>
    <xsl:param name="body.margin.top">10mm</xsl:param>
    
    <xsl:param name="body.margin.bottom">10mm</xsl:param>
    <xsl:param name="region.after.extent">10mm</xsl:param>
    <xsl:param name="page.margin.bottom">10mm</xsl:param>
    
    <xsl:param name="page.margin.outer">18mm</xsl:param>
    <xsl:param name="page.margin.inner">18mm</xsl:param>

    <!-- No intendation of Titles -->
    <xsl:param name="title.margin.left">0pc</xsl:param>

<!--###################################################
                   Fonts & Styles
    ################################################### -->      

    <!-- Left aligned text and no hyphenation -->
    <xsl:param name="alignment">justify</xsl:param>
    <xsl:param name="hyphenate">false</xsl:param>

    <!-- Default Font size -->
	<xsl:param name="body.font.family">DejaVu Sans</xsl:param>
    <xsl:param name="body.font.master">10</xsl:param>
    <xsl:param name="body.font.small">9</xsl:param>
	<xsl:param name="symbol.font.family">DejaVu Sans</xsl:param>

    <!-- Line height in body text -->
    <xsl:param name="line-height">1.3</xsl:param>

    <!-- Monospaced fonts are smaller than regular text -->
    <xsl:attribute-set name="monospace.properties">
        <xsl:attribute name="font-family">
            <xsl:value-of select="$monospace.font.family"/>
        </xsl:attribute>
        <xsl:attribute name="font-size">0.9em</xsl:attribute>
    </xsl:attribute-set>
    
	<xsl:param name="body.start.indent">24pt</xsl:param>
<!--
	<xsl:param name="body.start.indent">
	  <xsl:choose>
	    <xsl:when test="$fop.extensions != 0">0pt</xsl:when>
	    <xsl:when test="$passivetex.extensions != 0">0pt</xsl:when>
	    <xsl:otherwise>4pc</xsl:otherwise>
	  </xsl:choose>
	</xsl:param>
-->
<!--###################################################
                   Tables
    ################################################### -->

    <!-- The table width should be adapted to the paper size -->
<!--  	<xsl:param name="default.table.width">17.4cm</xsl:param> -->
<!--
	<xsl:param name="default.table.width">15cm</xsl:param>
-->
    <!-- Some padding inside tables -->    
    <xsl:attribute-set name="table.cell.padding">
        <xsl:attribute name="padding-left">6pt</xsl:attribute>
        <xsl:attribute name="padding-right">6pt</xsl:attribute>
        <xsl:attribute name="padding-top">3pt</xsl:attribute>
        <xsl:attribute name="padding-bottom">2pt</xsl:attribute>
    </xsl:attribute-set>
    
    <!-- Only hairlines as frame and cell borders in tables -->
    <xsl:param name="table.frame.border.thickness">0.2pt</xsl:param>
    <xsl:param name="table.cell.border.thickness">0.2pt</xsl:param>
        
<!--###################################################
                         Labels
    ################################################### -->   

    <!-- Label Chapters and Sections (numbering) -->
    <xsl:param name="chapter.autolabel">1</xsl:param>
    <xsl:param name="section.autolabel" select="1"/>
    <xsl:param name="section.label.includes.component.label" select="1"/>

<!--###################################################
                         Titles
    ################################################### -->   
    
    <!-- Chapter title size -->
    <xsl:attribute-set name="chapter.titlepage.recto.style">
        <xsl:attribute name="text-align">left</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="font-size">
            <xsl:value-of select="$body.font.master * 1.4"/>
            <xsl:text>pt</xsl:text>
        </xsl:attribute>        
    </xsl:attribute-set>

    <!-- Why is the font-size for chapters hardcoded in the XSL FO templates? 
        Let's remove it, so this sucker can use our attribute-set only... -->
    <xsl:template match="title" mode="chapter.titlepage.recto.auto.mode">
        <fo:block xmlns:fo="http://www.w3.org/1999/XSL/Format"
                  xsl:use-attribute-sets="chapter.titlepage.recto.style">
            <xsl:call-template name="component.title">
                <xsl:with-param name="node" select="ancestor-or-self::chapter[1]"/>
            </xsl:call-template>
            </fo:block>
    </xsl:template>
    
    <!-- Sections 1, 2 and 3 titles have a small bump factor and padding -->    
    <xsl:attribute-set name="section.title.level1.properties">
        <xsl:attribute name="space-before.optimum">2em</xsl:attribute>
        <xsl:attribute name="space-before.minimum">2em</xsl:attribute>
        <xsl:attribute name="space-before.maximum">2em</xsl:attribute>
        <xsl:attribute name="font-size">
            <xsl:value-of select="$body.font.master * 1.4"/>
            <xsl:text>pt</xsl:text>
        </xsl:attribute>
        <xsl:attribute name="space-after.optimum">0.1em</xsl:attribute>
        <xsl:attribute name="space-after.minimum">0.1em</xsl:attribute>
        <xsl:attribute name="space-after.maximum">0.1em</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="section.title.level2.properties">
        <xsl:attribute name="space-before.optimum">1.5em</xsl:attribute>
        <xsl:attribute name="space-before.minimum">1.5em</xsl:attribute>
        <xsl:attribute name="space-before.maximum">1.5em</xsl:attribute>
        <xsl:attribute name="font-size">
            <xsl:value-of select="$body.font.master * 1.3"/>
            <xsl:text>pt</xsl:text>
        </xsl:attribute>
        <xsl:attribute name="space-after.optimum">0.1em</xsl:attribute>
        <xsl:attribute name="space-after.minimum">0.1em</xsl:attribute>
        <xsl:attribute name="space-after.maximum">0.1em</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="section.title.level3.properties">
        <xsl:attribute name="space-before.optimum">0.8em</xsl:attribute>
        <xsl:attribute name="space-before.minimum">0.8em</xsl:attribute>
        <xsl:attribute name="space-before.maximum">0.8em</xsl:attribute>
        <xsl:attribute name="font-size">
            <xsl:value-of select="$body.font.master * 1.2"/>
            <xsl:text>pt</xsl:text>
        </xsl:attribute>
        <xsl:attribute name="space-after.optimum">0.1em</xsl:attribute>
        <xsl:attribute name="space-after.minimum">0.1em</xsl:attribute>
        <xsl:attribute name="space-after.maximum">0.1em</xsl:attribute>
    </xsl:attribute-set>
	<xsl:attribute-set name="section.title.level4.properties">
        <xsl:attribute name="space-before.optimum">0.6em</xsl:attribute>
        <xsl:attribute name="space-before.minimum">0.6em</xsl:attribute>
        <xsl:attribute name="space-before.maximum">0.6em</xsl:attribute>
        <xsl:attribute name="font-size">
            <xsl:value-of select="$body.font.master * 1.1"/>
            <xsl:text>pt</xsl:text>
        </xsl:attribute>
        <xsl:attribute name="space-after.optimum">0.1em</xsl:attribute>
        <xsl:attribute name="space-after.minimum">0.1em</xsl:attribute>
        <xsl:attribute name="space-after.maximum">0.1em</xsl:attribute>
    </xsl:attribute-set>
	<xsl:attribute-set name="section.title.level5.properties">
        <xsl:attribute name="space-before.optimum">0.4em</xsl:attribute>
        <xsl:attribute name="space-before.minimum">0.4em</xsl:attribute>
        <xsl:attribute name="space-before.maximum">0.4em</xsl:attribute>
        <xsl:attribute name="font-size">
            <xsl:value-of select="$body.font.master * 1.0"/>
            <xsl:text>pt</xsl:text>
        </xsl:attribute>
        <xsl:attribute name="space-after.optimum">0.1em</xsl:attribute>
        <xsl:attribute name="space-after.minimum">0.1em</xsl:attribute>
        <xsl:attribute name="space-after.maximum">0.1em</xsl:attribute>
    </xsl:attribute-set>
<!--
    <xsl:attribute-set name="section.title.level6.properties">
        <xsl:attribute name="space-before.optimum">0.4em</xsl:attribute>
        <xsl:attribute name="space-before.minimum">0.4em</xsl:attribute>
        <xsl:attribute name="space-before.maximum">0.4em</xsl:attribute>
        <xsl:attribute name="font-size">
            <xsl:value-of select="$body.font.master * 0.5"/>
            <xsl:text>pt</xsl:text>
        </xsl:attribute>
        <xsl:attribute name="space-after.optimum">0.1em</xsl:attribute>
        <xsl:attribute name="space-after.minimum">0.1em</xsl:attribute>
        <xsl:attribute name="space-after.maximum">0.1em</xsl:attribute>
    </xsl:attribute-set>
-->

    <!-- Titles of formal objects (tables, examples, ...) -->
    <xsl:attribute-set name="formal.title.properties" use-attribute-sets="normal.para.spacing">
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="font-size">
            <xsl:value-of select="$body.font.master"/>
            <xsl:text>pt</xsl:text>
        </xsl:attribute>
        <xsl:attribute name="hyphenate">false</xsl:attribute>
        <xsl:attribute name="space-after.minimum">0.4em</xsl:attribute>
        <xsl:attribute name="space-after.optimum">0.6em</xsl:attribute>
        <xsl:attribute name="space-after.maximum">0.8em</xsl:attribute>
    </xsl:attribute-set>

    <!--Turn off all revhistory information from the title page -->
    <xsl:template match="revhistory" mode="titlepage.mode"/>

<!--###################################################
                      Formal paras
    ################################################### -->  
  <xsl:template match="formalpara/title">
     <fo:block xsl:use-attribute-sets="section.title.properties">
        <xsl:apply-templates/>
     </fo:block>
  </xsl:template>
<!--###################################################
                      Programlistings
    ################################################### -->  
    
    <!-- Verbatim text formatting (programlistings) -->
    <xsl:attribute-set name="monospace.verbatim.properties">
        <xsl:attribute name="font-size">
            <xsl:value-of select="$body.font.small * 1.0"/>
            <xsl:text>pt</xsl:text>
        </xsl:attribute>
		<xsl:attribute name="wrap-option">wrap</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="verbatim.properties">
        <xsl:attribute name="space-before.minimum">1em</xsl:attribute>
        <xsl:attribute name="space-before.optimum">1em</xsl:attribute>
        <xsl:attribute name="space-before.maximum">1em</xsl:attribute>
        <!-- 
        <xsl:attribute name="border-color">#444444</xsl:attribute>
        <xsl:attribute name="border-style">solid</xsl:attribute>
        <xsl:attribute name="border-width">0.2pt</xsl:attribute>      
        <xsl:attribute name="padding-top">0.5em</xsl:attribute>      
        <xsl:attribute name="padding-left">0.5em</xsl:attribute>      
        <xsl:attribute name="padding-right">0.5em</xsl:attribute>      
        <xsl:attribute name="padding-bottom">0.5em</xsl:attribute>      
        <xsl:attribute name="margin-left">0.5em</xsl:attribute>      
        <xsl:attribute name="margin-right">0.5em</xsl:attribute>      
         -->
    </xsl:attribute-set>    

    <!-- Shade (background) programlistings -->    

    <xsl:param name="shade.verbatim">1</xsl:param>
    <xsl:attribute-set name="shade.verbatim.style">
        <xsl:attribute name="background-color">#f0f0f0</xsl:attribute>
    </xsl:attribute-set>
    
    
    <xsl:template match="programlistings/emphasis"> 
        <fo:inline font-weight="bold">
            <xsl:apply-templates/>
        </fo:inline> 
    </xsl:template> 
    
                
<!--###################################################
                         Callouts
    ################################################### -->   

    <!-- Use images for callouts instead of (1) (2) (3) -->
    <xsl:param name="callout.graphics">0</xsl:param>
    <xsl:param name="callout.unicode">1</xsl:param>
    
    <!-- Place callout marks at this column in annotated areas -->
    <xsl:param name="callout.defaultcolumn">90</xsl:param>

<!--###################################################
                       Admonitions
    ################################################### -->   

    <!-- Use nice graphics for admonitions -->
    <xsl:param name="admon.graphics">1</xsl:param>
	<xsl:param name="admon.graphics.path">resources/images/admon/</xsl:param>
		<xsl:template match="*" mode="admon.graphic.width">
		<xsl:text>14pt</xsl:text>
	</xsl:template>
	<!-- this is an alternate view of admonitions which maybe preferable
  <xsl:template name="graphical.admonition">
  <xsl:variable name="id">
    <xsl:call-template name="object.id"/>
  </xsl:variable>

  <fo:block space-before.minimum="0.8em"
            space-before.optimum="1em"
            space-before.maximum="1.2em"
            start-indent="0.25in"
            end-indent="0.25in"
            border-top="0.5pt solid black"
            border-bottom="0.5pt solid black"
            padding-top="4pt"
            padding-bottom="4pt"
            id="{$id}">
    <xsl:if test="$admon.textlabel != 0 or title">
      <fo:block keep-with-next='always'
                xsl:use-attribute-sets="admonition.title.properties">
         <xsl:apply-templates select="." mode="object.title.markup"/>
      </fo:block>
    </xsl:if>

    <fo:block xsl:use-attribute-sets="admonition.properties">
      <xsl:apply-templates/>
    </fo:block>
  </fo:block>
</xsl:template> -->
<!--###################################################
                          Misc
    ################################################### -->   

    <!-- Placement of titles -->
    <xsl:param name="formal.title.placement">
        figure after
        example before
        equation before
        table before
        procedure before
    </xsl:param>
    
    <!-- Format Variable Lists as Blocks (prevents horizontal overflow) -->
    <xsl:param name="variablelist.as.blocks">0</xsl:param>
	<xsl:param name="variablelist.term.break.after">0</xsl:param>
	<xsl:param name="variablelist.term.separator">, </xsl:param>
    
    <!-- The horrible list spacing problems -->
    <xsl:attribute-set name="list.block.spacing">
        <xsl:attribute name="space-before.optimum">0.1em</xsl:attribute>
        <xsl:attribute name="space-before.minimum">0.1em</xsl:attribute>
        <xsl:attribute name="space-before.maximum">0.1em</xsl:attribute>
        <xsl:attribute name="space-after.optimum">0.1em</xsl:attribute>
        <xsl:attribute name="space-after.minimum">0.1em</xsl:attribute>
        <xsl:attribute name="space-after.maximum">0.1em</xsl:attribute>
    </xsl:attribute-set>

	<xsl:attribute-set name="list.item.spacing">
	  <xsl:attribute name="space-before.optimum">0.3em</xsl:attribute>
	  <xsl:attribute name="space-before.minimum">0.2em</xsl:attribute>
	  <xsl:attribute name="space-before.maximum">0.8em</xsl:attribute>
	</xsl:attribute-set>


<!--###################################################
              colored and hyphenated links 
    ###################################################  -->


    <xsl:template match="varlistentry/term"> 
    <fo:inline font-style="italic"> 
            <xsl:apply-templates/>
    </fo:inline> 
    </xsl:template> 
<!-- 
    <xsl:template match="variablelist/title"> 
    <fo:inline font-style="italic"> 
            <xsl:apply-templates/>
    </fo:inline> 
    </xsl:template> 
 -->
 <!--
<xsl:template match="title" mode="list.title.mode">
	<fo:block font-size="10pt" font-weight="bold" xsl:use-attribute-sets="normal.para.spacing">
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>
-->

   <xsl:template match="markup"> 
        <fo:inline font-weight="bold">
            <xsl:apply-templates/>
        </fo:inline> 
    </xsl:template> 

	</xsl:stylesheet>