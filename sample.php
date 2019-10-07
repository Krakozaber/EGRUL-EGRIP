<?php

$xmlText = './test.xml';
$xsltPath = './xslt/egrul.xslt';

$xsl = new SimpleXMLElement($xsltPath, LIBXML_COMPACT | LIBXML_PARSEHUGE, true);
$xml = new SimpleXMLElement($xmlText, LIBXML_COMPACT | LIBXML_PARSEHUGE, true);

$proc = new \XSLTProcessor();
$proc->registerPHPFunctions();
$proc->importStyleSheet($xsl);

echo $proc->transformToXML($xml);

unset($proc);
unset($xml);
unset($xsl);

function rowNum($a)
{
    static $rowNum = 0;
    return ++$rowNum;
}
