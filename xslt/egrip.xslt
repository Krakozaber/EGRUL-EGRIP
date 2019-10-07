<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/EGRIP/СвИП">
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
                    .num, .head {
                    text-align: center;
                    }
                    .doc table {
                    width:100%;
                    border-collapse:collapse;
                    }
                    .doc table td,th{
                    border:1px solid black;
                    }
                    table th:nth-child(1) {
                    width:50%;
                    }
                </style>
            </head>
            <body>
                <div class="doc">
                    <div class="docHeader">
                        <h4>ЕДИНЫЙ ГОСУДАРСТВЕННЫЙ РЕЕСТР ИНДИВИДУАЛЬНЫХ ПРЕДПРИНИМАТЕЛЕЙ</h4>
                        <h4>Сведения об индивидуальном предпринимателе:</h4>
                        <h4>
                            <xsl:value-of select="СвФЛ/ФИОРус/@Фамилия"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="СвФЛ/ФИОРус/@Имя"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="СвФЛ/ФИОРус/@Отчество"/>
                        </h4>
                    </div>
                    ОРГН: <xsl:value-of select="@ОГРНИП"/>
                    <br/>
                    ИНН: <xsl:value-of select="@ИННФЛ"/>
                    <br/>
                    по состоянию на:
                    <xsl:call-template name="formatDate">
                        <xsl:with-param name="date" select="@ДатаВып"/>
                    </xsl:call-template>
                    <br/>
                    <br/>
                    <table>
                        <tr>
                            <th>Наименование показателя</th>
                            <th>Значение показателя</th>
                        </tr>
                        <tr>
                            <td colspan="2" class="head">
                                <b>Фамилия, имя, отчество (при наличии) индивидуального предпринимателя</b>
                            </td>
                        </tr>
                        <xsl:apply-templates select="СвФЛ"/>
                        <xsl:if test="СвГражд">
                            <tr>
                                <td colspan="2" class="head">
                                    <b>Сведения о гражданстве</b>
                                </td>
                            </tr>
                            <xsl:apply-templates select="СвГражд"/>
                        </xsl:if>

                        <xsl:if test="СвАдрМЖ">
                            <tr>
                                <td colspan="2" class="head">
                                    <b>Сведения об адресе (месте жительства)</b>
                                </td>
                            </tr>
                            <xsl:apply-templates select="СвАдрМЖ"/>
                        </xsl:if>

                        <xsl:if test="СвАдрЭлПочты">
                            <tr>
                                <td colspan="2" class="head">
                                    <b>Сведения об адресе электронной почты юридического лица</b>
                                </td>
                            </tr>
                            <xsl:apply-templates select="СвАдрЭлПочты"/>
                        </xsl:if>
                        <tr>
                            <td colspan="2" class="head">
                                <b>Сведения о регистрации ИП</b>
                            </td>
                        </tr>
                        <xsl:apply-templates select="СвРегИП"/>
                        <tr>
                            <td colspan="2" class="head">
                                <b>Сведения о регистрирующем органе по месту нахождения ИП</b>
                            </td>
                        </tr>
                        <xsl:apply-templates select="СвРегОрг"/>
                        <xsl:if test="СвСтатус">
                            <tr>
                                <td colspan="2" class="head">
                                    <b>Сведения о правоспособности (статусе)</b>
                                </td>
                            </tr>
                            <xsl:apply-templates select="СвСтатус"/>
                        </xsl:if>
                        <xsl:if test="СвПрекращ">
                            <tr>
                                <td colspan="2" class="head">
                                    <b>Сведения о прекращении деятельности в качестве ИП или КФХ</b>
                                </td>
                            </tr>
                            <xsl:apply-templates select="СвПрекращ"/>
                        </xsl:if>
                        <xsl:if test="СвУчетНО">
                            <tr>
                                <td colspan="2" class="head">
                                    <b>Сведения об учёте в налоговом органе</b>
                                </td>
                            </tr>
                            <xsl:apply-templates select="СвУчетНО"/>
                        </xsl:if>
                        <xsl:if test="СвРегПФ">
                            <tr>
                                <td colspan="2" class="head">
                                    <b>Сведения о регистрации в качестве страхователя в территориальном органе ПФ РФ</b>
                                </td>
                            </tr>
                            <xsl:apply-templates select="СвРегПФ"/>
                        </xsl:if>
                        <xsl:if test="СвРегФСС">
                            <tr>
                                <td colspan="2" class="head">
                                    <b>Сведения о регистрации в качестве страхователя в исполнительном органе Фонда социального страхования РФ</b>
                                </td>
                            </tr>
                            <xsl:apply-templates select="СвРегФСС"/>
                        </xsl:if>
                        <xsl:if test="СвОКВЭД">
                            <tr>
                                <td colspan="2" class="head">
                                    <b>Сведения о видах экономической деятельности по Общероссийскому классификатору видов экономической деятельности</b>
                                </td>
                            </tr>
                            <xsl:apply-templates select="СвОКВЭД"/>
                        </xsl:if>
                        <xsl:if test="СвЛицензия">
                            <tr>
                                <td colspan="2" class="head">
                                    <b>Сведения о лицензиях, выданных ИП</b>
                                </td>
                            </tr>
                            <xsl:for-each select="СвЛицензия">
                                <tr>
                                    <td colspan="2" class="num">
                                        <b>
                                            <xsl:value-of select="position()"/>
                                        </b>
                                    </td>
                                </tr>
                                <xsl:apply-templates select="."/>
                            </xsl:for-each>
                        </xsl:if>
                        <tr>
                            <td colspan="2" class="head">
                                <b>Сведения о записях, внесенных в ЕГРИП</b>
                            </td>
                        </tr>
                        <xsl:for-each select="СвЗапЕГРИП">
                            <tr>
                                <td colspan="2" class="num">
                                    <b>
                                        <xsl:value-of select="position()"/>
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

    <!-- Базовые значения ЕГРИП -->

    <xsl:template match="СвФЛ">
        <xsl:apply-templates select="ФИОРус"/>
        <xsl:if test="ФИОЛат">
            <xsl:apply-templates select="ФИОЛат"/>
        </xsl:if>
        <tr>
            <td>Пол</td>
            <td>
                <xsl:if test="@Пол = 1">
                    мужской
                </xsl:if>
                <xsl:if test="@Пол = 2">
                    женский
                </xsl:if>
            </td>
        </tr>
        <xsl:choose>
            <xsl:when test="ГРНИПДатаИспр">
                <xsl:apply-templates select="ГРНИПДатаИспр"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="ГРНИПДата"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="СвГражд">
        <tr>
            <td>Гражданство</td>
            <td>
                <xsl:if test="@ВидГражд = 1">
                    гражданин Российской Федерации
                </xsl:if>
                <xsl:if test="@ВидГражд = 2">
                    иностранный гражданин
                </xsl:if>
                <xsl:if test="@ВидГражд = 3">
                    лицо без гражданства
                </xsl:if>
            </td>
        </tr>
        <xsl:if test="@НаимСтран">
            <tr>
                <td>Наименование страны, гражданином которой является ФЛ</td>
                <td>
                    <xsl:value-of select="@НаимСтран"/>
                </td>
            </tr>
        </xsl:if>
        <xsl:choose>
            <xsl:when test="ГРНИПДатаИспр">
                <xsl:apply-templates select="ГРНИПДатаИспр"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="ГРНИПДата"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="СвАдрЭлПочты">
        <tr>
            <td>E-mail:</td>
            <td>
                <xsl:value-of select="@E-mail"/>
            </td>
        </tr>
        <xsl:choose>
            <xsl:when test="ГРНИПДатаИспр">
                <xsl:apply-templates select="ГРНИПДатаИспр"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="ГРНИПДата"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="СвАдрМЖ">
        <tr>
            <td>Субъект Российской Федерации</td>
            <td>
                <xsl:value-of select="АдресРФ/Регион/@ТипРегион"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="АдресРФ/Регион/@НаимРегион"/>
            </td>
        </tr>
        <xsl:if test="АдресРФ/Район">
            <tr>
                <td>Район (улус и т.п.)</td>
                <td>
                    <xsl:value-of select="АдресРФ/Район/@ТипРайон"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="АдресРФ/Район/@НаимРайон"/>
                </td>
            </tr>
        </xsl:if>
        <xsl:if test="АдресРФ/Город">
            <tr>
                <td>Город (волость и т.п.)</td>
                <td>
                    <xsl:value-of select="АдресРФ/Город/@ТипГород"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="АдресРФ/Город/@НаимГород"/>
                </td>
            </tr>
        </xsl:if>
        <xsl:if test="АдресРФ/НаселПункт">
            <tr>
                <td>НаселПункт (село и т.п.)</td>
                <td>
                    <xsl:value-of select="АдресРФ/НаселПункт/@ТипНаселПункт"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="АдресРФ/НаселПункт/@НаимНаселПункт"/>
                </td>
            </tr>
        </xsl:if>
        <xsl:choose>
            <xsl:when test="ГРНИПДатаИспр">
                <xsl:apply-templates select="ГРНИПДатаИспр"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="ГРНИПДата"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="СвРегИП">
        <tr>
            <td>ОГРНИП</td>
            <td>
                <xsl:value-of select="@ОГРНИП"/>
            </td>
        </tr>
        <tr>
            <td>Дата регистрации</td>
            <td>
                <xsl:call-template name="formatDate">
                    <xsl:with-param name="date" select="@ДатаОГРНИП"/>
                </xsl:call-template>
            </td>
        </tr>
        <xsl:if test="@РегНом">
            <tr>
                <td>Регистрационный номер, присвоенный до 1 января 2004 г.</td>
                <td>
                    <xsl:value-of select="@РегНом"/>
                </td>
            </tr>
        </xsl:if>
        <xsl:if test="@ДатаРег">
            <tr>
                <td>Дата регистрации до 1 января 2004 г.</td>
                <td>
                    <xsl:call-template name="formatDate">
                        <xsl:with-param name="date" select="@ДатаРег"/>
                    </xsl:call-template>
                </td>
            </tr>
        </xsl:if>
        <xsl:if test="@НаимРО">
            <tr>
                <td>Наименование органа, зарегистрировавшего ИП или КФХ до 1 января 2004 г.</td>
                <td>
                    <xsl:value-of select="@НаимРО"/>
                </td>
            </tr>
        </xsl:if>
        <xsl:if test="СвКФХ">
            <tr>
                <td>ОГРН</td>
                <td>
                    <xsl:value-of select="СвКФХ/@ОГРН"/>
                </td>
            </tr>
            <xsl:if test="СвКФХ/@ИНН">
                <tr>
                    <td>ИНН</td>
                    <td>
                        <xsl:value-of select="СвКФХ/@ИНН"/>
                    </td>
                </tr>
            </xsl:if>
            <tr>
                <td>Полное наименование юридического лица</td>
                <td>
                    <xsl:value-of select="СвКФХ/@НаимЮЛПолн"/>
                </td>
            </tr>
            <xsl:apply-templates select="СвКФХ/ГРНИПДата"/>
            <xsl:if test="СвКФХ/ГРНИПДатаИспр">
                <xsl:apply-templates select="СвКФХ/ГРНИПДатаИспр"/>
            </xsl:if>
        </xsl:if>


    </xsl:template>

    <xsl:template match="СвРегОрг">
        <tr>
            <td>Наименование регистрирующего органа</td>
            <td>
                <xsl:value-of select="@НаимНО"/>
            </td>
        </tr>
        <tr>
            <td>Адрес регистрирующего органа</td>
            <td>
                <xsl:value-of select="@АдрРО"/>
            </td>
        </tr>
        <xsl:apply-templates select="ГРНИПДата"/>
    </xsl:template>

    <xsl:template match="СвСтатус">
        <tr>
            <td>Наименование статуса</td>
            <td>
                <xsl:value-of select="СвСтатус/@НаимСтатус"/>
            </td>
        </tr>
        <xsl:apply-templates select="ГРНИПДата"/>
    </xsl:template>

    <xsl:template match="СвПрекращ">
        <tr>
            <td>Способ прекращения</td>
            <td>
                <xsl:value-of select="СвСтатус/@НаимСтатус"/>
            </td>
        </tr>
        <xsl:apply-templates select="ГРНИПДата"/>
        <xsl:if test="СвНовЮЛ">
            <tr>
                <td colspan="2"></td>
            </tr>
            <tr>
                <td colspan="2">Сведения о юридическом лице, созданном на базе ИП или КФХ</td>
            </tr>
            <tr>
                <td>ОГРН</td>
                <td>
                    <xsl:value-of select="СвНовЮЛ/@ОГРН"/>
                </td>
            </tr>
            <xsl:if test="СвНовЮЛ/@ИНН">
                <tr>
                    <td>ИНН</td>
                    <td>
                        <xsl:value-of select="СвНовЮЛ/@ИНН"/>
                    </td>
                </tr>
            </xsl:if>
            <tr>
                <td>Полное наименование юридического лица</td>
                <td>
                    <xsl:value-of select="СвНовЮЛ/@НаимЮЛПолн"/>
                </td>
            </tr>
            <xsl:apply-templates select="СвНовЮЛ/ГРНИПДата"/>
            <xsl:if test="СвНовЮЛ/ГРНИПДатаИспр">
                <xsl:apply-templates select="СвНовЮЛ/ГРНИПДатаИспр"/>
            </xsl:if>
        </xsl:if>
    </xsl:template>

    <xsl:template match="СвУчетНО">
        <tr>
            <td>ИНН</td>
            <td>
                <xsl:value-of select="@ИННФЛ"/>
            </td>
        </tr>
        <tr>
            <td>Дата постановки на учёт</td>
            <td>
                <xsl:call-template name="formatDate">
                    <xsl:with-param name="date" select="@ДатаПостУч"/>
                </xsl:call-template>
            </td>
        </tr>
        <xsl:apply-templates select="СвНО"/>
        <xsl:choose>
            <xsl:when test="ГРНИПДатаИспр">
                <xsl:apply-templates select="ГРНИПДатаИспр"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="ГРНИПДата"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="СвРегПФ">
        <tr>
            <td>Регистрационный номер</td>
            <td>
                <xsl:value-of select="@РегНомПФ"/>
            </td>
        </tr>
        <tr>
            <td>Дата регистрации</td>
            <td>
                <xsl:call-template name="formatDate">
                    <xsl:with-param name="date" select="@ДатаРег"/>
                </xsl:call-template>
            </td>
        </tr>
        <tr>
            <td>Наименование территориального органа ПФ</td>
            <td>
                <xsl:value-of select="СвОргПФ/@НаимПФ"/>
            </td>
        </tr>
        <xsl:choose>
            <xsl:when test="ГРНИПДатаИспр">
                <xsl:apply-templates select="ГРНИПДатаИспр"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="ГРНИПДата"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="СвРегФСС">
        <tr>
            <td>Регистрационный номер</td>
            <td>
                <xsl:value-of select="@РегНомФСС"/>
            </td>
        </tr>
        <tr>
            <td>Дата регистрации</td>
            <td>
                <xsl:call-template name="formatDate">
                    <xsl:with-param name="date" select="@ДатаРег"/>
                </xsl:call-template>
            </td>
        </tr>
        <tr>
            <td>Наименование исполнительного органа Фонда социального страхования</td>
            <td>
                <xsl:value-of select="СвОргФСС/@НаимФСС"/>
            </td>
        </tr>
        <xsl:choose>
            <xsl:when test="ГРНИПДатаИспр">
                <xsl:apply-templates select="ГРНИПДатаИспр"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="ГРНИПДата"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="СвОКВЭД">
        <xsl:if test="СвОКВЭДОсн">
            <tr>
                <td colspan="2" class="head">
                    <b>
                        <i>Сведения об основном виде деятельности</i>
                    </b>
                </td>
            </tr>
            <xsl:apply-templates select="СвОКВЭДОсн"/>
        </xsl:if>
        <xsl:if test="СвОКВЭДДоп">
            <tr>
                <td colspan="2" class="head">
                    <b>
                        <i>Сведения о дополнительных видах деятельности</i>
                    </b>
                </td>
            </tr>
            <xsl:for-each select="СвОКВЭДДоп">
                <tr>
                    <td colspan="2" class="num">
                        <b>
                            <xsl:value-of select="position()"/>
                        </b>
                    </td>
                </tr>
                <xsl:apply-templates select="."/>
            </xsl:for-each>
        </xsl:if>
    </xsl:template>

    <xsl:template match="СвЛицензия">
        <tr>
            <td>Серия и номер лицензии</td>
            <td>
                <xsl:value-of select="@НомЛиц"/>
            </td>
        </tr>
        <tr>
            <td>Дата лицензии</td>
            <td>
                <xsl:call-template name="formatDate">
                    <xsl:with-param name="date" select="@ДатаЛиц"/>
                </xsl:call-template>
            </td>
        </tr>
        <tr>
            <td>Дата начала действия лицензии</td>
            <td>
                <xsl:call-template name="formatDate">
                    <xsl:with-param name="date" select="@ДатаНачЛиц"/>
                </xsl:call-template>
            </td>
        </tr>
        <xsl:if test="@ДатаОкончЛиц">
            <tr>
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
                <td>Наименование лицензируемого вида деятельности, на который выдана лицензия</td>
                <td>
                    <xsl:value-of select="."/>
                </td>
            </tr>
        </xsl:for-each>
        <xsl:for-each select="МестоДейстЛиц">
            <tr>
                <td>Сведения об адресе места осуществления лицензируемого вида деятельности</td>
                <td>
                    <xsl:value-of select="."/>
                </td>
            </tr>
        </xsl:for-each>
        <xsl:if test="ЛицОргВыдЛиц">
            <tr>
                <td>Наименование лицензирующего органа, выдавшего или переоформившего лицензию</td>
                <td>
                    <xsl:value-of select="ЛицОргВыдЛиц"/>
                </td>
            </tr>
        </xsl:if>
        <xsl:choose>
            <xsl:when test="ГРНИПДатаИспр">
                <xsl:apply-templates select="ГРНИПДатаИспр"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="ГРНИПДата"/>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:if test="СвПриостЛиц">
            <tr>
                <td>Дата приостановления действия лицензии</td>
                <td>
                    <xsl:call-template name="formatDate">
                        <xsl:with-param name="date" select="СвПриостЛиц/@ДатаПриостЛиц"/>
                    </xsl:call-template>
                </td>
            </tr>
            <tr>
                <td>Наименование лицензирующего органа, приостановившего действие лицензии</td>
                <td>
                    <xsl:value-of select="СвПриостЛиц/@ЛицОргПриостЛиц"/>
                </td>
            </tr>
            <xsl:apply-templates select="СвПриостЛиц/ГРНИПДата"/>
            <xsl:if test="СвПриостЛиц/ГРНИПДатаИспр">
                <xsl:apply-templates select="СвПриостЛиц/ГРНИПДатаИспр"/>
            </xsl:if>
        </xsl:if>
    </xsl:template>

    <xsl:template match="ГРНИПДата|ГРНИПДатаИспр|ГРНИПДатаПерв">
        <tr>
            <td>ГРН и дата внесения записи, содержащей указанные сведения</td>
            <td>
                <xsl:if test="@ГРНИП">
                    <xsl:value-of select="@ГРНИП"/>
                    <br/>
                </xsl:if>
                <xsl:call-template name="formatDate">
                    <xsl:with-param name="date" select="@ДатаЗаписи"/>
                </xsl:call-template>
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="СвЗапЕГРИП">
        <tr>
            <td>ГРН и дата внесения записи в ЕГРИП</td>
            <td>
                <xsl:if test="@ГРНИП">
                    <xsl:value-of select="@ГРНИП"/>
                    <br/>
                </xsl:if>
                <xsl:call-template name="formatDate">
                    <xsl:with-param name="date" select="@ДатаЗап"/>
                </xsl:call-template>
            </td>
        </tr>
        <tr>
            <td>Причина внесения записи в ЕГРИП</td>
            <td>
                <xsl:value-of select="ВидЗап/@НаимВидЗап"/>
            </td>
        </tr>
        <tr>
            <td>Сведения о регистрирующем (налоговом) органе, внесшем запись в ЕГРИП</td>
            <td>
                <xsl:value-of select="СвРегОрг/@НаимНО"/>
            </td>
        </tr>
        <xsl:if test="СведПредДок">
            <tr>
                <td colspan="2">
                    <br/>
                </td>
            </tr>
            <tr>
                <td colspan="2">Сведения о документах, представленных при внесении записи в ЕГРИП</td>
            </tr>
            <xsl:for-each select="СведПредДок">
                <xsl:if test="position() != 1">
                    <tr>
                        <td colspan="2">
                            <br/>
                        </td>
                    </tr>
                </xsl:if>
                <tr>
                    <td>Наименование документа</td>
                    <td>
                        <xsl:value-of select="./НаимДок"/>
                    </td>
                </tr>
                <xsl:if test="./НомДок">
                    <tr>
                        <td>Номер документа</td>
                        <td>
                            <xsl:value-of select="./НомДок"/>
                        </td>
                    </tr>
                </xsl:if>
                <xsl:if test="./ДатаДок">
                    <tr>
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
                <td colspan="2">
                    <br/>
                </td>
            </tr>
            <tr>
                <td colspan="2">Сведения о свидетельстве, подтверждающем факт внесения записи в ЕГРИП</td>
            </tr>
            <xsl:for-each select="СвСвид">
                <xsl:if test="position() != 1">
                    <tr>
                        <td colspan="2">
                            <br/>
                        </td>
                    </tr>
                </xsl:if>
                <tr>
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
        <xsl:if test="./ГРНИПДатаИспрПред">
            <tr>
                <td>ГРН и дата записи, в которую внесены исправления</td>
                <td>
                    <xsl:if test="./ГРНИПДатаИспрПред/@ГРНИП">
                        <xsl:value-of select="./ГРНИПДатаИспрПред/@ГРНИП"/>
                        <xsl:text> </xsl:text>
                    </xsl:if>
                    <xsl:call-template name="formatDate">
                        <xsl:with-param name="date" select="./@ДатаЗап"/>
                    </xsl:call-template>
                </td>
            </tr>
        </xsl:if>
        <xsl:if test="./ГРНИПДатаНедПред">
            <tr>
                <td>ГРН и дата записи, которая признана недействительной</td>
                <td>
                    <xsl:if test="./ГРНИПДатаНедПред/@ГРНИП">
                        <xsl:value-of select="./ГРНИПДатаНедПред/@ГРНИП"/>
                        <xsl:text> </xsl:text>
                    </xsl:if>
                    <xsl:call-template name="formatDate">
                        <xsl:with-param name="date" select="./@ДатаЗап"/>
                    </xsl:call-template>
                </td>
            </tr>
        </xsl:if>
        <xsl:if test="./СвСтатусЗап">
            <xsl:if test="./СвСтатусЗап/ГРНИПДатаНед">
                <tr>
                    <td>ГРН и дата внесения записи, которой запись признана недействительной</td>
                    <td>
                        <xsl:if test="./СвСтатусЗап/ГРНИПДатаНед/@ГРНИП">
                            <xsl:value-of select="./СвСтатусЗап/ГРНИПДатаНед/@ГРНИП"/>
                            <xsl:text> </xsl:text>
                        </xsl:if>
                        <xsl:call-template name="formatDate">
                            <xsl:with-param name="date" select="./СвСтатусЗап/ГРНИПДатаНед/@ДатаЗап"/>
                        </xsl:call-template>
                    </td>
                </tr>
            </xsl:if>
            <xsl:for-each select="./СвСтатусЗап/ГРНИПДатаИспр">
                <tr>
                    <td>ГРН и дата записи, которой внесены исправления в связи с технической ошибкой</td>
                    <td>
                        <xsl:if test="./@ГРНИП">
                            <xsl:value-of select="./@ГРНИП"/>
                            <xsl:text> </xsl:text>
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

    <xsl:template match="ФИОРус">
        <xsl:if test="@Фамилия">
            <tr>
                <td>Фамилия</td>
                <td>
                    <xsl:value-of select="@Фамилия"/>
                </td>
            </tr>
        </xsl:if>
        <xsl:if test="@Имя">
            <tr>
                <td>Имя</td>
                <td>
                    <xsl:value-of select="@Имя"/>
                </td>
            </tr>
        </xsl:if>
        <xsl:if test="@Отчество">
            <tr>
                <td>Отчество</td>
                <td>
                    <xsl:value-of select="@Отчество"/>
                </td>
            </tr>
        </xsl:if>
    </xsl:template>

    <xsl:template match="ФИОЛат">
        <xsl:if test="@Фамилия">
            <tr>
                <td>Фамилия (лат.)</td>
                <td>
                    <xsl:value-of select="@Фамилия"/>
                </td>
            </tr>
        </xsl:if>
        <xsl:if test="@Имя">
            <tr>
                <td>Имя (лат.)</td>
                <td>
                    <xsl:value-of select="@Имя"/>
                </td>
            </tr>
        </xsl:if>
        <xsl:if test="@Отчество">
            <tr>
                <td>Отчество (лат.)</td>
                <td>
                    <xsl:value-of select="@Отчество"/>
                </td>
            </tr>
        </xsl:if>
    </xsl:template>

    <xsl:template match="СвОКВЭДОсн|СвОКВЭДДоп">
        <tr>
            <td>Наименование вида деятельности по Общероссийскому классификатору видов экономической деятельности</td>
            <td>
                <xsl:value-of select="@КодОКВЭД"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="@НаимОКВЭД"/>
            </td>
        </tr>
        <xsl:choose>
            <xsl:when test="ГРНИПДатаИспр">
                <xsl:apply-templates select="ГРНИПДатаИспр"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="ГРНИПДата"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="СвНО">
        <tr>
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