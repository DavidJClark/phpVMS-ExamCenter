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
    <br />
    <table>
        <tr>
            <td><img src="<?php echo SITE_URL; ?>/core/templates/exams/images/exam_logo.gif" alt="EXAMCenter &copy; simpilotgroup" /></td>
            <td colspan="2"><br /><h4>Exam's Available</h4></td>
        </tr>
        <?php
        if (isset($message)) {echo '<tr><td colspan="3" bgcolor="#cccccc">'.$message.'</td></tr>';}

        if (!$exams) {
            echo '<tr><td colspan="3"><div id="error">There are currently no active exams.</div></td></tr>';
        }
        else {
            $assign = ExamsData::get_setting_info('5');
            if ($assign->value == '1') {echo '<tr>
                        <td colspan="3">Currently the exam administrator must assign exams to pilots using the EXAMCenter.<br />
                        Use the request exam link to request an exam assignment.</td></tr>';
            } ?>
        <tr bgcolor="#cccccc">
            <td><b>Exam Description</b></td>
            <td><b>Exam Cost</b></td>
            <td>&nbsp;</td>
        </tr>
            <?php
            foreach ($exams as $data) {
                echo 	'<tr>
                    <td>'.$data->exam_description.'</td>
                    <td>$'.$data->cost.'</td>
                    <td>';
                if ($assign->value == '0') {echo '<a href="'.SITE_URL.'/index.php/Exams/buy_exam?id='.$data->id.'">Buy Exam</a>';}
                else {
                    $assigned = ExamsData::check_exam_assigned(Auth::$userinfo->pilotid, $data->id);
                    $total=ExamsData::check_for_request(Auth::$userinfo->pilotid, $data->id);
                    if ($assigned->total == '0') {
                        if ($total->total >= '1') { echo '<font color="#FF6600">Exam Request Pending</font>'; }
                        else { echo '<a href="'.SITE_URL.'/index.php/Exams/request_exam?id='.$data->id.'"><font color="#FF0000">Request Exam</font></a>';}
                    }
                    else {echo '<a href="'.SITE_URL.'/index.php/Exams/buy_exam?id='.$data->id.'"><font color="#006600">Exam Available</font></a>';}
                }
                echo '</td>
		<tr>';
            }
            ?>
    </table>
    <br />
    You have <b>v$<?php echo Auth::$userinfo->totalpay; ?></b> in your company account to use towards EXAMCenter purchases.<br />
    <?php
    }
    ?>
    <form method="link" action="<?php echo SITE_URL ?>/index.php/Exams/view_profile">
        <input type="submit" value="View My Exam History"></form>
</center>