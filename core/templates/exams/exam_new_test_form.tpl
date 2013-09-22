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
                <td>New Exam Title</td>
                <td><textarea rows="2" cols="40" name="exam_description" value=""></textarea></td>
            </tr>
            <tr>
                <td>Exam Cost</td>
                <td>$<input name="cost" value"" /></td>
            </tr>
            <tr>
                <td>Percentage Need To Pass Exam</td>
                <td><input name="passing" value"" />%</td>
            </tr>
        </table>
        <br />
        <input type="hidden" name="action" value="save_new_test" />
        <input type="submit" value="Save New Test">
    </form>
</center>