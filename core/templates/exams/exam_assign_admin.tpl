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
        if (isset($message)) { echo '<tr><td colspan="3"><div id="success">'.$message.'</div></td></tr>'; }
        ?>
        <tr>
            <td><b>Pilot</b></td>
            <td><b>Current Status</b></td>
            <td>&nbsp</td>
        </tr>
<?php
        foreach ($pilots as $pilot) {
            echo '<tr>';
            echo '<td>'.$pilot->firstname.' '.$pilot->lastname.' '.PilotData::GetPilotCode($pilot->code, $pilot->pilotid).'</td>';
            echo '<td>';
            $admin = ExamsData::check_admin($pilot->pilotid);
            if (!admin) {echo '&nbsp';}
            else { if ($admin->admin_level == '1') {echo '<font color="#FF0000">Administrator</font>';}
                else {   if ($admin->admin_level == '2') {echo '<font color="#006600">Staff Member</font>';}
                    else {echo '&nbsp';}
                }
            }
            echo '</td>';
            echo '<td><a href="'.SITE_URL.'/index.php/Exams_admin/edit_admin?id='.$pilot->pilotid.'">Change Status</a></td>';
            echo '</tr>';
        } ?>
    </table>
    <form method="link" action="<?php echo SITE_URL ?>/index.php/Exams_admin">
        <input type="submit" value="Return To Exam Admin Panel"></form>
    exam_assign_admin.tpl
</center>