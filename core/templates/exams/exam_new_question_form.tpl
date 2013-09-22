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
    <?php
    if (isset($message)) {echo $message;}
    ?>

    <table width="80%" border="1px">
        <form action="<?php echo url('/Exams_admin');?>" method="post" enctype="multipart/form-data">
            <tr>
                <td>Exam question assigned to.</td>
                <td>
                    <select type="text" name="exam_id">
<?php
                        foreach($exams as $exam) {
                            echo '<option value="'.$exam->id.'">'.$exam->exam_description.'</option>';
                        }
                        ?>
                    </select>
                </td>
            </tr>
            <tr>
                <td>New Question</td>
                <td><textarea name="question" rows="5" cols="40"></textarea></td>
            </tr>
            <tr>
                <td>First Possible Answer</td>
                <td><textarea name="answer_1" rows="5" cols="40"></textarea></td>
            </tr>
            <tr>
                <td>Second Possible Answer</td>
                <td><textarea name="answer_2" rows="5" cols="40"></textarea></td>
            </tr>
            <tr>
                <td>Third Possible Answer</td>
                <td><textarea name="answer_3" rows="5" cols="40"></textarea></td>
            </tr>
            <tr>
                <td>Fourth Possible Answer</td>
                <td><textarea name="answer_4" rows="5" cols="40"></textarea></td>
            </tr>
            <tr>
                <td>Correct Answer</td>
                <td><input type="text" name="correct_answer"></td>
            </tr>
            <tr>
                <td>Active Question</td>
                <td>
                    <select name="active">
                        <option value="1">Yes</option>
                        <option value="0">No</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2"><input type="hidden" name="action" value="save_new_question" /><input type="submit" value="Save New Question"></td>
            </tr>
        </form>
    </table>
 exam_edit_question_form.tpl
</center>