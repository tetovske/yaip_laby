<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/arrays">
        <html>
        <head>
            <style>
                .table-elem {
                    text-align: center;
                    background-color: #EEEEEE;
                }

                .table-elem:nth-of-type(even) {
                    background-color: #DDDDDD;
                }

                .table-elem td {
                    padding: 15px;
                }
            </style>
        </head>
        <body>
            <table>
                <th colspan="2">
                    <td>Дружественные числа в заданном диапазоне</td>
                </th>
                <xsl:for-each select="array">
                    <tr class="table-elem">
                        <td><xsl:value-of select="array[1]"/></td>
                        <td><xsl:value-of select="array[2]"/></td>
                    </tr>
                </xsl:for-each>
            </table>
        </body>
        </html>
    </xsl:template>
</xsl:stylesheet>