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
    <h2>Manage Assigned Exams For <?php echo $pilot->firstname.' '.$pilot->lastname. ' ('.PilotData::GetPilotCode($pilot->code, $pilot->pilotid); ?>)</h2>
    <table>
        <tr>
            <td>Active Exam Titles</td>
            <td>Pilot Has Already<br />Taken And Passed Exam</td>
            <td>Current Status For Pilot</td>
            <td>Manage Exam</td>
        </tr>
        <?php
        foreach ($exams as $exam) {
            echo '<tr>';
            echo '<td>'.$exam->exam_description.'</td>';
            echo '<td>';
            $total = ExamsData::check_exam_passed($pilot->pilotid, $exam->id);
            if ($total->total == '0') {echo '<font color="#FF0000">No</font>';}
            else {echo '<font color="#006600">Yes</font>';}
            echo '</td>';
            echo '<td>';
            $assign = ExamsData::check_exam_assigned($pilot->pilotid, $exam->id);
            if ($assign->total == 0) { echo '<font color="#ff0000">Unassigned</font>';}
            else {echo '<font color="#006600">Assigned</font>';}
            echo '</td>';
            echo '<td>';
            if ($assign->total == 0) {echo '<a href="'.SITE_URL.'/index.php/Exams_admin/assign_exam?pilot_id='.$pilot->pilotid.'&exam_id='.$exam->id.'">assign exam</a>';}
            else {echo '<a href="'.SITE_URL.'/index.php/Exams_admin/unassign_exam?pilot_id='.$pilot->pilotid.'&exam_id='.$exam->id.'">unassign exam</a>';}
            echo '</td>';
            echo '</tr>';
        }
        ?>
    </table>
    <br/>
    <table>
        <tr>
            <td>
                <form method="link" action="<?php echo SITE_URL ?>/index.php/Exams_admin/view_individual_pilot">
                    <input type="submit" value="Return To Pilot Management"></form>
            </td>
            <td>
                <form method="link" action="<?php echo SITE_URL ?>/index.php/Exams_admin">
                    <input type="submit" value="Return To Exam Admin Panel"></form>
            </td>
        </tr>
    </table>
</center>