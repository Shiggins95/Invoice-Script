<?INVOICETEMPLATE?>
<?xml version="1.0"?>
<!DOCTYPE pdf PUBLIC "-//big.faceless.org//report" "report-1.1.dtd">
<pdf>
    <head>
        <macrolist>
            <#assign CURRENT_PAGE=1/>
            <#assign PAGE_1_MODULO_INDEX=13/>
            <#assign PAGE_2_MODULO_INDEX=19/>
            <#assign CURRENT_MODULO_INDEX=0/>

            <#function GET_PAGES>
                <#assign pages=1/>
                <#list data.lines as line>
                    <#if pages=1&&line_index%PAGE_1_MODULO_INDEX==0>
                        <#assign pages=pages+1/>
                    <#elseif (pages > 1) && line_index%PAGE_2_MODULO_INDEX==0>
                        <#assign pages=pages+1/>
                    </#if>
                </#list>
                <#return pages/>
            </#function>
            <#function GET_COLSPAN column>
                <#if column.isDescription==true>
                    <#return 3/>
                <#elseif column.isRate==true>
                    <#return 1/>
                <#elseif column.isQuantity==true>
                    <#return 1/>
                </#if>
                <#return 1/>
            </#function>

            <#macro BLANK_ROW>
                <tr>
                    <td>&nbsp</td>
                </tr>
            </#macro>
            <#macro TRANSACTION_DETAILS>
                <tr class="full-width">
                    <td align="right" style="width: 40%">
                        <table class="full-width no-pad">
                            <tr class="full-width">
                                <td style="width: 60%" class="no-pad">&nbsp;</td>
                                <td style="width: 40%" align="right" class="no-pad">
                                    <table>
                                        <tr class="full-width">
                                            <td>&nbsp</td>
                                            <td class="title" align="right">INVOICE</td>
                                        </tr>
                                        <@BLANK_ROW/>
                                        <@BLANK_ROW/>
                                        <tr class="full-width">
                                            <td>Invoice Number</td>
                                            <td align="right">${data.transactionNumber}</td>
                                        </tr>
                                        <tr class="full-width">
                                            <td>Date</td>
                                            <td align="right">${data.transactionDate}</td>
                                        </tr>
                                        <tr class="full-width">
                                            <td>Payment Terms</td>
                                            <td align="right">30 Days</td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </#macro>
            <#macro BILLING_ADDRESS>
                <td align="right" style="width: 31%;" class="no-pad">
                    <table class="full-width">
                        <tr class="full-width">
                            <td class="full-width header">
                                Billing Address
                            </td>
                        </tr>
                        <tr class="full-width">
                            <td class="full-width">
                                Stephen Higgins
                            </td>
                        </tr>
                        <tr class="full-width">
                            <td class="full-width">
                                78 Honeybog Road
                            </td>
                        </tr>
                        <tr class="full-width">
                            <td class="full-width">
                                Penilee, G52 4EQ
                            </td>
                        </tr>
                        <tr class="full-width">
                            <td class="full-width">
                                07900 404 250
                            </td>
                        </tr>
                        <tr class="full-width">
                            <td class="full-width">
                                stephen.higgins1995@gmail.com
                            </td>
                        </tr>
                    </table>
                </td>
            </#macro>
            <#macro CUSTOMER_ADDRESS>
                <td style="width: 60%;">
                    <table class="full-width">
                        <tr class="full-width">
                            <td class="full-width header">
                                Customer Address
                            </td>
                        </tr>
                        <tr class="full-width">
                            <td class="full-width">
                                Cofficient Ltd
                            </td>
                        </tr>
                        <tr class="full-width">
                            <td class="full-width">
                                The Innovation Center
                            </td>
                        </tr>
                        <tr class="full-width">
                            <td class="full-width">
                                1 Ainslie Road
                            </td>
                        </tr>
                        <tr class="full-width">
                            <td class="full-width">
                                Glasgow
                            </td>
                        </tr>
                        <tr class="full-width">
                            <td class="full-width">
                               G52 4RU
                            </td>
                        </tr>
                    </table>
                </td>
            </#macro>
            <#macro ADDRESSES>
                <tr class="full-width">
                    <td class="full-width">
                        <table class="full-width">
                            <tr class="full-width">
                                <@CUSTOMER_ADDRESS />
                                <@BILLING_ADDRESS />
                            </tr>
                        </table>
                    </td>
                </tr>
            </#macro>
            <#macro LINE_BREAK>
            </table>
            </td>
            </tr>
            </table>
            <p style="page-break-before: always; margin-bottom: 50px;">&nbsp;</p>
            <table id="container" class="full-width">
                <tr class="full-width" style="max-width: 2480px;">
                    <td class="full-width item-table-td">
                        <table class="full-width items">
                            <tr>
                                <#list data.columns as col>
                                    <#assign colspan=GET_COLSPAN(col)/>
                                    <#assign className="border-top border-btm"/>
                                    <#if col_index==0>
                                        <#assign className=className+" border-left"/>
                                    </#if>
                                    <#if col_index==data.columns?size-1>
                                        <#assign className=className + " border-right"/>
                                    </#if>
                                    <td colspan="${colspan}" style="white-space: nowrap"
                                        class="${className}">
                                        ${col.alias}
                                    </td>
                                </#list>
                            </tr>
            </#macro>
            <#macro ITEMS>
                <#assign usedKeys=[] />
                <tr class="full-width" style="max-width: 2480px;">
                    <td class="full-width item-table-td">
                        <table class="full-width items">
                            <#assign TABLE_COLS=[]/>
                            <tr>
                                <#list data.columns as col>
                                    <#assign TABLE_COLS=TABLE_COLS+[col] />
                                    <#assign colspan=GET_COLSPAN(col)/>
                                    <#assign className="border-top border-btm"/>
                                    <#if col_index==0>
                                        <#assign className=className+" border-left"/>
                                    </#if>
                                    <#if col_index==data.columns?size-1>
                                        <#assign className=className + " border-right"/>
                                    </#if>
                                    <td colspan="${colspan}" style="white-space: nowrap"
                                        class="${className}">
                                        ${col.alias}
                                    </td>
                                </#list>
                            </tr>
                            <#list data.lines as line>
                                <#if CURRENT_MODULO_INDEX%PAGE_1_MODULO_INDEX==0 && CURRENT_MODULO_INDEX!=0 && CURRENT_PAGE==1>
                                    <@LINE_BREAK />
                                    <#assign CURRENT_PAGE=CURRENT_PAGE+1/>
                                    <#assign CURRENT_MODULO_INDEX=-1/>
                                <#elseif CURRENT_MODULO_INDEX%PAGE_2_MODULO_INDEX==0 && CURRENT_MODULO_INDEX!=0 && (CURRENT_PAGE > 1)>
                                    <@LINE_BREAK />
                                    <#assign CURRENT_PAGE=CURRENT_PAGE+1/>
                                    <#assign CURRENT_MODULO_INDEX=-1/>
                                </#if>
                                <tr>
                                    <#list TABLE_COLS as col>
                                        <#assign colspan=GET_COLSPAN(col)/>
                                        <#assign className="border-btm"/>
                                        <#if col_index==0>
                                            <#assign className=className+" border-left"/>
                                        </#if>
                                        <#if col_index==TABLE_COLS?size-1>
                                            <#assign className=className + " border-right"/>
                                        </#if>
                                            <td colspan="${colspan}"
                                                class="${className}">${line[col.name]}</td>
                                    </#list>
                                    <#assign usedKeys=[] />
                                </tr>
                                <#assign CURRENT_MODULO_INDEX=CURRENT_MODULO_INDEX+1/>
                            </#list>
                        </table>
                    </td>
                </tr>
            </#macro>
            <#macro BANK_DETAILS>
                <tr class="full-width">
                    <td style="width: 65%">&nbsp</td>
                    <td class="bank-details" style="width: 31%; background: #dbdbdb">
                        <table class="full-width">
                            <tr class="full-width">
                                <td class="half-width header">
                                    Bank Details
                                </td>
                            </tr>
                            <tr class="full-width">
                                <td class="half-width">
                                    The Royal Bank of Scotland
                                </td>
                            </tr>
                            <tr class="full-width">
                                <td class="half-width">
                                    Sort Code: 83-17-10
                                </td>
                            </tr>
                            <tr class="full-width">
                                <td class="half-width">
                                    Account Number: 10143417
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </#macro>
            <#macro TOTAL_TABLE>
                <tr class="full-width">
                    <td class="full-width">
                        <table class="full-width">
                            <tr class="full-width">
                                <td style="width: 65%">&nbsp</td>
                                <td align="right" style="width: 31%; background: #dbdbdb">
                                    <table class="full-width">
                                        <tr class="full-width">
                                            <td class="half-width" style="font-size: 12pt">
                                                TOTAL
                                            </td>
                                            <td align="right" class="half-width"
                                                style="font-size: 12pt">
                                                ${data.invoiceTotal}
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr class="full-width">
                                <td style="width: 65%">&nbsp</td>
                                <td style="width: 31%; background: #dbdbdb">&nbsp</td>
                            </tr>
                            <tr class="full-width">
                                <td style="width: 65%">&nbsp</td>
                                <td style="width: 31%; background: #dbdbdb">&nbsp</td>
                            </tr>
                            <@BANK_DETAILS/>
                        </table>
                    </td>
                </tr>
            </#macro>
        </macrolist>
        <title>Invoice</title>
        <style type="text/css">
            * {
                font-size: 7pt;
                font-family: 'Ubuntu Mono', monospace;
            }

            table {
                border-spacing: 0;
            }

            td {
                padding: 2px 3px;
            }

            .no-pad {
                padding: 0;
            }

            .full-width {
                width: 100%;
            }

            .half-width {
                width: 50%;
            }

            .quarter-width {
                width: 25%;
            }

            .border-blue {
                border: 1px solid blue;
            }

            .border-red {
                border: 1px solid red;
            }

            .border-green {
                border: 1px solid green;
            }

            .border-black {
                border: 1px solid black;
            }

            .title {
                font-size: 20pt;
                font-weight: bold;
                letter-spacing: 2px;
            }

            .header {
                font-weight: bold;
            }

            .items td {
                margin: 2px;
                padding: 3px 6px;
            }

            .items tr:nth-child(even) {
                background: #dbdbdb;
            }

            /*.bank-details td, .total td {*/
            /*    font-size: 9pt;*/
            /*}*/
            .total-and-bank {
                background: #dbdbdb;
            }


            .border-top-btm {
                border-top: 1px solid black;
                border-bottom: 1px solid black;
            }

            .border-top {
                border-top: 1px solid black;
            }

            .border-btm {
                border-bottom: 1px solid black;
            }

            .border-right {
                border-right: 1px solid black;
            }

            .border-left {
                border-left: 1px solid black;
            }
        </style>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Inconsolata:wght@200;900&display=swap" rel="stylesheet">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Ubuntu+Mono:wght@400;700&display=swap" rel="stylesheet">
    </head>
    <body style="padding: 25px 25px 50px 25px" size="A4">
    <table id="container" class="full-width">
        <@TRANSACTION_DETAILS/>
        <@BLANK_ROW/>
        <@BLANK_ROW/>
        <@BLANK_ROW/>
        <@ADDRESSES/>
        <@BLANK_ROW/>
        <@BLANK_ROW/>
        <@ITEMS/>
        <@BLANK_ROW/>
        <@BLANK_ROW/>
        <@TOTAL_TABLE/>
    </table>
    </body>
</pdf>
