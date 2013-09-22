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
    <?php if (isset($message)) {echo $message;}
    ?>

    <table>
        <tr>
            <td colspan="5"><img src="<?php echo SITE_URL; ?>/core/templates/exams/images/exam_logo.gif" alt="EXAMCenter &copy; simpilotgroup" /></td>
        </tr>
        <tr>
            <td colspan="5" bgcolor="#cccccc"><b>Revision Reasons</b></td>
        </tr>
        <tr bgcolor="#cccccc">
            <td>Active</td>
            <td>Revision Reason</td>
            <td>Date Created</td>
            <td>Created By</td>
            <td>Edit</td>
        </tr>
        <?php
        foreach ($reasons as $reason) {
            if ($reason->editable == '0') {
                echo '<tr>';
                echo '<td>System</td>';
                echo '<td>'.$reason->revision.'</td>';
                echo '<td>System</td>';
                echo '<td>System</td>';
                echo '<td>Locked</td>';
                echo '</tr>';
            }
            else {
                if ($reason->active == '0') {
                    $active = '<div id="error">No</div>';
                }
                else {
                    $active = '<div id="success">Yes</div>';
                }
                echo '<tr>';
                echo '<td>'.$active.'</td>';
                echo '<td>'.$reason->revision.'</td>';
                echo '<td>'.date(DATE_FORMAT, strtotime($reason->date_created)).'</td>';
                echo '<td>';
                $pilot = PilotData::GetPilotData($reason->created_by);
                echo ''.$pilot->firstname.' '.$pilot->lastname.' - ';
                echo PilotData::GetPilotCode($pilot->code, $reason->created_by);
                echo '</td>';
                echo '<td><a href="'.SITE_URL.'/index.php/Exams_admin/edit_reason?id='.$reason->id.'">Edit</a></td>';
                echo '</tr>';
            }
        }
        ?>
    </table>
    <form method="link" action="<?php echo SITE_URL ?>/index.php/Exams_admin">
        <input type="submit" value="Return To Exam Admin Panel"></form>
</center>