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
    <h2>Edit Pilot Test Record</h2>
    <form action="<?php echo url('/Exams_admin');?>" method="post" enctype="multipart/form-data">
        <table width="80%" border="1px">
            <tr>
                <td>Exam:</td>
                <td colspan="2"><b><?php echo $record->exam_title; ?></b></td>
            </tr>
            <tr>
                <td>Value</td>
                <td>Current Value</td>
                <td>New Value</td>
            </tr>
            <tr>
                <td>Status</td>
                <td>
                    <?php
                    $msg='Pending';
                    $div='pending';
                    if ($record->approved == '1') {
                        $div='success';
                        $msg='Approved';
                    }
                    if ($record->approved == '2') {
                        $msg='Rejected';
                        $div='error';
                    }
                    echo '<div id="'.$div.'">'.$msg.'</div>';
                    ?>
                </td>
                <td>
                    <select type="text" name="approved">
                        <?php
                        $cur='Pending';
                        if ($record->approved == '1') {
                            $cur='Approved';
                        }
                        if ($record->approved == '2') {
                            $cur='Rejected';
                        }
                        echo '<option value="'.$record->approved.'">'.$cur.'</option>';
                        if ($record->approved == '0') {
                            echo '<option value="1">Approved</option>';
                            echo '<option value="2">Rejected</option>';
                        }
                        elseif ($record->approved == '1') {
                            echo '<option value="0">Pending</option>';
                            echo '<option value="2">Rejected</option>';
                        }
                        else {
                            echo '<option value="0">Pending</option>';
                            echo '<option value="1">Approved</option>';
                        }
                        ?>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="1"><a href="<?php echo SITE_URL ?>/index.php/Exams_admin/delete_pilot_record?id=<?php echo $record->id; ?>&pilot_id=<?php echo $record->pilot_id; ?>"><b>DELETE</b></a></td>
                <td colspan="2"><font color="#FF0000"><b>Delete This Record - This will permenantly DELETE this record from the datbase!</b></font></td>
            </tr>
        </table>
        <br />
        <input type="hidden" name="pilot_id" value="<?php echo $record->pilot_id; ?>" />
        <input type="hidden" name="id" value="<?php echo $record->id; ?>" />
        <input type="hidden" name="action" value="save_edit_record" />
        <input type="submit" value="Save Revision">
    </form>
    <form method="link" action="<?php echo SITE_URL ?>/index.php/Exams_admin/view_individual_pilot">
        <input type="submit" value="Return To Pilot Manager"></form>
    exam_edit_pilot_record.tpl
</center>