<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:php="http://php.net/xsl">
    <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/EGRUL/СвЮЛ">
        <html lang="ru">
            <head>
                <meta charset="UTF-8"/>
                <style>
                    .doc {
                    max-width: 1230px;
                    margin: 0 auto;
                    }
                    .docHeader {
                    text-align: center;
                    }
                    .head, .text-center {
                    text-align: center;
                    }
                    .col-1{
                    width: 45px;
                    }
                    .num {
                    text-align: left;
                    padding-left: 50px;
                    background: #f4f4f4;
                    }
                    .head {
                    background: #e9e9e9;
                    }
                    .doc table {
                    width:100%;
                    border-collapse:collapse;
                    }
                    .doc table td,th{
                    border:1px solid black;
                    }
                    table th:nth-child(2) {
                    width:49%;
                    }
                </style>
            </head>
            <body>
                <div class="doc">
                    <div class="docHeader">
                        <h4>ЕДИНЫЙ ГОСУДАРСТВЕННЫЙ РЕЕСТР ЮРИДИЧЕСКИХ ЛИЦ</h4>
                        <h4>Cведения о юридическом лице:</h4>
                        <h4>
                            <xsl:value-of select="СвНаимЮЛ/@НаимЮЛПолн"/>
                        </h4>
                    </div>
                    ОРГН: <xsl:value-of select="@ОГРН"/>
                    <br/>
                    ИНН<xsl:if test="@КПП">/КПП</xsl:if>: <xsl:value-of select="@ИНН"/>
                    <xsl:if test="@КПП">/<xsl:value-of select="@КПП"/></xsl:if>
                    <br/>
                    по состоянию на:
                    <xsl:call-template name="formatDate">
                        <xsl:with-param name="date" select="@ДатаВып"/>
                    </xsl:call-template>
                    <br/>
                    <br/>
                    <table>
                        <tr>
                            <th class="col-1">№ п/п</th>
                            <th>Наименование показателя</th>
                            <th>Значение показателя</th>
                        </tr>
                        <tr>
                            <td class="col-1 text-center">1</td>
                            <td class="text-center">2</td>
                            <td class="text-center">3</td>
                        </tr>
                        <tr>
                            <td colspan="3" class="head">
                                <b>Наименование</b>
                            </td>
                        </tr>
                        <xsl:apply-templates select="СвНаимЮЛ"/>
                        <tr>
                            <td colspan="3" class="head">
                                <b>Адрес (место нахождения)</b>
                            </td>
                        </tr>
                        <xsl:apply-templates select="СвАдресЮЛ"/>
                        <xsl:if test="СвАдрЭлПочты">
                            <tr>
                                <td colspan="3" class="head">
                                    <b>Сведения об адресе электронной почты юридического лица</b>
                                </td>
                            </tr>
                            <xsl:apply-templates select="СвАдрЭлПочты"/>
                        </xsl:if>
                        <tr>
                            <td colspan="3" class="head">
                                <b>Сведения о регистрации</b>
                            </td>
                        </tr>
                        <xsl:apply-templates select="СвОбрЮЛ"/>
                        <tr>
                            <td colspan="3" class="head">
                                <b>Сведения о регистрирующем органе по месту нахождения ЮЛ</b>
                            </td>
                        </tr>
                        <xsl:apply-templates select="СвРегОрг"/>
                        <xsl:if test="СвСтатус">
                            <tr>
                                <td colspan="3" class="head">
                                    <b>Сведения о состоянии ЮЛ</b>
                                </td>
                            </tr>
                            <xsl:for-each select="СвСтатус">
                                <tr>
                                    <td colspan="3" class="num">
                                        <b>
                                            Статус №<xsl:value-of select="position()"/>
                                        </b>
                                    </td>
                                </tr>
                                <xsl:apply-templates select="."/>
                            </xsl:for-each>
                        </xsl:if>
                        <xsl:if test="СвПрекрЮЛ">
                            <tr>
                                <td colspan="3" class="head">
                                    <b>Сведения о прекращении ЮЛ</b>
                                </td>
                            </tr>
                            <xsl:apply-templates select="СвПрекрЮЛ"/>
                        </xsl:if>
                        <xsl:if test="СвУчетНО">
                            <tr>
                                <td colspan="3" class="head">
                                    <b>Сведения об учёте в налоговом органе</b>
                                </td>
                            </tr>
                            <xsl:apply-templates select="СвУчетНО"/>
                        </xsl:if>
                        <xsl:if test="СвРегПФ">
                            <tr>
                                <td colspan="3" class="head">
                                    <b>Сведения о регистрации в качестве страхователя в территориальном органе ПФ РФ</b>
                                </td>
                            </tr>
                            <xsl:apply-templates select="СвРегПФ"/>
                        </xsl:if>
                        <xsl:if test="СвРегФСС">
                            <tr>
                                <td colspan="3" class="head">
                                    <b>Сведения о регистрации в качестве страхователя в исполнительном органе Фонда социального страхования РФ</b>
                                </td>
                            </tr>
                            <xsl:apply-templates select="СвРегФСС"/>
                        </xsl:if>
                        <xsl:if test="СвУстКап">
                            <tr>
                                <td colspan="3" class="head">
                                    <b>Сведения о размере указанного в учредительных документах коммерческой организации уставного капитала</b>
                                </td>
                            </tr>
                            <xsl:apply-templates select="СвУстКап"/>
                        </xsl:if>
                        <xsl:if test="СвТипУстав">
                            <tr>
                                <td colspan="3" class="head">
                                    <b>Сведения об использовании юридическим лицом типового устава</b>
                                </td>
                            </tr>
                            <xsl:apply-templates select="СвТипУстав"/>
                        </xsl:if>
                        <xsl:if test="СвУпрОрг">
                            <tr>
                                <td colspan="3" class="head">
                                    <b>Сведения об управляющей организации</b>
                                </td>
                            </tr>
                            <xsl:for-each select="СвУпрОрг">
                                <tr>
                                    <td colspan="3" class="num">
                                        <b>
                                            Управляющая организация №<xsl:value-of select="position()"/>
                                        </b>
                                    </td>
                                </tr>
                                <xsl:apply-templates select="."/>
                            </xsl:for-each>
                        </xsl:if>
                        <xsl:if test="СведДолжнФЛ">
                            <tr>
                                <td colspan="3" class="head">
                                    <b>Сведения о лице, имеющем право без доверенности действовать от имени юридическоголица</b>
                                </td>
                            </tr>
                            <xsl:for-each select="СведДолжнФЛ">
                                <tr>
                                    <td colspan="3" class="num">
                                        <b>
                                            Должностное лицо №<xsl:value-of select="position()"/>
                                        </b>
                                    </td>
                                </tr>
                                <xsl:apply-templates select="."/>
                            </xsl:for-each>
                        </xsl:if>
                        <xsl:if test="СвУчредит">
                            <tr>
                                <td colspan="3" class="head">
                                    <b>Сведения об учредителях (участниках) юридического лица</b>
                                </td>
                            </tr>
                            <xsl:apply-templates select="СвУчредит"/>
                        </xsl:if>
                        <xsl:if test="СвДоляООО">
                            <tr>
                                <td colspan="3" class="head">
                                    <b>Сведения о доле в уставном капитале общества с ограниченной ответственностью, принадлежащей обществу</b>
                                </td>
                            </tr>
                            <xsl:apply-templates select="СвДоляООО"/>
                        </xsl:if>
                        <xsl:if test="СвДержРеестрАО">
                            <tr>
                                <td colspan="3" class="head">
                                    <b>Сведения о держателе реестра акционеров акционерного общества</b>
                                </td>
                            </tr>
                            <xsl:apply-templates select="СвДержРеестрАО"/>
                        </xsl:if>
                        <xsl:if test="СвОКВЭД">
                            <tr>
                                <td colspan="3" class="head">
                                    <b>Сведения о видах экономической деятельности по Общероссийскому классификатору видов экономической деятельности</b>
                                </td>
                            </tr>
                            <xsl:apply-templates select="СвОКВЭД"/>
                        </xsl:if>
                        <xsl:if test="СвЛицензия">
                            <tr>
                                <td colspan="3" class="head">
                                    <b>Сведения о лицензиях, выданных ЮЛ</b>
                                </td>
                            </tr>
                            <xsl:for-each select="СвЛицензия">
                                <tr>
                                    <td colspan="3" class="num">
                                        <b>
                                            Лицензия №<xsl:value-of select="position()"/>
                                        </b>
                                    </td>
                                </tr>
                                <xsl:apply-templates select="."/>
                            </xsl:for-each>
                        </xsl:if>
                        <xsl:if test="СвПодразд">
                            <tr>
                                <td colspan="3" class="head">
                                    <b>Сведения об обособленных подразделениях юридического лица</b>
                                </td>
                            </tr>
                            <xsl:apply-templates select="СвПодразд"/>
                        </xsl:if>
                        <xsl:if test="СвРеорг">
                            <tr>
                                <td colspan="3" class="head">
                                    <b>Сведения об участии в реорганизации</b>
                                </td>
                            </tr>
                            <xsl:for-each select="СвРеорг">
                                <xsl:apply-templates select="."/>
                            </xsl:for-each>
                        </xsl:if>
                        <xsl:if test="СвПредш">
                            <tr>
                                <td colspan="3" class="head">
                                    <b>Сведения о правопредшественнике</b>
                                </td>
                            </tr>
                            <xsl:for-each select="СвПредш">
                                <tr>
                                    <td colspan="3" class="num">
                                        <b>
                                            Предшественник №<xsl:value-of select="position()"/>
                                        </b>
                                    </td>
                                </tr>
                                <xsl:apply-templates select="."/>
                            </xsl:for-each>
                        </xsl:if>
                        <xsl:if test="СвКФХПредш">
                            <tr>
                                <td colspan="3" class="head">
                                    <b>Сведения о крестьянском (фермерском) хозяйстве, на базе имущества которого создано юридическое лицо</b>
                                </td>
                            </tr>
                            <xsl:for-each select="СвКФХПредш">
                                <tr>
                                    <td colspan="3" class="num">
                                        <b>
                                            КХФ предшественник №<xsl:value-of select="position()"/>
                                        </b>
                                    </td>
                                </tr>
                                <xsl:apply-templates select="."/>
                            </xsl:for-each>
                        </xsl:if>
                        <xsl:if test="СвПреем">
                            <tr>
                                <td colspan="3" class="head">
                                    <b>Сведения о правопреемнике</b>
                                </td>
                            </tr>
                            <xsl:for-each select="СвПреем">
                                <tr>
                                    <td colspan="3" class="num">
                                        <b>
                                            Правопреемник №<xsl:value-of select="position()"/>
                                        </b>
                                    </td>
                                </tr>
                                <xsl:apply-templates select="."/>
                            </xsl:for-each>
                        </xsl:if>
                        <xsl:if test="СвКФХПреем">
                            <tr>
                                <td colspan="3" class="head">
                                    <b>Сведения о крестьянском (фермерском) хозяйстве, на базе имущества которого создано юридическое лицо</b>
                                </td>
                            </tr>
                            <xsl:for-each select="СвКФХПреем">
                                <tr>
                                    <td colspan="3" class="num">
                                        <b>
                                            КХФ правопреемник №<xsl:value-of select="position()"/>
                                        </b>
                                    </td>
                                </tr>
                                <xsl:apply-templates select="."/>
                            </xsl:for-each>
                        </xsl:if>
                        <tr>
                            <td colspan="3" class="head">
                                <b>Сведения о записях, внесенных в ЕГРЮЛ</b>
                            </td>
                        </tr>
                        <xsl:for-each select="СвЗапЕГРЮЛ">
                            <tr>
                                <td colspan="3" class="num">
                                    <b>
                                        Запись №<xsl:value-of select="position()"/>
                                    </b>
                                </td>
                            </tr>
                            <xsl:apply-templates select="."/>
                        </xsl:for-each>
                    </table>
                </div>
            </body>
        </html>
    </xsl:template>

    <!-- Базовые значения ЕГРЮЛ -->

    <xsl:template match="СвНаимЮЛ">
        <tr>
            <td class="text-center">
                <xsl:value-of select="php:function('rowNum', .)"/>
            </td>
            <td>Полное наименование</td>
            <td>
                <xsl:value-of select="@НаимЮЛПолн"/>
            </td>
        </tr>
        <xsl:if test="@НаимЮЛСокр">
            <tr>
                <td class="text-center">
                    <xsl:value-of select="php:function('rowNum', .)"/>
                </td>
                <td>Сокращенное наименование</td>
                <td>
                    <xsl:value-of select="@НаимЮЛСокр"/>
                </td>
            </tr>
        </xsl:if>
        <xsl:apply-templates select="./ГРНДата"/>
        <xsl:if test="./ГРНДатаИспр">
            <xsl:apply-templates select="./ГРНДатаИспр"/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="СвАдресЮЛ">
        <xsl:apply-templates select="АдресРФ"/>
        <xsl:for-each select="СвНедАдресЮЛ">
            <tr>
                <td class="text-center">
                    <xsl:value-of select="php:function('rowNum', .)"/>
                </td>
                <td>Сведения о недостоверности адреса</td>
                <td>
                    <xsl:value-of select="./@ТекстНедАдресЮЛ"/>
                </td>
            </tr>
            <xsl:if test="./РешСудНедАдр">
                <xsl:apply-templates select="./РешСудНедАдр"/>
            </xsl:if>
            <xsl:apply-templates select="./ГРНДата"/>
            <xsl:if test="./ГРНДатаИспр">
                <xsl:apply-templates select="./ГРНДатаИспр"/>
            </xsl:if>
        </xsl:for-each>
        <xsl:if test="СвРешИзмМН">
            <xsl:if test="СвРешИзмМН/Регион">
                <tr>
                    <td class="text-center">
                        <xsl:value-of select="php:function('rowNum', .)"/>
                    </td>
                    <td>Субъект Российской федерации</td>
                    <td>
                        <xsl:value-of select="СвРешИзмМН/Регион/@ТипРегион"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="СвРешИзмМН/Регион/@НаимРегион"/>
                    </td>
                </tr>
            </xsl:if>

            <xsl:if test="Район">
                <tr>
                    <td class="text-center">
                        <xsl:value-of select="php:function('rowNum', .)"/>
                    </td>
                    <td>Район (улус и т.п.)</td>
                    <td>
                        <xsl:value-of select="СвРешИзмМН/Район/@ТипРайон"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="СвРешИзмМН/Район/@НаимРайон"/>
                    </td>
                </tr>
            </xsl:if>

            <xsl:if test="СвРешИзмМН/Город">
                <tr>
                    <td class="text-center">
                        <xsl:value-of select="php:function('rowNum', .)"/>
                    </td>
                    <td>Город (волость и т.п.)</td>
                    <td>
                        <xsl:value-of select="СвРешИзмМН/Город/@ТипГород"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="СвРешИзмМН/Город/@НаимГород"/>
                    </td>
                </tr>
            </xsl:if>

            <xsl:if test="СвРешИзмМН/НаселПункт">
                <tr>
                    <td class="text-center">
                        <xsl:value-of select="php:function('rowNum', .)"/>
                    </td>
                    <td>НаселПункт (село и т.п.)</td>
                    <td>
                        <xsl:value-of select="СвРешИзмМН/НаселПункт/@ТипНаселПункт"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="СвРешИзмМН/НаселПункт/@НаимНаселПункт"/>
                    </td>
                </tr>
            </xsl:if>
            <xsl:apply-templates select="СвРешИзмМН/ГРНДата"/>
            <xsl:if test="СвРешИзмМН/ГРНДатаИспр">
                <xsl:apply-templates select="СвРешИзмМН/ГРНДатаИспр"/>
            </xsl:if>
        </xsl:if>
    </xsl:template>

    <xsl:template match="СвАдрЭлПочты">
        <tr>
            <td class="text-center">
                <xsl:value-of select="php:function('rowNum', .)"/>
            </td>
            <td>E-mail:</td>
            <td>
                <xsl:value-of select="@E-mail"/>
            </td>
        </tr>
        <xsl:apply-templates select="./ГРНДата"/>
        <xsl:if test="./ГРНДатаИспр">
            <xsl:apply-templates select="./ГРНДатаИспр"/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="СвОбрЮЛ">
        <tr>
            <td class="text-center">
                <xsl:value-of select="php:function('rowNum', .)"/>
            </td>
            <td>Cпособ образования</td>
            <td>
                <xsl:value-of select="СпОбрЮЛ/@НаимСпОбрЮЛ"/>
            </td>
        </tr>
        <tr>
            <td class="text-center">
                <xsl:value-of select="php:function('rowNum', .)"/>
            </td>
            <td>ОГРН</td>
            <td>
                <xsl:value-of select="@ОГРН"/>
            </td>
        </tr>
        <tr>
            <td class="text-center">
                <xsl:value-of select="php:function('rowNum', .)"/>
            </td>
            <td>Дата присвоения ОГРН</td>
            <td>
                <xsl:call-template name="formatDate">
                    <xsl:with-param name="date" select="@ДатаОГРН"/>
                </xsl:call-template>
            </td>
        </tr>
        <xsl:if test="@РегНом">
            <tr>
                <td class="text-center">
                    <xsl:value-of select="php:function('rowNum', .)"/>
                </td>
                <td>Регномер до 01.07.2002</td>
                <td>
                    <xsl:value-of select="@РегНом"/>
                </td>
            </tr>
        </xsl:if>
        <xsl:if test="@ДатаРег">
            <tr>
                <td class="text-center">
                    <xsl:value-of select="php:function('rowNum', .)"/>
                </td>
                <td>Дата регистрации</td>
                <td>
                    <xsl:call-template name="formatDate">
                        <xsl:with-param name="date" select="@ДатаРег"/>
                    </xsl:call-template>
                </td>
            </tr>
        </xsl:if>
        <xsl:if test="@НаимРО">
            <tr>
                <td class="text-center">
                    <xsl:value-of select="php:function('rowNum', .)"/>
                </td>
                <td>Наименование рег.органа</td>
                <td>
                    <xsl:value-of select="@НаимРО"/>
                </td>
            </tr>
        </xsl:if>
        <xsl:apply-templates select="./ГРНДата"/>
        <xsl:if test="./ГРНДатаИспр">
            <xsl:apply-templates select="./ГРНДатаИспр"/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="СвРегОрг">
        <tr>
            <td class="text-center">
                <xsl:value-of select="php:function('rowNum', .)"/>
            </td>
            <td>Наименование регистрирующего органа</td>
            <td>
                <xsl:value-of select="@НаимНО"/>
            </td>
        </tr>
        <tr>
            <td class="text-center">
                <xsl:value-of select="php:function('rowNum', .)"/>
            </td>
            <td>Адрес регистрирующего органа</td>
            <td>
                <xsl:value-of select="@АдрРО"/>
            </td>
        </tr>
        <xsl:apply-templates select="ГРНДата"/>
    </xsl:template>

    <xsl:template match="СвСтатус">
        <tr>
            <td class="text-center">
                <xsl:value-of select="php:function('rowNum', .)"/>
            </td>
            <td>Наименование статуса юридического лица</td>
            <td>
                <xsl:value-of select="СвСтатус/@НаимСтатусЮЛ"/>
            </td>
        </tr>
        <xsl:apply-templates select="./ГРНДата"/>
        <xsl:if test="./ГРНДатаИспр">
            <xsl:apply-templates select="./ГРНДатаИспр"/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="СвПрекрЮЛ">
        <tr>
            <td class="text-center">
                <xsl:value-of select="php:function('rowNum', .)"/>
            </td>
            <td>Дата прекращения ЮЛ</td>
            <td>
                <xsl:call-template name="formatDate">
                    <xsl:with-param name="date" select="@ДатаПрекрЮЛ"/>
                </xsl:call-template>
            </td>
        </tr>
        <tr>
            <td class="text-center">
                <xsl:value-of select="php:function('rowNum', .)"/>
            </td>
            <td>Способ прекращения ЮЛ</td>
            <td>
                <xsl:value-of select="СпПрекрЮЛ/@НаимСпПрекрЮЛ"/>
            </td>
        </tr>
        <tr>
            <td class="text-center">
                <xsl:value-of select="php:function('rowNum', .)"/>
            </td>
            <td>Сведения о регистрирующем органе, внёсшем запись о прекращении ЮЛ</td>
            <td>
                <xsl:value-of select="СвРегОрг/@НаимНО"/>
            </td>
        </tr>
        <xsl:apply-templates select="ГРНДата"/>
    </xsl:template>

    <xsl:template match="СвУчетНО">
        <tr>
            <td class="text-center">
                <xsl:value-of select="php:function('rowNum', .)"/>
            </td>
            <td>ИНН</td>
            <td>
                <xsl:value-of select="@ИНН"/>
            </td>
        </tr>
        <tr>
            <td class="text-center">
                <xsl:value-of select="php:function('rowNum', .)"/>
            </td>
            <td>КПП</td>
            <td>
                <xsl:value-of select="@КПП"/>
            </td>
        </tr>
        <tr>
            <td class="text-center">
                <xsl:value-of select="php:function('rowNum', .)"/>
            </td>
            <td>Дата постановки на учёт</td>
            <td>
                <xsl:call-template name="formatDate">
                    <xsl:with-param name="date" select="@ДатаПостУч"/>
                </xsl:call-template>
            </td>
        </tr>
        <xsl:apply-templates select="СвНО"/>
        <xsl:apply-templates select="./ГРНДата"/>
        <xsl:if test="./ГРНДатаИспр">
            <xsl:apply-templates select="./ГРНДатаИспр"/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="СвРегПФ">
        <tr>
            <td class="text-center">
                <xsl:value-of select="php:function('rowNum', .)"/>
            </td>
            <td>Регистрационный номер</td>
            <td>
                <xsl:value-of select="@РегНомПФ"/>
            </td>
        </tr>
        <tr>
            <td class="text-center">
                <xsl:value-of select="php:function('rowNum', .)"/>
            </td>
            <td>Дата регистрации</td>
            <td>
                <xsl:call-template name="formatDate">
                    <xsl:with-param name="date" select="@ДатаРег"/>
                </xsl:call-template>
            </td>
        </tr>
        <tr>
            <td class="text-center">
                <xsl:value-of select="php:function('rowNum', .)"/>
            </td>
            <td>Наименование территориального органа ПФ</td>
            <td>
                <xsl:value-of select="СвОргПФ/@НаимПФ"/>
            </td>
        </tr>
        <xsl:apply-templates select="./ГРНДата"/>
        <xsl:if test="./ГРНДатаИспр">
            <xsl:apply-templates select="./ГРНДатаИспр"/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="СвРегФСС">
        <tr>
            <td class="text-center">
                <xsl:value-of select="php:function('rowNum', .)"/>
            </td>
            <td>Регистрационный номер</td>
            <td>
                <xsl:value-of select="@РегНомФСС"/>
            </td>
        </tr>
        <tr>
            <td class="text-center">
                <xsl:value-of select="php:function('rowNum', .)"/>
            </td>
            <td>Дата регистрации</td>
            <td>
                <xsl:call-template name="formatDate">
                    <xsl:with-param name="date" select="@ДатаРег"/>
                </xsl:call-template>
            </td>
        </tr>
        <tr>
            <td class="text-center">
                <xsl:value-of select="php:function('rowNum', .)"/>
            </td>
            <td>Наименование исполнительного органа Фонда социального страхования</td>
            <td>
                <xsl:value-of select="СвОргФСС/@НаимФСС"/>
            </td>
        </tr>
        <xsl:apply-templates select="./ГРНДата"/>
        <xsl:if test="./ГРНДатаИспр">
            <xsl:apply-templates select="./ГРНДатаИспр"/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="СвУстКап">
        <tr>
            <td class="text-center">
                <xsl:value-of select="php:function('rowNum', .)"/>
            </td>
            <td>Наименование вида капитала</td>
            <td>
                <xsl:value-of select="@НаимВидКап"/>
            </td>
        </tr>
        <tr>
            <td class="text-center">
                <xsl:value-of select="php:function('rowNum', .)"/>
            </td>
            <td>Размер в рублях</td>
            <td>
                <xsl:value-of select="@СумКап"/>
            </td>
        </tr>
        <xsl:if test="ДоляРубля">
            <tr>
                <td class="text-center">
                    <xsl:value-of select="php:function('rowNum', .)"/>
                </td>
                <td>Доля рубля в капитале</td>
                <td>
                    <xsl:value-of select="ДоляРубля/@Числит"/> / <xsl:value-of select="ДоляРубля/@Знаменат"/>
                </td>
            </tr>
        </xsl:if>
        <xsl:apply-templates select="./ГРНДата"/>
        <xsl:if test="./ГРНДатаИспр">
            <xsl:apply-templates select="./ГРНДатаИспр"/>
        </xsl:if>
        <xsl:if test="СведУмУК">
            <tr>
                <td class="text-center">
                    <xsl:value-of select="php:function('rowNum', .)"/>
                </td>
                <td>Величина, на которую уменьшается уставный капитал (в рублях)</td>
                <td>
                    <xsl:value-of select="СведУмУК/@ВелУмУК"/>
                </td>
            </tr>
            <tr>
                <td class="text-center">
                    <xsl:value-of select="php:function('rowNum', .)"/>
                </td>
                <td>Дата принятия решения об уменьшении уставного капитала</td>
                <td>
                    <xsl:call-template name="formatDate">
                        <xsl:with-param name="date" select="СведУмУК/@ДатаРеш"/>
                    </xsl:call-template>
                </td>
            </tr>
            <xsl:apply-templates select="СведУмУК/ГРНДата"/>
            <xsl:if test="СведУмУК/ГРНДатаИспр">
                <xsl:apply-templates select="СведУмУК/ГРНДатаИспр"/>
            </xsl:if>
        </xsl:if>
    </xsl:template>

    <xsl:template match="СвТипУстав">
        <tr>
            <td class="text-center">
                <xsl:value-of select="php:function('rowNum', .)"/>
            </td>
            <td>Наименование государственного органа, утвердившего типовой устав</td>
            <td>
                <xsl:value-of select="СвНПАУтвТУ/@НаимГОУтвТУ"/>
            </td>
        </tr>
        <tr>
            <td class="text-center">
                <xsl:value-of select="php:function('rowNum', .)"/>
            </td>
            <td>Вид нормативного правового акта об утверждении типового устава</td>
            <td>
                <xsl:value-of select="СвНПАУтвТУ/@ВидНПА"/>
            </td>
        </tr>
        <xsl:if test="СвНПАУтвТУ/@НаимНПА">
            <tr>
                <td class="text-center">
                    <xsl:value-of select="php:function('rowNum', .)"/>
                </td>
                <td>Наименование нормативного правового акта об утверждении типового устава</td>
                <td>
                    <xsl:value-of select="СвНПАУтвТУ/@НаимНПА"/>
                </td>
            </tr>
        </xsl:if>
        <tr>
            <td class="text-center">
                <xsl:value-of select="php:function('rowNum', .)"/>
            </td>
            <td>Номер нормативного правового акта об утверждении типового устава</td>
            <td>
                <xsl:value-of select="СвНПАУтвТУ/@НомерНПА"/>
            </td>
        </tr>
        <tr>
            <td class="text-center">
                <xsl:value-of select="php:function('rowNum', .)"/>
            </td>
            <td>Дата нормативного правового акта об утверждении типового устава</td>
            <td>
                <xsl:call-template name="formatDate">
                    <xsl:with-param name="date" select="СвНПАУтвТУ/@ДатаНПА"/>
                </xsl:call-template>
            </td>
        </tr>
        <xsl:if test="СвНПАУтвТУ/@НомерПрил">
            <tr>
                <td class="text-center">
                    <xsl:value-of select="php:function('rowNum', .)"/>
                </td>
                <td>Номер приложения</td>
                <td>
                    <xsl:value-of select="СвНПАУтвТУ/@НомерПрил"/>
                </td>
            </tr>
        </xsl:if>
        <xsl:apply-templates select="./ГРНДата"/>
        <xsl:if test="./ГРНДатаИспр">
            <xsl:apply-templates select="./ГРНДатаИспр"/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="СвУпрОрг">
        <xsl:if test="ГРНДатаПерв">
            <xsl:apply-templates select="ГРНДатаПерв"/>
            <tr>
                <td colspan="3">
                    <br/>
                </td>
            </tr>
        </xsl:if>
        <xsl:apply-templates select="НаимИННЮЛ"/>
        <xsl:if test="СвРегИн">
            <xsl:apply-templates select="СвРегИн"/>
        </xsl:if>
        <xsl:for-each select="СвНедДанУпрОрг">
            <tr>
                <td class="text-center">
                    <xsl:value-of select="php:function('rowNum', .)"/>
                </td>
                <td>Информация о недостоверности сведений</td>
                <td>
                    <xsl:value-of select="./@ТекстНедДанУпрОрг"/>
                </td>
            </tr>
            <xsl:apply-templates select="./РешСудНедДанУпрОрг"/>
            <xsl:apply-templates select="./ГРНДата"/>
            <xsl:if test="./ГРНДатаИспр">
                <xsl:apply-templates select="./ГРНДатаИспр"/>
            </xsl:if>
        </xsl:for-each>
        <xsl:if test="СвПредЮЛ">
            <tr>
                <td class="text-center">
                    <xsl:value-of select="php:function('rowNum', .)"/>
                </td>
                <td>Полное наименование представительства или филиала в РФ, через которое иностранное ЮЛ осуществляет полномочия управляющей организации</td>
                <td>
                    <xsl:value-of select="СвПредЮЛ/@НаимПредЮЛ"/>
                </td>
            </tr>
            <xsl:apply-templates select="СвПредЮЛ/ГРНДата"/>
            <xsl:if test="СвПредЮЛ/ГРНДатаИспр">
                <xsl:apply-templates select="СвПредЮЛ/ГРНДатаИспр"/>
            </xsl:if>
        </xsl:if>
        <xsl:if test="СвАдрРФ">
            <xsl:apply-templates select="СвАдрРФ"/>
        </xsl:if>
        <xsl:if test="СвНомТел">
            <xsl:apply-templates select="СвНомТел"/>
        </xsl:if>
        <xsl:if test="ПредИнЮЛ">
            <xsl:if test="ПредИнЮЛ/ГРНДатаПерв">
                <xsl:apply-templates select="ПредИнЮЛ/ГРНДатаПерв"/>
            </xsl:if>
            <xsl:apply-templates select="СвФЛ"/>
            <xsl:if test="ПредИнЮЛ/СвНомТел">
                <xsl:apply-templates select="ПредИнЮЛ/СвНомТел"/>
            </xsl:if>
        </xsl:if>
    </xsl:template>

    <xsl:template match="СведДолжнФЛ">
        <xsl:if test="ГРНДатаПерв">
            <xsl:apply-templates select="ГРНДатаПерв"/>
            <tr>
                <td colspan="3">
                    <br/>
                </td>
            </tr>
        </xsl:if>
        <xsl:apply-templates select="СвФЛ"/>
        <xsl:if test="@ОГРНИП">
            <tr>
                <td class="text-center">
                    <xsl:value-of select="php:function('rowNum', .)"/>
                </td>
                <td>Основной государственный регистрационный номер индивидуального предпринимателя - управляющего юридическим лицом</td>
                <td>
                    <xsl:value-of select="@ОГРНИП"/>
                </td>
            </tr>
        </xsl:if>
        <tr>
            <td class="text-center">
                <xsl:value-of select="php:function('rowNum', .)"/>
            </td>
            <td>Должность</td>
            <td>
                <xsl:value-of select="СвДолжн/@НаимДолжн"/>
            </td>
        </tr>
        <xsl:apply-templates select="СвДолжн/ГРНДата"/>
        <xsl:if test="СвДолжн/ГРНДатаИспр">
            <xsl:apply-templates select="СвДолжн/ГРНДатаИспр"/>
        </xsl:if>
        <xsl:if test="СвНомТел">
            <xsl:apply-templates select="СвНомТел"/>
        </xsl:if>
        <xsl:for-each select="СвНедДанДолжнФЛ">
            <tr>
                <td class="text-center">
                    <xsl:value-of select="php:function('rowNum', .)"/>
                </td>
                <td>Информация о недостоверности сведений</td>
                <td>
                    <xsl:value-of select="./@ТекстНедДанДолжнФЛ"/>
                </td>
            </tr>
            <xsl:if test="./РешСудНедДанДолжнФЛ">
                <xsl:apply-templates select="./РешСудНедДанДолжнФЛ"/>
            </xsl:if>
            <xsl:apply-templates select="./ГРНДата"/>
            <xsl:if test="./ГРНДатаИспр">
                <xsl:apply-templates select="./ГРНДатаИспр"/>
            </xsl:if>
        </xsl:for-each>

        <xsl:if test="СвДискв">
            <tr>
                <td colspan="3">
                    <br/>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    Сведения о дисквалификации лица, имеющего право без доверенности действовать от имени юридического лица
                </td>
            </tr>
            <xsl:for-each select="СвДискв">
                <tr>
                    <td class="text-center">
                        <xsl:value-of select="php:function('rowNum', .)"/>
                    </td>
                    <td>Дата начала дисквалификации</td>
                    <td>
                        <xsl:call-template name="formatDate">
                            <xsl:with-param name="date" select="./@ДатаНачДискв"/>
                        </xsl:call-template>
                    </td>
                </tr>
                <tr>
                    <td class="text-center">
                        <xsl:value-of select="php:function('rowNum', .)"/>
                    </td>
                    <td>Дата окончания дисквалификации</td>
                    <td>
                        <xsl:call-template name="formatDate">
                            <xsl:with-param name="date" select="./@ДатаОкончДискв"/>
                        </xsl:call-template>
                    </td>
                </tr>
                <tr>
                    <td class="text-center">
                        <xsl:value-of select="php:function('rowNum', .)"/>
                    </td>
                    <td>Дата вынесения судебным органом постановления о дисквалификации</td>
                    <td>
                        <xsl:call-template name="formatDate">
                            <xsl:with-param name="date" select="./@ДатаРеш"/>
                        </xsl:call-template>
                    </td>
                </tr>
                <xsl:apply-templates select="./ГРНДата"/>
                <xsl:if test="./ГРНДатаИспр">
                    <xsl:apply-templates select="./ГРНДатаИспр"/>
                </xsl:if>
            </xsl:for-each>
        </xsl:if>

    </xsl:template>

    <xsl:template match="СвУчредит">
        <xsl:if test="УчрЮЛРос">
            <tr>
                <td colspan="3" class="num">
                    <b>
                        <i>Сведения об учредителе (участнике) - российском ЮЛ</i>
                    </b>
                </td>
            </tr>
            <xsl:for-each select="УчрЮЛРос">
                <tr>
                    <td colspan="3" class="num">
                        <b>
                            Учредитель №<xsl:value-of select="position()"/>
                        </b>
                    </td>
                </tr>
                <xsl:if test="./ГРНДатаПерв">
                    <xsl:apply-templates select="./ГРНДатаПерв"/>
                </xsl:if>
                <xsl:apply-templates select="./НаимИННЮЛ"/>
                <tr>
                    <td colspan="3">
                        <br/>
                    </td>
                </tr>
                <xsl:if test="./СвРегСтарые">
                    <xsl:if test="./СвРегСтарые/@РегНом">
                        <tr>
                            <td class="text-center">
                                <xsl:value-of select="php:function('rowNum', .)"/>
                            </td>
                            <td>Регистрационный номер, присвоенный юридическому лицу до 1 июля 2002 года</td>
                            <td>
                                <xsl:value-of select="./СвРегСтарые/@РегНом"/>
                            </td>
                        </tr>
                    </xsl:if>
                    <xsl:if test="./СвРегСтарые/@ДатаРег">
                        <tr>
                            <td class="text-center">
                                <xsl:value-of select="php:function('rowNum', .)"/>
                            </td>
                            <td>Дата регистрации юридического лица до 1 июля 2002 года</td>
                            <td>
                                <xsl:call-template name="formatDate">
                                    <xsl:with-param name="date" select="./СвРегСтарые/@ДатаРег"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                    </xsl:if>
                    <xsl:if test="./СвРегСтарые/@НаимРО">
                        <tr>
                            <td class="text-center">
                                <xsl:value-of select="php:function('rowNum', .)"/>
                            </td>
                            <td>Наименование органа, зарегистрировавшего юридическое лицо до 1 июля 2002 года</td>
                            <td>
                                <xsl:value-of select="./СвРегСтарые/@НаимРО"/>
                            </td>
                        </tr>
                    </xsl:if>
                </xsl:if>
                <xsl:for-each select="./СвНедДанУчр">
                    <xsl:apply-templates select="."/>
                </xsl:for-each>
                <xsl:if test="./ДоляУстКап">
                    <xsl:apply-templates select="./ДоляУстКап"/>
                </xsl:if>
                <xsl:if test="./СвОбрем">
                    <tr>
                        <td colspan="3">
                            <br/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">Сведения об обременении</td>
                    </tr>
                    <xsl:for-each select="./СвОбрем">
                        <tr>
                            <td colspan="3" class="num">
                                <b>
                                    Обременение №<xsl:value-of select="position()"/>
                                </b>
                            </td>
                        </tr>
                        <xsl:apply-templates select="."/>
                    </xsl:for-each>
                </xsl:if>
                <xsl:apply-templates select="./СвРегСтарые/ГРНДата"/>
                <xsl:if test="./СвРегСтарые/ГРНДатаИспр">
                    <xsl:apply-templates select="./СвРегСтарые/ГРНДатаИспр"/>
                </xsl:if>

            </xsl:for-each>
        </xsl:if>
        <xsl:if test="УчрЮЛИн">
            <tr>
                <td colspan="3" class="num">
                    <b>
                        <i>Сведения об учредителе (участнике) - иностранном ЮЛ</i>
                    </b>
                </td>
            </tr>
            <xsl:for-each select="УчрЮЛИн">
                <tr>
                    <td colspan="3" class="num">
                        <b>
                            Иностранное ЮЛ №<xsl:value-of select="position()"/>
                        </b>
                    </td>
                </tr>
                <xsl:if test="./ГРНДатаПерв">
                    <xsl:apply-templates select="./ГРНДатаПерв"/>
                </xsl:if>
                <xsl:apply-templates select="./НаимИННЮЛ"/>
                <tr>
                    <td colspan="3">
                        <br/>
                    </td>
                </tr>
                <xsl:for-each select="./СвРегИн">
                    <xsl:apply-templates select="."/>
                </xsl:for-each>
                <xsl:for-each select="./СвНедДанУчр">
                    <xsl:apply-templates select="."/>
                </xsl:for-each>
                <xsl:if test="./ДоляУстКап">
                    <tr>
                        <td colspan="3">
                            <br/>
                        </td>
                    </tr>
                    <xsl:apply-templates select="./ДоляУстКап"/>
                </xsl:if>
                <xsl:if test="./СвОбрем">
                    <tr>
                        <td colspan="3">
                            <br/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">Сведения об обременении</td>
                    </tr>
                    <xsl:for-each select="./СвОбрем">
                        <tr>
                            <td colspan="3" class="num">
                                <b>
                                    Обременение №<xsl:value-of select="position()"/>
                                </b>
                            </td>
                        </tr>
                        <xsl:apply-templates select="."/>
                    </xsl:for-each>
                </xsl:if>
            </xsl:for-each>
        </xsl:if>
        <xsl:if test="УчрФЛ">
            <tr>
                <td colspan="3" class="num">
                    <b>
                        <i>Сведения об учредителе (участнике) - ФЛ</i>
                    </b>
                </td>
            </tr>
            <xsl:for-each select="УчрФЛ">
                <tr>
                    <td colspan="3" class="num">
                        <b>
                            ФЛ №<xsl:value-of select="position()"/>
                        </b>
                    </td>
                </tr>
                <xsl:if test="./ГРНДатаПерв">
                    <xsl:apply-templates select="./ГРНДатаПерв"/>
                </xsl:if>
                <xsl:apply-templates select="./СвФЛ"/>
                <xsl:for-each select="./СвНедДанУчр">
                    <xsl:apply-templates select="."/>
                </xsl:for-each>
                <xsl:if test="./ДоляУстКап">
                    <tr>
                        <td colspan="3">
                            <br/>
                        </td>
                    </tr>
                    <xsl:apply-templates select="./ДоляУстКап"/>
                </xsl:if>
                <xsl:if test="./СвОбрем">
                    <tr>
                        <td colspan="3">
                            <br/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">Сведения об обременении</td>
                    </tr>
                    <xsl:for-each select="./СвОбрем">
                        <tr>
                            <td colspan="3" class="num">
                                <b>
                                    Обременение №<xsl:value-of select="position()"/>
                                </b>
                            </td>
                        </tr>
                        <xsl:apply-templates select="."/>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="./СвДовУпрЮЛ">
                    <xsl:if test="./СвДовУпрЮЛ/ГРНДатаПерв">
                        <xsl:apply-templates select="./СвДовУпрЮЛ/ГРНДатаПерв"/>
                    </xsl:if>
                    <xsl:apply-templates select="./СвДовУпрЮЛ/НаимИННДовУпр"/>
                </xsl:if>
                <xsl:if test="./СвДовУпрФЛ">
                    <xsl:if test="./СвДовУпрФЛ/ГРНДатаПерв">
                        <xsl:apply-templates select="./СвДовУпрФЛ/ГРНДатаПерв"/>
                    </xsl:if>
                    <xsl:apply-templates select="./СвДовУпрФЛ/СвФЛ"/>
                </xsl:if>
                <xsl:if test="./СвДовУпрФЛ">
                    <xsl:if test="./СвДовУпрФЛ/ГРНДатаПерв">
                        <xsl:apply-templates select="./СвДовУпрФЛ/ГРНДатаПерв"/>
                    </xsl:if>
                    <xsl:apply-templates select="./СвДовУпрФЛ/СвФЛ"/>
                </xsl:if>
            </xsl:for-each>
        </xsl:if>
        <xsl:if test="УчрРФСубМО">
            <tr>
                <td colspan="3" class="num">
                    <b>
                        <i>Сведения об учредителе (участнике) - РФ, субъекте РФ, муниципальном образовании</i>
                    </b>
                </td>
            </tr>
            <xsl:for-each select="УчрРФСубМО">
                <tr>
                    <td colspan="3" class="num">
                        <b>
                            Субъект РФ<xsl:value-of select="position()"/>
                        </b>
                    </td>
                </tr>
                <xsl:if test="./ГРНДатаПерв">
                    <xsl:apply-templates select="./ГРНДатаПерв"/>
                </xsl:if>
                <tr>
                    <td>Сведения о виде учредителя (участника) и (при необходимости) наименовании муниципального образования и региона</td>
                    <td>
                        <xsl:choose>
                            <xsl:when test="./ВидНаимУчр/@КодУчрРФСубМО = 1">
                                Российская Федерация
                            </xsl:when>
                            <xsl:when test="./ВидНаимУчр/@КодУчрРФСубМО = 2">
                                <xsl:value-of select="./ВидНаимУчр/@НаимРегион"/>
                            </xsl:when>
                            <xsl:when test="./ВидНаимУчр/@КодУчрРФСубМО = 3">
                                <xsl:value-of select="./ВидНаимУчр/@НаимМО"/>
                            </xsl:when>
                        </xsl:choose>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <br/>
                    </td>
                </tr>
                <xsl:for-each select="./СвНедДанУчр">
                    <xsl:apply-templates select="."/>
                </xsl:for-each>
                <xsl:if test="./ДоляУстКап">
                    <tr>
                        <td colspan="3">
                            <br/>
                        </td>
                    </tr>
                    <xsl:apply-templates select="./ДоляУстКап"/>
                </xsl:if>
                <xsl:if test="./СвОбрем">
                    <tr>
                        <td colspan="3">
                            <br/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">Сведения об обременении</td>
                    </tr>
                    <xsl:for-each select="./СвОбрем">
                        <tr>
                            <td colspan="3" class="num">
                                <b>
                                    Обременение №<xsl:value-of select="position()"/>
                                </b>
                            </td>
                        </tr>
                        <xsl:apply-templates select="."/>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="./СвОргОсущПр">
                    <xsl:if test="./СвОргОсущПр/ГРНДатаПерв">
                        <xsl:apply-templates select="./СвОргОсущПр/ГРНДатаПерв"/>
                    </xsl:if>
                    <xsl:apply-templates select="./СвОргОсущПр/НаимИННЮЛ"/>
                </xsl:if>
                <xsl:if test="./СвФЛОсущПр">
                    <xsl:if test="./СвФЛОсущПр/ГРНДатаПерв">
                        <xsl:apply-templates select="./СвФЛОсущПр/ГРНДатаПерв"/>
                    </xsl:if>
                    <xsl:apply-templates select="./СвФЛОсущПр/СвФЛ"/>
                </xsl:if>
            </xsl:for-each>
        </xsl:if>
        <xsl:if test="УчрПИФ">
            <tr>
                <td colspan="3" class="num">
                    <b>
                        <i>Сведения о ПИФ, в состав имущества которого включена доля в уставном капитале</i>
                    </b>
                </td>
            </tr>
            <xsl:for-each select="УчрПИФ">
                <tr>
                    <td colspan="3" class="num">
                        <b>
                            РИФ №<xsl:value-of select="position()"/>
                        </b>
                    </td>
                </tr>
                <xsl:if test="./ГРНДатаПерв">
                    <xsl:apply-templates select="./ГРНДатаПерв"/>
                </xsl:if>
                <tr>
                    <td class="text-center">
                        <xsl:value-of select="php:function('rowNum', .)"/>
                    </td>
                    <td>Сведения о названии (индивидуальном обозначении) паевого инвестиционного фонда</td>
                    <td>
                        <xsl:value-of select="./СвНаимПИФ/@НаимПИФ"/>
                    </td>
                </tr>
                <xsl:apply-templates select="./СвНаимПИФ/ГРНДата"/>
                <xsl:if test="./СвНаимПИФ/ГРНДатаИспр">
                    <xsl:apply-templates select="./СвНаимПИФ/ГРНДатаИспр"/>
                </xsl:if>
                <tr>
                    <td colspan="3">
                        <br/>
                    </td>
                </tr>
                <xsl:for-each select="./СвНедДанУчр">
                    <xsl:apply-templates select="."/>
                </xsl:for-each>
                <xsl:if test="./СвУпрКомпПИФ">
                    <xsl:if test="./СвУпрКомпПИФ/ГРНДатаПерв">
                        <xsl:apply-templates select="./СвУпрКомпПИФ/ГРНДатаПерв"/>
                    </xsl:if>
                    <xsl:apply-templates select="./СвУпрКомпПИФ/УпрКомпПиф"/>
                </xsl:if>
                <xsl:if test="./ДоляУстКап">
                    <tr>
                        <td colspan="3">
                            <br/>
                        </td>
                    </tr>
                    <xsl:apply-templates select="./ДоляУстКап"/>
                </xsl:if>
                <xsl:if test="./СвОбрем">
                    <tr>
                        <td colspan="3">
                            <br/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">Сведения об обременении</td>
                    </tr>
                    <xsl:for-each select="./СвОбрем">
                        <tr>
                            <td colspan="3" class="num">
                                <b>
                                    Обременение №<xsl:value-of select="position()"/>
                                </b>
                            </td>
                        </tr>
                        <xsl:apply-templates select="."/>
                    </xsl:for-each>
                </xsl:if>
            </xsl:for-each>
        </xsl:if>
    </xsl:template>

    <xsl:template match="СвДержРеестрАО">
        <xsl:if test="ГРНДатаПерв">
            <xsl:apply-templates select="ГРНДатаПерв"/>
            <tr>
                <td colspan="3">
                    <br/>
                </td>
            </tr>
        </xsl:if>
        <xsl:apply-templates select="ДержРеестрАО"/>
    </xsl:template>

    <xsl:template match="СвОКВЭД">
        <xsl:if test="СвОКВЭДОсн">
            <tr>
                <td colspan="3" class="head">
                    <b>
                        <i>Сведения об основном виде деятельности</i>
                    </b>
                </td>
            </tr>
            <xsl:apply-templates select="СвОКВЭДОсн"/>
        </xsl:if>
        <xsl:if test="СвОКВЭДДоп">
            <tr>
                <td colspan="3" class="head">
                    <b>
                        <i>Сведения о дополнительных видах деятельности</i>
                    </b>
                </td>
            </tr>
            <xsl:for-each select="СвОКВЭДДоп">
                <tr>
                    <td colspan="3" class="num">
                        <b>
                            Дополнительный вид деятельности №<xsl:value-of select="position()"/>
                        </b>
                    </td>
                </tr>
                <xsl:apply-templates select="."/>
            </xsl:for-each>
        </xsl:if>
    </xsl:template>

    <xsl:template match="СвЛицензия">
        <tr>
            <td class="text-center">
                <xsl:value-of select="php:function('rowNum', .)"/>
            </td>
            <td>Серия и номер лицензии</td>
            <td>
                <xsl:value-of select="@НомЛиц"/>
            </td>
        </tr>
        <tr>
            <td class="text-center">
                <xsl:value-of select="php:function('rowNum', .)"/>
            </td>
            <td>Дата лицензии</td>
            <td>
                <xsl:call-template name="formatDate">
                    <xsl:with-param name="date" select="@ДатаЛиц"/>
                </xsl:call-template>
            </td>
        </tr>
        <tr>
            <td class="text-center">
                <xsl:value-of select="php:function('rowNum', .)"/>
            </td>
            <td>Дата начала действия лицензии</td>
            <td>
                <xsl:call-template name="formatDate">
                    <xsl:with-param name="date" select="@ДатаНачЛиц"/>
                </xsl:call-template>
            </td>
        </tr>
        <xsl:if test="@ДатаОкончЛиц">
            <tr>
                <td class="text-center">
                    <xsl:value-of select="php:function('rowNum', .)"/>
                </td>
                <td>Дата окончания действия лицензии</td>
                <td>
                    <xsl:call-template name="formatDate">
                        <xsl:with-param name="date" select="@ДатаОкончЛиц"/>
                    </xsl:call-template>
                </td>
            </tr>
        </xsl:if>
        <xsl:for-each select="НаимЛицВидДеят">
            <tr>
                <td class="text-center">
                    <xsl:value-of select="php:function('rowNum', .)"/>
                </td>
                <td>Наименование лицензируемого вида деятельности, на который выдана лицензия</td>
                <td>
                    <xsl:value-of select="."/>
                </td>
            </tr>
        </xsl:for-each>
        <xsl:for-each select="МестоДейстЛиц">
            <tr>
                <td class="text-center">
                    <xsl:value-of select="php:function('rowNum', .)"/>
                </td>
                <td>Сведения об адресе места осуществления лицензируемого вида деятельности</td>
                <td>
                    <xsl:value-of select="."/>
                </td>
            </tr>
        </xsl:for-each>
        <xsl:if test="ЛицОргВыдЛиц">
            <tr>
                <td class="text-center">
                    <xsl:value-of select="php:function('rowNum', .)"/>
                </td>
                <td>Наименование лицензирующего органа, выдавшего или переоформившего лицензию</td>
                <td>
                    <xsl:value-of select="ЛицОргВыдЛиц"/>
                </td>
            </tr>
        </xsl:if>
        <xsl:apply-templates select="./ГРНДата"/>
        <xsl:if test="./ГРНДатаИспр">
            <xsl:apply-templates select="./ГРНДатаИспр"/>
        </xsl:if>
        <xsl:if test="СвПриостЛиц">
            <tr>
                <td class="text-center">
                    <xsl:value-of select="php:function('rowNum', .)"/>
                </td>
                <td>Дата приостановления действия лицензии</td>
                <td>
                    <xsl:call-template name="formatDate">
                        <xsl:with-param name="date" select="СвПриостЛиц/@ДатаПриостЛиц"/>
                    </xsl:call-template>
                </td>
            </tr>
            <tr>
                <td class="text-center">
                    <xsl:value-of select="php:function('rowNum', .)"/>
                </td>
                <td>Наименование лицензирующего органа, приостановившего действие лицензии</td>
                <td>
                    <xsl:value-of select="СвПриостЛиц/@ЛицОргПриостЛиц"/>
                </td>
            </tr>
            <xsl:apply-templates select="СвПриостЛиц/ГРНДата"/>
            <xsl:if test="СвПриостЛиц/ГРНДатаИспр">
                <xsl:apply-templates select="СвПриостЛиц/ГРНДатаИспр"/>
            </xsl:if>
        </xsl:if>
    </xsl:template>

    <xsl:template match="СвПодразд">
        <xsl:if test="СвФилиал">
            <tr>
                <td colspan="3" class="head">
                    <b>
                        <i>Филиалы</i>
                    </b>
                </td>
            </tr>
            <xsl:for-each select="СвФилиал">
                <tr>
                    <td colspan="3" class="num">
                        <b>
                            Филиал №<xsl:value-of select="position()"/>
                        </b>
                    </td>
                </tr>
                <xsl:if test="./ГРНДатаПерв">
                    <xsl:apply-templates select="./ГРНДатаПерв"/>
                </xsl:if>
                <xsl:if test="./СвНаим">
                    <xsl:apply-templates select="./СвНаим"/>
                    <tr>
                        <td colspan="3">
                            <br/>
                        </td>
                    </tr>
                </xsl:if>
                <xsl:if test="./АдрМНРФ">
                    <xsl:apply-templates select="./АдрМНРФ"/>
                </xsl:if>
                <xsl:if test="./АдрМНИн">
                    <xsl:apply-templates select="./АдрМНИн"/>
                </xsl:if>
                <xsl:if test="./СвУчетНОФилиал">
                    <xsl:apply-templates select="./СвУчетНОФилиал"/>
                </xsl:if>
            </xsl:for-each>
        </xsl:if>
        <xsl:if test="СвПредстав">
            <tr>
                <td colspan="3" class="head">
                    <b>
                        <i>Представительства</i>
                    </b>
                </td>
            </tr>
            <xsl:for-each select="СвПредстав">
                <tr>
                    <td colspan="3" class="num">
                        <b>
                            Представительство №<xsl:value-of select="position()"/>
                        </b>
                    </td>
                </tr>
                <xsl:if test="./ГРНДатаПерв">
                    <xsl:apply-templates select="./ГРНДатаПерв"/>
                </xsl:if>
                <xsl:if test="./СвНаим">
                    <xsl:apply-templates select="./СвНаим"/>
                    <tr>
                        <td colspan="3">
                            <br/>
                        </td>
                    </tr>
                </xsl:if>
                <xsl:if test="./АдрМНРФ">
                    <xsl:apply-templates select="./АдрМНРФ"/>
                </xsl:if>
                <xsl:if test="./АдрМНИн">
                    <xsl:apply-templates select="./АдрМНИн"/>
                </xsl:if>
                <xsl:if test="./СвУчетНОПредстав">
                    <xsl:apply-templates select="./СвУчетНОПредстав"/>
                </xsl:if>
            </xsl:for-each>
        </xsl:if>
    </xsl:template>

    <xsl:template match="СвРеорг">
        <tr>
            <td class="text-center">
                <xsl:value-of select="php:function('rowNum', .)"/>
            </td>
            <td>Форма реорганизации</td>
            <td>
                <xsl:value-of select="СвСтатус/@НаимСтатусЮЛ"/>
            </td>
        </tr>
        <xsl:apply-templates select="ГРНДата"/>
        <xsl:for-each select="ГРНДатаИзмСостРеоргЮЛ">
            <xsl:apply-templates select="."/>
        </xsl:for-each>
        <tr>
            <td colspan="3">
                <br/>
            </td>
        </tr>
        <xsl:for-each select="СвРеоргЮЛ">
            <tr>
                <td colspan="3" class="num">
                    <b>
                        Участник реорганизации №<xsl:value-of select="position()"/>
                    </b>
                </td>
            </tr>
            <tr>
                <td class="text-center">
                    <xsl:value-of select="php:function('rowNum', .)"/>
                </td>
                <td>ОГРН</td>
                <td>
                    <xsl:value-of select="./@ОГРН"/>
                </td>
            </tr>
            <tr>
                <td class="text-center">
                    <xsl:value-of select="php:function('rowNum', .)"/>
                </td>
                <td>ИНН</td>
                <td>
                    <xsl:value-of select="./@ИНН"/>
                </td>
            </tr>
            <tr>
                <td class="text-center">
                    <xsl:value-of select="php:function('rowNum', .)"/>
                </td>
                <td>Полное наименование юридического лица</td>
                <td>
                    <xsl:value-of select="./@НаимЮЛПолн"/>
                </td>
            </tr>
            <xsl:if test="./@СостЮЛпосле">
                <tr>
                    <td class="text-center">
                        <xsl:value-of select="php:function('rowNum', .)"/>
                    </td>
                    <td>Состояние юридического лица после завершения реорганизации</td>
                    <td>
                        <xsl:value-of select="./@СостЮЛпосле"/>
                    </td>
                </tr>
            </xsl:if>
            <xsl:if test="./ГРНДатаИспр">
                <xsl:apply-templates select="./ГРНДатаИспр"/>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="СвПредш|СвПреем">
        <xsl:if test="@ОГРН">
            <tr>
                <td class="text-center">
                    <xsl:value-of select="php:function('rowNum', .)"/>
                </td>
                <td>ОГРН</td>
                <td>
                    <xsl:value-of select="@ОГРН"/>
                </td>
            </tr>
        </xsl:if>
        <xsl:if test="@ИНН">
            <tr>
                <td class="text-center">
                    <xsl:value-of select="php:function('rowNum', .)"/>
                </td>
                <td>ИНН</td>
                <td>
                    <xsl:value-of select="@ИНН"/>
                </td>
            </tr>
        </xsl:if>
        <tr>
            <td class="text-center">
                <xsl:value-of select="php:function('rowNum', .)"/>
            </td>
            <td>Полное наименование юридического лица</td>
            <td>
                <xsl:value-of select="@НаимЮЛПолн"/>
            </td>
        </tr>
        <xsl:if test="СвЮЛсложнРеорг">
            <tr>
                <td class="text-center">
                    <xsl:value-of select="php:function('rowNum', .)"/>
                </td>
                <td>ОГРН</td>
                <td>
                    <xsl:value-of select="СвЮЛсложнРеорг/@ОГРН"/>
                </td>
            </tr>
            <xsl:if test="СвЮЛсложнРеорг/@ИНН">
                <tr>
                    <td class="text-center">
                        <xsl:value-of select="php:function('rowNum', .)"/>
                    </td>
                    <td>ИНН</td>
                    <td>
                        <xsl:value-of select="СвЮЛсложнРеорг/@ИНН"/>
                    </td>
                </tr>
            </xsl:if>
            <tr>
                <td>Полное наименование юридического лица</td>
                <td>
                    <xsl:value-of select="СвЮЛсложнРеорг/@НаимЮЛПолн"/>
                </td>
            </tr>
        </xsl:if>
        <xsl:apply-templates select="./ГРНДата"/>
        <xsl:if test="./ГРНДатаИспр">
            <xsl:apply-templates select="./ГРНДатаИспр"/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="СвКФХПредш|СвКФХПреем">
        <tr>
            <td class="text-center">
                <xsl:value-of select="php:function('rowNum', .)"/>
            </td>
            <td>ОГРНИП крестьянского (фермерского) хозяйства</td>
            <td>
                <xsl:value-of select="@ОГРНИП"/>
            </td>
        </tr>
        <xsl:apply-templates select="СвФЛ"/>
    </xsl:template>

    <xsl:template match="СвЗапЕГРЮЛ">
        <tr>
            <td class="text-center">
                <xsl:value-of select="php:function('rowNum', .)"/>
            </td>
            <td>ГРН и дата внесения записи в ЕГРЮЛ</td>
            <td>
                <xsl:if test="@ГРН">
                    <xsl:value-of select="@ГРН"/>
                    <br/>
                </xsl:if>
                <xsl:call-template name="formatDate">
                    <xsl:with-param name="date" select="@ДатаЗап"/>
                </xsl:call-template>
            </td>
        </tr>
        <tr>
            <td class="text-center">
                <xsl:value-of select="php:function('rowNum', .)"/>
            </td>
            <td>Причина внесения записи в ЕГРЮЛ</td>
            <td>
                <xsl:value-of select="ВидЗап/@НаимВидЗап"/>
            </td>
        </tr>
        <tr>
            <td class="text-center">
                <xsl:value-of select="php:function('rowNum', .)"/>
            </td>
            <td>Сведения о регистрирующем (налоговом) органе, внесшем запись в ЕГРЮЛ</td>
            <td>
                <xsl:value-of select="СвРегОрг/@НаимНО"/>
            </td>
        </tr>
        <xsl:if test="СведПредДок">
            <tr>
                <td colspan="3">
                    <br/>
                </td>
            </tr>
            <tr>
                <td colspan="3">Сведения о документах, представленных при внесении записи в ЕГРЮЛ</td>
            </tr>
            <xsl:for-each select="СведПредДок">
                <xsl:if test="position() != 1">
                    <tr>
                        <td colspan="3">
                            <br/>
                        </td>
                    </tr>
                </xsl:if>
                <tr>
                    <td class="text-center">
                        <xsl:value-of select="php:function('rowNum', .)"/>
                    </td>
                    <td>Наименование документа</td>
                    <td>
                        <xsl:value-of select="./НаимДок"/>
                    </td>
                </tr>
                <xsl:if test="./НомДок">
                    <tr>
                        <td class="text-center">
                            <xsl:value-of select="php:function('rowNum', .)"/>
                        </td>
                        <td>Номер документа</td>
                        <td>
                            <xsl:value-of select="./НомДок"/>
                        </td>
                    </tr>
                </xsl:if>
                <xsl:if test="./ДатаДок">
                    <tr>
                        <td class="text-center">
                            <xsl:value-of select="php:function('rowNum', .)"/>
                        </td>
                        <td>Дата документа</td>
                        <td>
                            <xsl:call-template name="formatDate">
                                <xsl:with-param name="date" select="./ДатаДок"/>
                            </xsl:call-template>
                        </td>
                    </tr>
                </xsl:if>
            </xsl:for-each>
        </xsl:if>
        <xsl:if test="СвСвид">
            <tr>
                <td colspan="3">
                    <br/>
                </td>
            </tr>
            <tr>
                <td colspan="3">Сведения о свидетельстве, подтверждающем факт внесения записи в ЕГРЮЛ</td>
            </tr>
            <xsl:for-each select="СвСвид">
                <xsl:if test="position() != 1">
                    <tr>
                        <td colspan="3">
                            <br/>
                        </td>
                    </tr>
                </xsl:if>
                <tr>
                    <td class="text-center">
                        <xsl:value-of select="php:function('rowNum', .)"/>
                    </td>
                    <td>Серия, номер и дата выдачи свидетельства</td>
                    <td>
                        <xsl:if test="./@Серия">
                            <xsl:value-of select="./@Серия"/>
                            <xsl:text> </xsl:text>
                        </xsl:if>
                        <xsl:if test="./@Номер">
                            <xsl:value-of select="./@Номер"/>
                        </xsl:if>
                        <br/>
                        <xsl:call-template name="formatDate">
                            <xsl:with-param name="date" select="./@ДатаВыдСвид"/>
                        </xsl:call-template>
                    </td>
                </tr>
            </xsl:for-each>
        </xsl:if>
        <xsl:if test="./ГРНДатаИспрПред">
            <tr>
                <td class="text-center">
                    <xsl:value-of select="php:function('rowNum', .)"/>
                </td>
                <td>ГРН и дата записи, в которую внесены исправления</td>
                <td>
                    <xsl:if test="./ГРНДатаИспрПред/@ГРН">
                        <xsl:value-of select="./ГРНДатаИспрПред/@ГРН"/>
                        <xsl:text> </xsl:text>
                    </xsl:if>
                    <xsl:call-template name="formatDate">
                        <xsl:with-param name="date" select="./@ДатаЗап"/>
                    </xsl:call-template>
                </td>
            </tr>
        </xsl:if>
        <xsl:if test="./ГРНДатаНедПред">
            <tr>
                <td class="text-center">
                    <xsl:value-of select="php:function('rowNum', .)"/>
                </td>
                <td>ГРН и дата записи, которая признана недействительной</td>
                <td>
                    <xsl:if test="./ГРНДатаНедПред/@ГРН">
                        <xsl:value-of select="./ГРНДатаНедПред/@ГРН"/>
                        <xsl:text> </xsl:text>
                    </xsl:if>
                    <xsl:call-template name="formatDate">
                        <xsl:with-param name="date" select="./@ДатаЗап"/>
                    </xsl:call-template>
                </td>
            </tr>
        </xsl:if>
        <xsl:if test="./СвСтатусЗап">
            <tr>
                <td colspan="3">Сведения о статусе записи</td>
            </tr>
            <xsl:if test="./СвСтатусЗап/ГРНДатаНед">
                <tr>
                    <td class="text-center">
                        <xsl:value-of select="php:function('rowNum', .)"/>
                    </td>
                    <td>Статус записи</td>
                    <td>Запись признана недействительной</td>
                </tr>
                <tr>
                    <td class="text-center">
                        <xsl:value-of select="php:function('rowNum', .)"/>
                    </td>
                    <td>ГРН и дата внесения записи, которой запись признана недействительной</td>
                    <td>
                        <xsl:if test="./СвСтатусЗап/ГРНДатаНед/@ГРН">
                            <xsl:value-of select="./СвСтатусЗап/ГРНДатаНед/@ГРН"/>
                            <xsl:text> </xsl:text>
                        </xsl:if>
                        <xsl:call-template name="formatDate">
                            <xsl:with-param name="date" select="./СвСтатусЗап/ГРНДатаНед/@ДатаЗап"/>
                        </xsl:call-template>
                    </td>
                </tr>
            </xsl:if>
            <xsl:for-each select="./СвСтатусЗап/ГРНДатаИспр">
                <tr>
                    <td colspan="3" class="num">
                        <b>
                            Статус №<xsl:value-of select="position()"/>
                        </b>
                    </td>
                </tr>
                <tr>
                    <td class="text-center">
                        <xsl:value-of select="php:function('rowNum', .)"/>
                    </td>
                    <td>Статус записи</td>
                    <td>В запись внесены исправления в связи с технической ошибкой, допущенной регистрирующим органом</td>
                </tr>
                <tr>
                    <td class="text-center">
                        <xsl:value-of select="php:function('rowNum', .)"/>
                    </td>
                    <td>ГРН и дата записи, которой внесены исправления в связи с технической ошибкой</td>
                    <td>
                        <xsl:if test="./@ГРН">
                            <xsl:value-of select="./@ГРН"/>
                            <xsl:text> </xsl:text>
                            <br/>
                        </xsl:if>
                        <xsl:call-template name="formatDate">
                            <xsl:with-param name="date" select="./@ДатаЗап"/>
                        </xsl:call-template>
                    </td>
                </tr>
            </xsl:for-each>
        </xsl:if>
    </xsl:template>

    <!-- Стандартные типы -->

    <xsl:template match="АдресРФ|СвАдрРФ|АдрМНРФ">
        <tr>
            <td class="text-center">
                <xsl:value-of select="php:function('rowNum', .)"/>
            </td>
            <td>Индекс</td>
            <td>
                <xsl:value-of select="@Индекс"/>
            </td>
        </tr>
        <xsl:if test="Регион">
            <tr>
                <td class="text-center">
                    <xsl:value-of select="php:function('rowNum', .)"/>
                </td>
                <td>Субъект Российской федерации</td>
                <td>
                    <xsl:value-of select="Регион/@ТипРегион"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="Регион/@НаимРегион"/>
                </td>
            </tr>
        </xsl:if>
        <xsl:if test="Район">
            <tr>
                <td class="text-center">
                    <xsl:value-of select="php:function('rowNum', .)"/>
                </td>
                <td>Район (улус и т.п.)</td>
                <td>
                    <xsl:value-of select="Район/@ТипРайон"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="Район/@НаимРайон"/>
                </td>
            </tr>
        </xsl:if>
        <xsl:if test="Город">
            <tr>
                <td class="text-center">
                    <xsl:value-of select="php:function('rowNum', .)"/>
                </td>
                <td>Город (волость и т.п.)</td>
                <td>
                    <xsl:value-of select="Город/@ТипГород"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="Город/@НаимГород"/>
                </td>
            </tr>
        </xsl:if>
        <xsl:if test="НаселПункт">
            <tr>
                <td class="text-center">
                    <xsl:value-of select="php:function('rowNum', .)"/>
                </td>
                <td>НаселПункт (село и т.п.)</td>
                <td>
                    <xsl:value-of select="НаселПункт/@ТипНаселПункт"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="НаселПункт/@НаимНаселПункт"/>
                </td>
            </tr>
        </xsl:if>
        <xsl:if test="Улица">
            <tr>
                <td class="text-center">
                    <xsl:value-of select="php:function('rowNum', .)"/>
                </td>
                <td> Улица (проспект, переулок т.д.)</td>
                <td>
                    <xsl:value-of select="Улица/@ТипУлица"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="Улица/@НаимУлица"/>
                </td>
            </tr>
        </xsl:if>
        <xsl:if test="@Дом">
            <tr>
                <td class="text-center">
                    <xsl:value-of select="php:function('rowNum', .)"/>
                </td>
                <td>Дом (владение т.п.)</td>
                <td>
                    <xsl:value-of select="@Дом"/>
                </td>
            </tr>
        </xsl:if>
        <xsl:if test="@Корпус">
            <tr>
                <td class="text-center">
                    <xsl:value-of select="php:function('rowNum', .)"/>
                </td>
                <td>Корпус (строение т.п.)</td>
                <td>
                    <xsl:value-of select="@Корпус"/>
                </td>
            </tr>
        </xsl:if>
        <xsl:if test="@Квартира">
            <tr>
                <td class="text-center">
                    <xsl:value-of select="php:function('rowNum', .)"/>
                </td>
                <td>Квартира (офис т.п.)</td>
                <td>
                    <xsl:value-of select="@Квартира"/>
                </td>
            </tr>
        </xsl:if>
        <xsl:apply-templates select="./ГРНДата"/>
        <xsl:if test="./ГРНДатаИспр">
            <xsl:apply-templates select="./ГРНДатаИспр"/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="СвРегИн">
        <tr>
            <td class="text-center">
                <xsl:value-of select="php:function('rowNum', .)"/>
            </td>
            <td>Наименование страны происхождения</td>
            <td>
                <xsl:value-of select="./@НаимСтран"/>
            </td>
        </tr>
        <xsl:if test="./@ДатаРег">
            <tr>
                <td class="text-center">
                    <xsl:value-of select="php:function('rowNum', .)"/>
                </td>
                <td>Дата регистрации</td>
                <td>
                    <xsl:call-template name="formatDate">
                        <xsl:with-param name="date" select="./@ДатаРег"/>
                    </xsl:call-template>
                </td>
            </tr>
        </xsl:if>
        <xsl:if test="./@РегНомер">
            <tr>
                <td class="text-center">
                    <xsl:value-of select="php:function('rowNum', .)"/>
                </td>
                <td>Регистрационный номер</td>
                <td>
                    <xsl:value-of select="./@РегНомер"/>
                </td>
            </tr>
        </xsl:if>
        <xsl:if test="./@НаимРегОрг">
            <tr>
                <td class="text-center">
                    <xsl:value-of select="php:function('rowNum', .)"/>
                </td>
                <td>Наименование регистрирующего органа</td>
                <td>
                    <xsl:value-of select="./@НаимРегОрг"/>
                </td>
            </tr>
        </xsl:if>
        <xsl:if test="./@АдрСтр">
            <tr>
                <td class="text-center">
                    <xsl:value-of select="php:function('rowNum', .)"/>
                </td>
                <td>Адрес в стране происхождения</td>
                <td>
                    <xsl:value-of select="./@АдрСтр"/>
                </td>
            </tr>
        </xsl:if>
        <xsl:apply-templates select="./ГРНДата"/>
        <xsl:if test="./ГРНДатаИспр">
            <xsl:apply-templates select="./ГРНДатаИспр"/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="НаимИННЮЛ|НаимИННДовУпр|УпрКомпПиф|ДержРеестрАО">
        <xsl:if test="@ОГРН">
            <tr>
                <td class="text-center">
                    <xsl:value-of select="php:function('rowNum', .)"/>
                </td>
                <td>ОГРН</td>
                <td>
                    <xsl:value-of select="@ОГРН"/>
                </td>
            </tr>
        </xsl:if>
        <xsl:if test="@ИНН">
            <tr>
                <td class="text-center">
                    <xsl:value-of select="php:function('rowNum', .)"/>
                </td>
                <td>ИНН</td>
                <td>
                    <xsl:value-of select="@ИНН"/>
                </td>
            </tr>
        </xsl:if>
        <tr>
            <td class="text-center">
                <xsl:value-of select="php:function('rowNum', .)"/>
            </td>
            <td>Полное наименование</td>
            <td>
                <xsl:value-of select="@НаимЮЛПолн"/>
            </td>
        </tr>
        <xsl:apply-templates select="./ГРНДата"/>
        <xsl:if test="./ГРНДатаИспр">
            <xsl:apply-templates select="./ГРНДатаИспр"/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="РешСуд|РешСудНедАдр|РешСудНедДанУпрОрг|РешСудНедДанДолжнФЛ">
        <tr>
            <td class="text-center">
                <xsl:value-of select="php:function('rowNum', .)"/>
            </td>
            <td>
                Сведения о решении суда, на основании которого запись признана недостоверной
                <br/>
                (Наименование суда, номер решения, дата принятия решения)
            </td>
            <td>
                <xsl:value-of select="РешСудНедАдр/@НаимСуда"/>
                <br/>
                <xsl:value-of select="РешСудНедАдр/@Номер"/>
                <br/>
                <xsl:call-template name="formatDate">
                    <xsl:with-param name="date" select="РешСудНедАдр/@Дата"/>
                </xsl:call-template>
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="СвНомТел">
        <tr>
            <td class="text-center">
                <xsl:value-of select="php:function('rowNum', .)"/>
            </td>
            <td>Сведения о контактном телефоне</td>
            <td>
                <xsl:value-of select="@НомТел"/>
            </td>
        </tr>
        <xsl:apply-templates select="./ГРНДата"/>
        <xsl:if test="./ГРНДатаИспр">
            <xsl:apply-templates select="./ГРНДатаИспр"/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="СвФЛ|УчрФЛ|СвНотариус">
        <xsl:if test="@Фамилия">
            <tr>
                <td class="text-center">
                    <xsl:value-of select="php:function('rowNum', .)"/>
                </td>
                <td>Фамилия</td>
                <td>
                    <xsl:value-of select="@Фамилия"/>
                </td>
            </tr>
        </xsl:if>
        <xsl:if test="@Имя">
            <tr>
                <td class="text-center">
                    <xsl:value-of select="php:function('rowNum', .)"/>
                </td>
                <td>Имя</td>
                <td>
                    <xsl:value-of select="@Имя"/>
                </td>
            </tr>
        </xsl:if>
        <xsl:if test="@Отчество">
            <tr>
                <td class="text-center">
                    <xsl:value-of select="php:function('rowNum', .)"/>
                </td>
                <td>Отчество</td>
                <td>
                    <xsl:value-of select="@Отчество"/>
                </td>
            </tr>
        </xsl:if>
        <xsl:if test="@ИННФЛ">
            <tr>
                <td class="text-center">
                    <xsl:value-of select="php:function('rowNum', .)"/>
                </td>
                <td>ИНН ФЛ</td>
                <td>
                    <xsl:value-of select="@ИННФЛ"/>
                </td>
            </tr>
        </xsl:if>
        <xsl:apply-templates select="./ГРНДата"/>
        <xsl:if test="./ГРНДатаИспр">
            <xsl:apply-templates select="./ГРНДатаИспр"/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="ГРНДата|ГРНДатаПерв|ГРНДатаИзмСостРеоргЮЛ">
        <tr>
            <td class="text-center">
                <xsl:value-of select="php:function('rowNum', .)"/>
            </td>
            <td>ГРН и дата внесения записи, содержащей указанные сведения</td>
            <td>
                <xsl:if test="@ГРН">
                    <xsl:value-of select="@ГРН"/>
                    <br/>
                </xsl:if>
                <xsl:call-template name="formatDate">
                    <xsl:with-param name="date" select="@ДатаЗаписи"/>
                </xsl:call-template>
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="ГРНДатаИспр">
        <tr>
            <td class="text-center">
                <xsl:value-of select="php:function('rowNum', .)"/>
            </td>
            <td>ГРН и дата внесения в ЕГРЮЛ записи об исправлении технической ошибки в указанных сведениях</td>
            <td>
                <xsl:if test="@ГРН">
                    <xsl:value-of select="@ГРН"/>
                    <br/>
                </xsl:if>
                <xsl:call-template name="formatDate">
                    <xsl:with-param name="date" select="@ДатаЗаписи"/>
                </xsl:call-template>
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="СвНедДанУчр">
        <tr>
            <td class="text-center">
                <xsl:value-of select="php:function('rowNum', .)"/>
            </td>
            <td>Информация о недостоверности сведений</td>
            <td>
                <xsl:value-of select="./@ТекстНедДанУчр"/>
            </td>
        </tr>
        <xsl:if test="./РешСудНедДанУчр">
            <xsl:apply-templates select="./РешСудНедДанУчр"/>
        </xsl:if>
        <xsl:apply-templates select="./ГРНДата"/>
        <xsl:if test="./ГРНДатаИспр">
            <xsl:apply-templates select="./ГРНДатаИспр"/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="ДоляУстКап|СвДоляООО">
        <tr>
            <td class="text-center">
                <xsl:value-of select="php:function('rowNum', .)"/>
            </td>
            <td>Номинальная стоимость доли в рублях</td>
            <td>
                <xsl:value-of select="@НоминСтоим"/>
            </td>
        </tr>
        <xsl:if test="РазмерДоли">
            <xsl:if test="РазмерДоли/Процент">
                <tr>
                    <td class="text-center">
                        <xsl:value-of select="php:function('rowNum', .)"/>
                    </td>
                    <td>Размер доли в процентах</td>
                    <td>
                        <xsl:value-of select="РазмерДоли/Процент"/>
                    </td>
                </tr>
            </xsl:if>
            <xsl:if test="РазмерДоли/ДробДесят">
                <tr>
                    <td class="text-center">
                        <xsl:value-of select="php:function('rowNum', .)"/>
                    </td>
                    <td>Размер доли в десятичных дробях</td>
                    <td>
                        <xsl:value-of select="РазмерДоли/ДробДесят"/>
                    </td>
                </tr>
            </xsl:if>
            <xsl:if test="РазмерДоли/ДробПрост">
                <tr>
                    <td class="text-center">
                        <xsl:value-of select="php:function('rowNum', .)"/>
                    </td>
                    <td>Размер доли в простых дробях</td>
                    <td>
                        <xsl:value-of select="РазмерДоли/ДробПрост/@Числит"/>/<xsl:value-of select="РазмерДоли/ДробПрост/@Знаменат"/>
                    </td>
                </tr>
            </xsl:if>
        </xsl:if>
        <xsl:apply-templates select="./ГРНДата"/>
        <xsl:if test="./ГРНДатаИспр">
            <xsl:apply-templates select="./ГРНДатаИспр"/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="СвОбрем">
        <tr>
            <td class="text-center">
                <xsl:value-of select="php:function('rowNum', .)"/>
            </td>
            <td>Вид обременения</td>
            <td>
                <xsl:value-of select="@ВидОбрем"/>
            </td>
        </tr>
        <xsl:if test="@СрокОбременения">
            <tr>
                <td class="text-center">
                    <xsl:value-of select="php:function('rowNum', .)"/>
                </td>
                <td>Срок обременения или порядок определения срока</td>
                <td>
                    <xsl:value-of select="@СрокОбременения"/>
                </td>
            </tr>
        </xsl:if>
        <xsl:if test="РешСуд">
            <xsl:apply-templates select="РешСуд"/>
        </xsl:if>
        <xsl:if test="СвЗалогДержФЛ">
            <tr>
                <td colspan="3">
                    <br/>
                </td>
            </tr>
            <tr>
                <td colspan="3">Сведения о залогодержателе ФЛ</td>
            </tr>
            <xsl:apply-templates select="СвЗалогДержФЛ"/>
            <tr>
                <td colspan="3">
                    <br/>
                </td>
            </tr>
        </xsl:if>
        <xsl:if test="СвЗалогДержЮЛ">
            <tr>
                <td colspan="3">
                    <br/>
                </td>
            </tr>
            <tr>
                <td colspan="3">Сведения о залогодержателе ЮЛ</td>
                <td></td>
            </tr>
            <xsl:apply-templates select="СвЗалогДержЮЛ"/>
            <tr>
                <td colspan="3">
                    <br/>
                </td>
            </tr>
        </xsl:if>
        <xsl:apply-templates select="./ГРНДата"/>
        <xsl:if test="./ГРНДатаИспр">
            <xsl:apply-templates select="./ГРНДатаИспр"/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="СвЗалогДержФЛ">
        <xsl:if test="ГРНДатаПерв">
            <xsl:apply-templates select="ГРНДатаПерв"/>
            <tr>
                <td colspan="3">
                    <br/>
                </td>
            </tr>
        </xsl:if>
        <xsl:apply-templates select="СвФЛ"/>
        <tr>
            <td colspan="3">
                <br/>
            </td>
        </tr>
        <xsl:if test="СвНотУдДогЗал">
            <xsl:apply-templates select="СвНотУдДогЗал"/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="СвЗалогДержЮЛ">
        <xsl:if test="ГРНДатаПерв">
            <xsl:apply-templates select="ГРНДатаПерв"/>
            <tr>
                <td colspan="3">
                    <br/>
                </td>
            </tr>
        </xsl:if>
        <xsl:apply-templates select="НаимИННЮЛ"/>
        <tr>
            <td colspan="3">
                <br/>
            </td>
        </tr>
        <xsl:if test="ГРНДатаПерв">
            <xsl:apply-templates select="СвРегИн"/>
        </xsl:if>
        <xsl:if test="СвНотУдДогЗал">
            <xsl:apply-templates select="СвНотУдДогЗал"/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="СвНотУдДогЗал">
        <tr>
            <td colspan="3">Сведения о нотариальном удостоверении договора залога</td>
        </tr>
        <tr>
            <td class="text-center">
                <xsl:value-of select="php:function('rowNum', .)"/>
            </td>
            <td>Номер договора залога</td>
            <td>
                <xsl:value-of select="@Номер"/>
            </td>
        </tr>
        <tr>
            <td class="text-center">
                <xsl:value-of select="php:function('rowNum', .)"/>
            </td>
            <td>Дата договора залога</td>
            <td>
                <xsl:call-template name="formatDate">
                    <xsl:with-param name="date" select="@Дата"/>
                </xsl:call-template>
            </td>
        </tr>
        <xsl:apply-templates select="СвНотариус"/>
    </xsl:template>

    <xsl:template match="СвОКВЭДОсн|СвОКВЭДДоп">
        <tr>
            <td class="text-center">
                <xsl:value-of select="php:function('rowNum', .)"/>
            </td>
            <td>Наименование вида деятельности по Общероссийскому классификатору видов экономической деятельности</td>
            <td>
                <xsl:value-of select="@КодОКВЭД"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="@НаимОКВЭД"/>
            </td>
        </tr>
        <xsl:apply-templates select="./ГРНДата"/>
        <xsl:if test="./ГРНДатаИспр">
            <xsl:apply-templates select="./ГРНДатаИспр"/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="СвНаимПодразд|СвНаим">
        <tr>
            <td class="text-center">
                <xsl:value-of select="php:function('rowNum', .)"/>
            </td>
            <td>Сведения о наименовании обособленного подразделения (филиала/представительства)</td>
            <td>
                <xsl:value-of select="@НаимПолн"/>
            </td>
        </tr>
        <xsl:apply-templates select="./ГРНДата"/>
        <xsl:if test="./ГРНДатаИспр">
            <xsl:apply-templates select="./ГРНДатаИспр"/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="АдрМНИн">
        <tr>
            <td class="text-center">
                <xsl:value-of select="php:function('rowNum', .)"/>
            </td>
            <td>Наименование страны</td>
            <td>
                <xsl:value-of select="@НаимСтран"/>
            </td>
        </tr>
        <xsl:if test="@АдрИн">
            <tr>
                <td class="text-center">
                    <xsl:value-of select="php:function('rowNum', .)"/>
                </td>
                <td>Адрес</td>
                <td>
                    <xsl:value-of select="@АдрИн"/>
                </td>
            </tr>
        </xsl:if>
        <xsl:apply-templates select="./ГРНДата"/>
        <xsl:if test="./ГРНДатаИспр">
            <xsl:apply-templates select="./ГРНДатаИспр"/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="СвУчетНОФилиал|СвУчетНОПредстав">
        <tr>
            <td class="text-center">
                <xsl:value-of select="php:function('rowNum', .)"/>
            </td>
            <td>КПП</td>
            <td>
                <xsl:value-of select="@КПП"/>
            </td>
        </tr>
        <tr>
            <td class="text-center">
                <xsl:value-of select="php:function('rowNum', .)"/>
            </td>
            <td>Дата постановки на учет в налоговом органе</td>
            <td>
                <xsl:call-template name="formatDate">
                    <xsl:with-param name="date" select="@ДатаПостУч"/>
                </xsl:call-template>
            </td>
        </tr>
        <xsl:apply-templates select="СвНО"/>
        <xsl:apply-templates select="./ГРНДата"/>
        <xsl:if test="./ГРНДатаИспр">
            <xsl:apply-templates select="./ГРНДатаИспр"/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="СвНО">
        <tr>
            <td class="text-center">
                <xsl:value-of select="php:function('rowNum', .)"/>
            </td>
            <td>Наименование налогового органа</td>
            <td>
                <xsl:value-of select="@НаимНО"/>
            </td>
        </tr>
    </xsl:template>

    <xsl:template name="formatDate">
        <xsl:param name="date"/>
        <xsl:variable name="day" select="substring($date, 1, 4)" />
        <xsl:variable name="month" select="substring($date, 6, 2)" />
        <xsl:variable name="year" select="substring($date, 9, 2)" />
        <xsl:value-of select="concat($year, '.', $month, '.', $day)"/>
    </xsl:template>

</xsl:stylesheet>