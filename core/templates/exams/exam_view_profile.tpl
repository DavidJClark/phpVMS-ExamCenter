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

if (isset($message)) {echo '<br />'; echo $message;}
?>
<center><?php //print_r($data); ?>
    <h2>Exam History For: <?php echo Auth::$userinfo->firstname.' '.Auth::$userinfo->lastname.''; ?></h2>
    <table width="80%" border="1px">
        <tr>
            <td colspan="5"><img src="<?php echo SITE_URL ?>/examimages/exam_logo.gif" alt="EXAMCenter &copy; simpilotgroup" /></td>
        </tr>
        <tr bgcolor="#cccccc">
            <td colspan="3">Exam History</td>
            <td colspan="2">
                <table>
                    <tr>
                        <td><div id="success">Score</div></td>
                        <td> = Passed</td>
                        <td><div id="error">Score</div></td>
                        <td> = Failed</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr bgcolor="#cccccc">
            <td>Exam Title</td>
            <td>Exam Version</td>
            <td>Date Taken</td>
            <td>Score</td>
            <td>Status</td>
        </tr>
        <?php
        if (!$pilotdata) {echo '<tr><td colspan="5">No Exam History Exists</td></tr>';}
        else {
            foreach($pilotdata as $pilot) {
                echo'<tr>
                        <td>'.$pilot->exam_title.'</td>
                        <td>Ver-'.$pilot->exam_version.'</td>
                        <td>'.date(DATE_FORMAT, strtotime($pilot->date)).'</td>
                        <td>';
                $div='error';
                if ($pilot->passfail == '1') {
                    $div='success';
                }
                echo '<div id="'.$div.'">'.$pilot->result.'</div>';
                echo'</td>
						<td>';
                $div='pending';
                $msg='Pending';
                if ($pilot->approved == '1') {
                    $div='success';
                    $msg='Approved';
                }
                if ($pilot->approved == '2') {
                    $msg='Rejected';
                    $div='error';
                }
                echo '<div id="'.$div.'">'.$msg.'</div>';
                echo'</td>
					</tr>';
            }
        }
        ?>
    </table>
    <form method="link" action="<?php echo SITE_URL ?>/index.php/Exams">
        <input type="submit" value="Return To Exam Listing"></form>
    exam_view_profile.tpl
</center>