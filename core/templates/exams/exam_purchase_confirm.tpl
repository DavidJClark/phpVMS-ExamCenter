<?php
//simpilotgroup addon module for phpVMS virtual airline system
//
//simpilotgroup addon modules are licenced under the following license:
//Creative Commons Attribution Non-commercial Share Alike (by-nc-sa)
//To view full icense text visit http://creativecommons.org/licenses/by-nc-sa/3.0/
//
//@author David Clark (simpilot)
//@copyright Copyright (c) 2009-2010, David Clark
//@license http://creativecommons.org/licenses/by-nc-sa/3.0/
?>
<center>
    <div id="error">
		You currently have <b>$<?php echo $pilotmoney ?></b> in your account.<br />
		Purchasing the <b><?php echo $examdescription ?></b> exam will deduct <b>$<?php echo $examcost ?></b> from your account.<br />
		If you do not pass the test you will have to re-purchase the exam again.<br />
		Continue - <a href="<?php echo SITE_URL ?>/index.php/Exams"><b>NO</b></a> | <a href="<?php echo SITE_URL ?>/index.php/Exams/purchase_exam?id=<?php echo $examid ?>"><b>YES</b></a>
    </div>
    exam_purchase_confirm.tpl
</center>