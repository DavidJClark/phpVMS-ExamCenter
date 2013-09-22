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
<?php
if (isset($message)) {echo $message;}
?>
<center>
    <h2>View Pilot</h2>
    <table>

        <tr>
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
        <tr>
            <td>Exam Title (Click To Edit Record)</td>
            <td>Exam Version</td>
            <td>Date Taken</td>
            <td>Score</td>
            <td>Status</td>
        </tr>
        <?php foreach($pilotdata as $pilot) {
            echo'<tr>
                    <td><a href="'.SITE_URL.'/index.php/Exams_admin/edit_pilot_record?id='.$pilot->id.'">'.$pilot->exam_title.'</a></td>
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
        ?>
    </table>
    <form method="link" action="<?php echo SITE_URL ?>/index.php/Exams_admin/view_individual_pilot">
        <input type="submit" value="Return To Pilot Manager"></form>
    <form method="link" action="<?php echo SITE_URL ?>/index.php/Exams_admin">
        <input type="submit" value="Return To Exam Admin Panel"></form>
</center>		
<br />

