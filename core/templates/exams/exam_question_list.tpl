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
    <table>
        <tr>
            <td colspan="4"><img src="<?php echo TEMPLATES_PATH; ?>/exams/images/exam_logo.gif" alt="EXAMCenter &copy; simpilotgroup" /></td>
        </tr>
        <tr>
            <td colspan="4" bgcolor="#cccccc"><b>Existing Questions</b></td>
        </tr>
        <tr bgcolor="#cccccc">
            <td>Active</td>
            <td>question</td>
            <td>Exam</td>
            <td>Edit</td>
        </tr>
            <?php
            foreach ($questions as $data1) {
                ?> 	<tr>
            <td><?php
                    if ($data1->active == 0) { echo '<div id="error">No</div>';}
                    else { echo '<div id="success">Yes</div>';}
                    ?></td>
                    <?php echo
                    '<td>'.$data1->question.'</td>' ?>
            <td><?php
                    $id = $data1->exam_id;

                    $title = (ExamsData::get_exam_title($id));
                    echo $title->exam_description;
                    ?>
            </td>
                <?php echo '<td> <a href="'.SITE_URL.'/index.php/Exams_admin/edit_question?id='.$data1->id.'">Question</a></td>
						<tr>';
            }
            echo '</table><br />';


            ?>
        <form method="link" action="<?php echo SITE_URL ?>/index.php/Exams_admin">
            <input type="submit" value="Return To Exam Admin Panel"></form>
</center>