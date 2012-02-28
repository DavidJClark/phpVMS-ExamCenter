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
    <h2>Edit Question</h2>
    <?php
    if (!$question) {
        echo '<div id="error">No Questions are currently assigned to this exam.</div>';
    }
    else {
        ?>
    <form action="<?php echo url('/Exams_admin');?>" method="post" enctype="multipart/form-data">
        <table width="80%" border="1px">
            <tr>
                <td>Field</td>
                <td>Current Value</td>
                <td>New Value</td>
            </tr>
            <tr>
                <td>Question</td>
                <td><?php echo $question->question; ?></td>
                <td><textarea name="question" rows="5" cols="30" value="<?php echo $question->question; ?>"><?php echo $question->question; ?></textarea></td>
            </tr>
            <tr>
                <td>Answer 1</td>
                <td><?php echo $question->answer_1; ?></td>
                <td><textarea name="answer_1" rows="5" cols="30" value="<?php echo $question->answer_1; ?>"><?php echo $question->answer_1; ?></textarea></td>
            </tr>
            <tr>
                <td>Answer 2</td>
                <td><?php echo $question->answer_2; ?></td>
                <td><textarea name="answer_2" rows="5" cols="30" value="<?php echo $question->answer_2; ?>"><?php echo $question->answer_2; ?></textarea></td>
            </tr>
            <tr>
                <td>Answer 3</td>
                <td><?php echo $question->answer_3; ?></td>
                <td><textarea name="answer_3" rows="5" cols="30" value="<?php echo $question->answer_3; ?>"><?php echo $question->answer_3; ?></textarea></td>
            </tr>
            <tr>
                <td>Answer 4</td>
                <td><?php echo $question->answer_4; ?></td>
                <td><textarea name="answer_4" rows="5" cols="30" value="<?php echo $question->answer_4; ?>"><?php echo $question->answer_4; ?></textarea></td>
            </tr>
            <tr>
                <td>Correct Answer</td>
                <td><?php echo $question->correct_answer; ?></td>
                <td><input name="correct_answer" value="<?php echo $question->correct_answer; ?>" /></td>
            </tr>
            <tr>
                <td>Exam Assignment</td>
                <td><?php $title = ExamsData::get_exam_title($question->exam_id); echo $title->exam_description; ?></td>
                <td>
                        <?php
                        $exams = ExamsData::get_exams_admin();
                        $current_title = ExamsData::get_exam_title($question->exam_id);
                        ?>
                    <select type="text" name="new_exam">
                            <?php
                            echo '<option value="'.$question->exam_id.'">'.$current_title->exam_description.'</option>';
                            foreach($exams as $exam) {
                                echo '<option value="'.$exam->id.'">'.$exam->exam_description.'</option>';
                            }
                            ?>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Active On Test</td>
                <td><?php
                        if ($question->active == '0') {
                            $active = 'No';
                            $cur_active= '0';
                        }
                        else {
                            $active = 'Yes';
                            $cur_active = '1';
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
        <input type="hidden" name="id" value="<?php echo $question->id; ?>" />
        <input type="hidden" name="exam_id" value="<?php echo $question->exam_id; ?>" />
        <input type="hidden" name="action" value="save_changes_question" />
        <input type="submit" value="Save Changes">
    </form>
    <?php
    }
    ?>
    exam_question_edit_form.tpl
</center>
