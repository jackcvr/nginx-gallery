<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="utf-8" indent="yes" />
<xsl:template match="/">
    <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
    <html>
    <head>
        <title><xsl:value-of select="$title" /></title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fancyapps/ui/dist/fancybox.css" />
        <style>
          * {
            margin: 0px;
            padding: 0px;
          }
          body {
            padding: 10px;
            background: #000000;
          }
          a {
            color: #fff;
            font: 18px monospace;
            text-decoration: none;
          }
          .clear {
            display: block;
            clear: both;
          }
          .head {
            display: block;
            padding: 10px 0px;
          }
          .gallery a {
            margin: 1px;
            padding: 0px;
            text-decoration: none;
            display: inline;
            float: left;
          }
          .gallery a img, .gallery a video.preview {
            height: 300px;
            display: inline;
            float: left;
          }
        </style>
    </head>
    <body>
        <a href="/" class="head">MAIN PAGE</a>
        <div class="clear"></div>
        <ul>
            <xsl:for-each select="list/directory">
            <li>
                <a href="{.}"><xsl:value-of select="." /></a>
            </li>
            </xsl:for-each>
        </ul>
        <div class="gallery">
            <xsl:for-each select="list/file">
                <xsl:choose>
                <xsl:when test="contains(' mp4 webm mkv avi wmv flv ogv MOV ', concat(' ', substring-after(., '.'), ' '))">
                    <a alt="{.}" title="{.}" href="#video-{.}" data-fancybox="gallery">
                        <video src="{.}" class="preview" />
                    </a>
                    <div id="video-{.}" style="display:none;"><video controls="" src="{.}" alt="{.}" title="{.}" /></div>
                </xsl:when>
                <xsl:otherwise>
                    <a alt="{.}" title="{.}" href="{.}" data-fancybox="gallery">
                        <img data-src="{.}" />
                    </a>
                </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </div>
        <script>
            for (const img of document.getElementsByTagName("img")) {
                const src = img.getAttribute("data-src");
                img.src = `/thumb${window.location.pathname}${src}`;
            }
        </script>
        <script src="https://cdn.jsdelivr.net/npm/@fancyapps/ui@4.0/dist/fancybox.umd.js"></script>
    </body>
    </html>
</xsl:template>
</xsl:stylesheet>
