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
            <tr>
                <td colspan="3"><img src="<?php echo SITE_URL; ?>/core/templates/exams/images/exam_logo.gif" alt="EXAMCenter &copy; simpilotgroup" /></td>
            </tr>
            <tr>
                <td colspan="3" bgcolor="#cccccc"><b>Edit Setting</b></td>
            </tr>

            <tr bgcolor="#cccccc">
                <td>Setting Name</td>
                <td><?php echo $setting->setting; ?></td>
                <td>For Yes/No Values<br />0 = No/Closed<br />1 = Yes/Open</td>
            </tr>
            <tr>
                <td>Value</td>
                <td>Current Value: <b><?php echo $setting->value; ?></b></td>
                <td>New Value:<br />
                    <?php if ($setting->setting_type == 1) { ?>
                    <textarea rows="5" cols="40" name="value" value="<?php echo $setting->value; ?>"><?php echo $setting->value; ?></textarea>
                    <?php
                    }
                    elseif ($setting->setting_type == 2) {
                        if ($setting->value == 0) {
                            $cur_active = '0';
                            $active = 'No';
                        }
                        else {
                            $cur_active = '1';
                            $active = 'Yes';
                        }
                        echo '<select type="text" name="value">';
                        echo '<option value="'.$cur_active.'">'.$active.'</option>';
                        if ($cur_active == '0') {	echo '<option value="1">Yes</option>';	}
                        else {	echo '<option value="0">No</option>';	}
                        echo '</select>';
                    }
                    else {
                        ?>
                    <input name="value" value="<?php echo $setting->value; ?>" />
                    <?php
                    }
                    ?>
                </td>
            </tr>
        </table>
        <br />
        <input type="hidden" name="id" value="<?php echo $setting->id; ?>" />
        <input type="hidden" name="action" value="edit_setting" />
        <input type="submit" value="Save Setting">
    </form>
    <form method="link" action="<?php echo SITE_URL ?>/index.php/Exams_admin">
        <input type="submit" value="Return To Exam Admin Panel"></form>
</center>