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
<tr>
    <td width="10%">
        <?php if ($div=='error') { echo '<img src="'.SITE_URL.'/examimages/failed.png" />'; }
        else { echo '<img src="'.SITE_URL.'/examimages/passed.png" />'; }
        ?>
    </td>
    <td>
        <div id="<?php echo $div; ?>">
            <br />
            <h5><?php echo 'Question #'.$number.'<br />'.$question; ?><br /><br /></h5>
                <?php if (isset($wrong)) {echo 'Your Answer: <b>'.$wrong.'</b><br />'; } unset($GLOBALS['wrong']); ?>
		Correct Answer: <b><?php echo $answer; ?></b><br /><br />
        </div>
    </td>
</tr>