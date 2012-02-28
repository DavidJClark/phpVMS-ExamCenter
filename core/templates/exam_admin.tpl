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
    <table border="1px" width="80%">
        <?php
        if (isset($message)) {echo '<tr><td colspan="6">'.$message.'</td></tr>';}
        ?>
        <tr>
            <td colspan="2"><img src="<?php echo SITE_URL ?>/examimages/exam_logo.gif" alt="EXAMCenter &copy simpilotgroup" /></td>
            <td colspan="4"><br /><h4>EXAMCenter Admin Panel</h4></td>

        <tr>
            <td colspan="6" bgcolor="#cccccc"><b>Exams Awaiting Approval:</b></td>
        </tr>

        <?php
        if (!$unapproved) {echo '<tr><td colspan="6">There are no exams currently awaiting approval.</td></tr>';}
        else {
            echo '<tr>
                    <td colspan="4" align="right">Exam Passed</td>
                    <td colspan="1"><div id="success">Score</div></td>
                    <td rowspan="2">Manage Exam<br />Submissions</td>
                </tr>
                <tr>
                    <td colspan="4" align="right">Exam Failed</td>
                    <td colspan="1"><div id="error">Score</div></td>

                </tr>
                <tr>
                    <td>Pilot</td>
                    <td>Date Submitted</td>
                    <td>Exam Title</td>
                    <td>Version</td>
                    <td>Percent Correct</td>
                    <td>Approve / Disapprove</td>
                </tr>';

            foreach ($unapproved as $awaiting) {
                echo '<tr>
		<td>';
                $pilot = PilotData::GetPilotData($awaiting->pilot_id);
                echo $pilot->firstname.' '.$pilot->lastname.' - ';
                echo PilotData::GetPilotCode($pilot->code, $awaiting->pilot_id);
                echo '</td>
		<td>'.date(DATE_FORMAT, strtotime($awaiting->date)).'</td>
		<td>'.$awaiting->exam_title.'</td>
		<td>'.$awaiting->exam_version.'</td>
		<td>';
                if ($awaiting->passfail == 0) {$div = 'error';}
                else {$div = 'success';}
                echo '<div id="'.$div.'">'.$awaiting->result.'%</div></td>
		<td><a href="'.SITE_URL.'/index.php/Exams_admin/save_approve_result?id='.$awaiting->id.'&approve=1">Approve</a> / <a href="'.SITE_URL.'/index.php/Exams_admin/save_approve_result?id='.$awaiting->id.'&approve=2">Disapprove</a></td>
		</tr>';
            }
        }
        ?>
        <tr>
            <td colspan="6" bgcolor="#cccccc"><b>Pilot Exam Requests:</b></td>
        </tr>

        <?php
        if (!$requests) {echo '<tr><td colspan="6">There Are No Exam Requests Pending At This Time</td></tr>'; }
        else {
            echo '<tr>';
            echo '<td colspan="2">Pilot</td>';
            echo '<td colspan="2">Exam Requested</td>';
            echo '<td colspan="2">Assign Exam</td>';
            echo '</tr>';

            foreach ($requests as $request) {
                $pilot = PilotData::GetPilotData($request->pilot_id);
                $exam = ExamsData::get_exam_title($request->exam_id);
                echo '<tr>';
                echo '<td colspan="2">'.$pilot->firstname.' '.$pilot->lastname.' '.PilotData::GetPilotCode($pilot->code, $request->pilot_id).'</td>';
                echo '<td colspan="2">'.$exam->exam_description.'</td>';
                echo '<td colspan="2"><a href="'.SITE_URL.'/index.php/Exams_admin/assign_exam_admin?id='.$exam->id.'&pilot_id='.$request->pilot_id.'">Assign Exam</a></td>';
                echo '</tr>';
            }
        }
        ?>
        <tr>
            <td colspan="6" bgcolor="#cccccc"><b>Exams Currently Assigned:</b></td>
        </tr>
<?php
$assigned = ExamsData::assigned_exams();
if (!$assigned) {echo '<tr><td colspan="6">No Exams Are Currently Assigned</td></tr>'; }
        else {      echo '<tr>';
            echo '<td colspan="3">Pilot</td>';
            echo '<td colspan="3">Exam Assigned</td>';
            echo '</tr>';

            foreach ($assigned as $assign) {
                $pilot = PilotData::GetPilotData($assign->pilot_id);
                $exam = ExamsData::get_exam_title($assign->exam_id);
                echo '<tr>';
                echo '<td colspan="3">'.$pilot->firstname.' '.$pilot->lastname.' '.PilotData::GetPilotCode($pilot->code, $assign->pilot_id).'</td>';
                echo '<td colspan="3">'.$exam->exam_description.'</td>';
                echo '</tr>';
            }
        }
        ?>
    </table>
    <hr /><br />
    <table border="1px" width="80%">
        <tr>
            <td bgcolor="#cccccc"><b>Exam Center Exam And Question Configuration:</b></td>
            <td bgcolor="#cccccc"><b>View/Edit</b></td>
        </tr>
        <tr>
            <td>Exams in Database: <?php $count=ExamsData::get_exam_count(); echo $count->total; ?></td>
            <td><a href="<?php echo SITE_URL ?>/index.php/Exams_admin/view_current_exams">Edit/View Current Exams</a></td>
        </tr>
        <tr>
            <td>Questions in Database: <?php $count=ExamsData::get_question_count(); echo $count->total; ?></td>
            <td><a href="<?php echo SITE_URL ?>/index.php/Exams_admin/view_current_questions">Edit/View Current Questions</a></td>
        </tr>
        <tr>
            <td>Total Exams Taken By Pilots:</td>
            <td><?php $totals = ExamsData::get_exams_taken();
if ($totals[1] > 0) {echo $totals[1];}
else {echo 'No Exams Taken';}?>
            </td>
        </tr>
        <tr>
            <td>Total Exams Passed:</td>
            <td><?php
                if ($totals[1] > 0) {echo $totals[0];}
                else {echo 'No Exams Taken';}?>
            </td>
        </tr>
        <tr>
            <td>Overall Exam Passing Percentage:</td>
            <td><?php if ($totals[1] > 0) {$percent = (100 * ($totals[0] / $totals[1])); echo round($percent, 1).'%';}
else {echo 'No Exams Taken';}?>
            </td>
        </tr>
        <tr>
            <td colspan="2"><a href="<?php echo SITE_URL ?>/index.php/Exams_admin/view_individual_pilot"><b>Manage Pilots - Individual Pilot Stats</b></a></td>
        </tr>
    </table>
    <hr /><br />
<?php
$admin = ExamsData::check_admin(Auth::$userinfo->pilotid);
                if ($admin->admin_level == '1') {
                    ?>
    <table border="1px" width="80%">
        <tr>
            <td bgcolor="#cccccc"><b>Exam Center Configuration:</b></td>
            <td bgcolor="#cccccc"><b>View/Edit</b></td>
        </tr>
        <tr>
            <td>Exam Center Is: <?php
    $setting = ExamsData::get_setting_info('2');
        if ($setting->value == 0) { echo '<font color="#FF0000"><b>Closed</b></font>'; }
        else { echo '<font color="#006600"><b>Open</b></font>'; }
        ?>
            </td>
            <td><a href="<?php echo SITE_URL ?>/index.php/Exams_admin/get_setting_info?id=2">Change Exam Center Status</a></td>
        </tr>
        <tr>
            <td>Current EXAMCenter Administrator(s):<br />
    <?php
    $admins = ExamsData::get_admin('1');
    foreach($admins as $admin) {
        $data = PilotData::GetPilotData($admin->pilot_id);
                        echo '<b>'.$data->firstname.' '.$data->lastname.' - ';
                        echo PilotData::GetPilotCode($data->code, $data->pilotid);
                        echo'</b><br />';
                    }
    ?>
            </td>
            <td rowspan="2"><a href="<?php echo SITE_URL ?>/index.php/Exams_admin/edit_admin_list">Add/Remove<br />Administrators<br />& Staff Members</a></td>
        </tr>
        <tr>
            <td>Current EXAMCenter Staff Member(s):<br /><b><?php
                    $authors = ExamsData::get_admin('2');
                    if (!$authors) {echo 'The Are No Staff Members Currently';}
                    else {
                        foreach ($authors as $author) {   $admin = PilotData::GetPilotData($author->pilot_id);
                            echo $admin->firstname.' '.$admin->lastname.' - ';
                            echo PilotData::GetPilotCode($admin->code, $admin->pilotid);
                            echo '<br />';
                        }
                    }
    ?></b>
            </td>
        </tr>
        <tr>
            <td>Message To Display When EXAMCenter Is Open: <?php
                        $setting = ExamsData::get_setting_info('4');
                        echo '<br /><b>'.$setting->value.'</b>';
                        ?>
            </td>
            <td><a href="<?php echo SITE_URL ?>/index.php/Exams_admin/get_setting_info?id=4">Edit Message</a></td>
        </tr>
        <tr>
            <td>Message To Display When EXAMCenter Is Closed: <?php
                        $setting = ExamsData::get_setting_info('3');
                        echo '<br /><b>'.$setting->value.'</b>';
                        ?>
            </td>
            <td><a href="<?php echo SITE_URL ?>/index.php/Exams_admin/get_setting_info?id=3">Edit Message</a></td>
        </tr>
        <tr>
            <td>Admin Assign Of Exams Enabled: <?php
    $setting = ExamsData::get_setting_info('5');
                    if ($setting->value == 0) { echo '<font color="#FF0000"><b>No</b></font>'; }
                    else { echo '<font color="#006600"><b>Yes</b></font>'; }
                    ?>
            </td>
            <td><a href="<?php echo SITE_URL ?>/index.php/Exams_admin/get_setting_info?id=5">Edit Admin Assign</a></td>
        </tr>

        <tr>
            <td>Global Passing Threshold: <?php $setting = ExamsData::get_setting_info('1'); echo $setting->value; ?>% <b>(Not Functional Yet)</b></td>
            <td><a href="<?php echo SITE_URL ?>/index.php/Exams_admin/get_setting_info?id=1">Edit Threshold</a></td>
        </tr>

        <tr>
            <td>Revision Codes Available: <?php $total = ExamsData::get_revision_total(); echo $total->total; ?></td>
            <td><a href="<?php echo SITE_URL ?>/index.php/Exams_admin/view_revision_reasons">Edit/View Current Revision Reasons</a></td>
        </tr>
    </table>
    <hr />
    <br />
                <?php
}
?>
    <table width="75%">
        <tr>
            <td>
                <form method="link" action="<?php echo SITE_URL ?>/index.php/Exams_admin/new_test_form">
                    <input type="submit" value="Create New Test"></form>
            </td>
            <td>
                <form method="link" action="<?php echo SITE_URL ?>/index.php/Exams_admin/new_question_form">
                    <input type="submit" value="Create New Question"></form>
            </td>
            <td>
                <form method="link" action="<?php echo SITE_URL ?>/index.php/Exams_admin/new_revision_form">
                    <input type="submit" value="Create Revision Reason"></form>
            </td>
        </tr>
    </table>
    exam_admin.tpl
</center>