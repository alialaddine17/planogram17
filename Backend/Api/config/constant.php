<?php
$isLocal = 0;

if($isLocal == 1)
{
    return [
        'CATEGORIES_IMG'=>'http://10.81.234.31:5049/public/uploads/categories/',
        'PRODUCTIMG_PATH'=>'http://192.168.100.130:5049/public/uploads/product/',
        'LABEL_PATH'=>'http://192.168.100.130:5049/public/uploads/label/',
        'VIPIMG_PATH'=>'http://192.168.100.130:5049/public/uploads/vip/',
        'ANNOUNCEMENTIMG_PATH'=>'http://192.168.100.130:5049/public/uploads/anouncement/',
        'ANNOUNCEMENTPDF_PATH'=>'http://192.168.100.130:5049/public/uploads/anouncementPdf/',
        'VIP_SETTING_PATH'=>'http://192.168.100.161:1015/public/uploads/vip_setting/',
    ];
}
else
{
    return [
        'CATEGORIES_IMG'=>'http://redbull-pwa.php1.projectbeta.biz/uploads/categories/',
        'PRODUCTIMG_PATH'=>'http://redbull-pwa.php1.projectbeta.biz/uploads/product/',
        'LABEL_PATH'=>'http://redbull-pwa.php1.projectbeta.biz/uploads/label/',
        'VIPIMG_PATH'=>'http://redbull-pwa.php1.projectbeta.biz/uploads/vip/',
        'ANNOUNCEMENTIMG_PATH'=>'http://redbull-pwa.php1.projectbeta.biz/uploads/anouncement/',
        'ANNOUNCEMENTPDF_PATH'=>'http://redbull-pwa.php1.projectbeta.biz/uploads/anouncementPdf/',
        'VIP_SETTING_PATH'=>'http://redbull-pwa.php1.projectbeta.biz/uploads/vip_setting/',
    ];
}





