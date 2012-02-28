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
    <?php if (isset($message)) {echo $message;}?>
    <h2>Edit Adminstrator Status</h2>
    <form action="<?php echo url('/Exams_admin');?>" method="post" enctype="multipart/form-data">
        <table width="80%" border="1px">
            <tr>
                <td>Pilot</td>
                <td>Current Admin Status</td>
                <td>New Status</td>
            </tr>
            <tr>
                <td>
                    <?php
                    $data = PilotData::GetPilotData($pilot_id);
                    echo $data->firstname.' '.$data->lastname.' '.PilotData::GetPilotCode($data->code, $pilot_id);
                    ?>
                </td>
                <td><b> 
                        <?php
                        if (!$pilot) {echo 'None';}
                        elseif ($pilot->admin_level == '1') {echo '<font color="#FF0000">Administrator</font>';}
                        else {echo '<font color="#006600">Staff Member</font>';}

                        ?>
                    </b></td>
                <td>
                        <?php
                        if ($pilot->admin_level == 1) {
    $cur_active = '1';
    $active = 'Administrator';
                    }
                    elseif ($pilot->admin_level == 0) {
                        $cur_active = '0';
                        $active = 'None';
                    }
                    else {
                        $cur_active = '2';
                        $active = 'Staff Member';
                    }
                    echo '<select type="text" name="admin_level">';
                    echo '<option value="'.$cur_active.'">'.$active.'</option>';
                    if ($cur_active == '0') {
                        echo '<option value="1">Administrator</option>';
                        echo '<option value="2">Staff Member</option>';
                    }
                    elseif ($cur_active == '1') {
                        echo '<option value="0">None</option>';
                        echo '<option value="2">Staff Member</option>';
                    }
                    else {
                        echo '<option value="0">None</option>';
                        echo '<option value="1">Administrator</option>';
                    }
                    echo '</select>';
                    ?>
                </td>
            </tr>
        </table>
        <br />
        <input type="hidden" name="cur_level" value="<?php echo $cur_active; ?>" />
        <input type="hidden" name="pilot_id" value="<?php echo $data->pilotid; ?>" />
        <input type="hidden" name="action" value="edit_admin_setting" />
        <input type="submit" value="Save New Status">
    </form>
    <form method="link" action="<?php echo SITE_URL ?>/index.php/Exams_admin/edit_admin_list">
        <input type="submit" value="Return To Admin Status Panel"></form>
    exam_edit_admin.tpl
</center>
