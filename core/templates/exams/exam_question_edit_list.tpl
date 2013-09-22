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
    <h2><?php echo $title->exam_description; ?> Exam Questions</h2>
    <?php
    if (!$questions) {
        echo '<div id="error">No Questions are currently assigned to this exam.</div>';
    }
    else {
        ?>

    <table>
        <tr>
            <td>Edit</td>
            <td>Question</td>
            <td>Answer 1</td>
            <td>Answer 2</td>
            <td>Answer 3</td>
            <td>Answer 4</td>
            <td>Correct Answer</td>
            <td>Active</td>

        </tr>
            <?php
            foreach ($questions as $question) {
                echo '<tr><td><a href="'.SITE_URL.'/index.php/Exams_admin/edit_question?id='.$question->id.'">Edit</a></td>';
                echo '<td>'.$question->question.'</td>';
                echo '<td>'.$question->answer_1.'</td>';
                echo '<td>'.$question->answer_2.'</td>';
                echo '<td>'.$question->answer_3.'</td>';
                echo '<td>'.$question->answer_4.'</td>';
                echo '<td>'.$question->correct_answer.'</td>';
                if ($question->active == '0') {
                    $active = '<div id="error">No</div>';
                }
                else {
                    $active = '<div id="success">Yes</div>';
                }
                echo '<td>'.$active.'</td></tr>';


            }
            ?>
        <tr>
            <td colspan="8"><a href="<?php echo SITE_URL ?>/index.php/Exams_admin/edit_exam?id=<?php echo $title->id; ?>">Return To Exam Editor</a></td>
        </tr>
    </table>
    <?php
    }
    ?>
</center>
