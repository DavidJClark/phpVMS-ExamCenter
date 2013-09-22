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
    <form action="<?php echo url('/Exams_admin');?>" method="post" enctype="multipart/form-data">
        <table>
            <tr bgcolor="#cccccc">
                <td colspan="2">Date Created</td>
                <td>Created By</td>
            </tr>
            <tr>
                <td colspan="2"><?php echo date(DATE_FORMAT, strtotime($reason->date_created)); ?></td>
                <td><?php
                    $pilot = PilotData::GetPilotData($reason->created_by);
                    echo ''.$pilot->firstname.' '.$pilot->lastname.' - ';
                    echo PilotData::GetPilotCode($pilot->code, $reason->created_by);
                    ?>
                </td>
            </tr>
            <tr bgcolor="#cccccc">
                <td>Field</td>
                <td>Current Value</td>
                <td>New Value</td>
            </tr>
            <tr>
                <td>Revision Reason</td>
                <td><?php echo $reason->revision; ?></td>
                <td><textarea type="text" rows="2" cols="40" name="revision" value=""><?php echo $reason->revision; ?></textarea></td>
            </tr>
            <tr>
                <td>Active</td>
                <td><?php
                        if ($reason->active == '0') {
                        $active = '<div id="error">No</div>';
                        $cur_active= '0';
                    }
                    else {
                        $active = '<div id="success">Yes</div>';
                        $cur_active= '1';
                    }
                    echo $active;
                    ?>
                </td>
                <td>
                    <select type="text" name="active">
                        <?php
                        echo '<option value="'.$cur_active.'">'.$active.'</option>';
                        if ($cur_active == '0') {	echo '<option value="1">Yes</option>';	}
                        else {	echo '<option value="0">No</option>';	}
                        ?>
                    </select>
                </td>
            </tr>
        </table>
        <br />
        <input type="hidden" name="id" value="<?php echo $reason->id; ?>" />
        <input type="hidden" name="action" value="save_revision_edit" />
        <input type="submit" value="Edit Revision">
    </form>
</center>