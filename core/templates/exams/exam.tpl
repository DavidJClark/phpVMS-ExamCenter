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
<center><br/>
    <?php echo Auth::$userinfo->firstname; ?>, you now have $<?php echo $pilotpay->totalpay; ?> in your company account.<br /><br />
    <b><font color="#FF0000">Refreshing this page or using the back button will cause the test fee to be billed to your company account again!</font></b><br /><br />
		Use the submit button at the bottom of the exam to submit your answers.<br /><br/>

    <form name="myform" action="<?php echo SITE_URL ?>/index.php/Exams/grade_exam" method="POST">
        <table cellpadding="15px">
            <?php
            echo '<tr><td colspan="2"><h2>'.$title->exam_description.'</h2></td></tr>';
            $count = 0;
            foreach ($questions as $question) {
                $count++;
                echo '<tr><td align="left" width="15%">Question #'.$count.'</td>';
                echo '<td align="left"><b>'.$question->question.'</b><br />';
                echo '<input type="radio" name="question'.$count.'" value="1">'.$question->answer_1.'<br>';
                echo '<input type="radio" name="question'.$count.'" value="2">'.$question->answer_2.'<br>';
                echo '<input type="radio" name="question'.$count.'" value="3">'.$question->answer_3.'<br>';
                echo '<input type="radio" name="question'.$count.'" value="4">'.$question->answer_4.'';
                echo '<input type="hidden" name="question_id'.$count.'" value="'.$question->id.'" />';
                echo '<input type="hidden" name="question_counter" value="'.$count.'" />';
                echo '</td></tr>';

            }
            ?>
            <tr><td colspan="2">
                    <input type="hidden" name="exam_id" value="<?php echo $title->id; ?>" />
                    <input type="hidden" name="version" value="<?php echo $title->version; ?>" />
                    <input type="hidden" name="passing" value="<?php echo $title->passing; ?>" />
                    <input type="hidden" name="exam_description" value="<?php echo $title->exam_description; ?>" />
                    <input type="hidden" name="howmany" value="<?php echo $howmany_questions->total; ?>" />
                    <input type="submit" value="Submit Exam">
                </td></tr>
        </table>
    </form>
</center>