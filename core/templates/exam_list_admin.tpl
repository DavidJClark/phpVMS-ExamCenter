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
    <table border="1px" width="90%">
        <tr>
            <td colspan="8"><img src="<?php echo SITE_URL ?>/examimages/exam_logo.gif" alt="EXAMCenter &copy; simpilotgroup" /></td>
        </tr>
        <tr>
            <td colspan="8" bgcolor="#cccccc"><b>Existing Exams</b></td>
        </tr>
        <tr bgcolor="#cccccc">
            <td>Active</td>
            <td>Exam Description</td>
            <td>Exam Cost</td>
            <td>Date Created</td>
            <td>Last Update</td>
            <td>Version</td>
            <td colspan="2">Edit</td>
        </tr>
        <?php
        foreach ($exams as $data) {
            ?> 	<tr>
            <td><?php
    if ($data->active == 0) { echo '<div id="error">No</div>';}
                    else { echo '<div id="success">Yes</div>';}
                    ?></td>
                    <?php echo
                    '<td>'.$data->exam_description.'</td>
                        <td>$'.$data->cost.'</td>
                        <td>'.date(DATE_FORMAT, strtotime($data->created_date)).'</td>
                        <td>'.date(DATE_FORMAT, strtotime($data->last_changed)).'</td>
                        <td>ver-'.$data->version.'</td>
                        <td> <a href="'.SITE_URL.'/index.php/Exams_admin/edit_exam?id='.$data->id.'">Exam</a></td>
                        <td> <a href="'.SITE_URL.'/index.php/Exams_admin/edit_questions?id='.$data->id.'">Exam Questions</a></td>
                <tr>';
                }?>

    </table><br />



    <form method="link" action="<?php echo SITE_URL ?>/index.php/Exams_admin">
        <input type="submit" value="Return To Exam Admin Panel"></form>
    exam_list_admin.tpl
</center>