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
    <form action="<?php echo url('/Exams_admin');?>" method="post" enctype="multipart/form-data" onReset="return confirm('Do you really want to reset the form?')">
        <table width="80%" border="1px">
            <tr>
                <td>New Revision Reason</td>
                <td><textarea rows="2" cols="40" name="revision" value=""></textarea></td>
            </tr>
        </table>
        <br />
        <input type="hidden" name="action" value="save_new_revision" />
        <input type="reset">

        <input type="submit" value="Save New Revision">
    </form>
    <form method="link" action="<?php echo SITE_URL ?>/index.php/Exams_admin">
        <input type="submit" value="Cancel"></form>

        <br />exam_new_revision_form.tpl
</center>