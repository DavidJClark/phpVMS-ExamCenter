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

<?php
    $title = ExamsData::get_exam_title($exam_id);
    if (!$revisions) {
        echo '<br /><div id="error">There are no revisions to the <b>'.$title->exam_description.'</b> exam.</div>';
        Template::Set('num_questions', ExamsData::get_howmany_questions($exam_id));
        Template::Set('exam', ExamsData::get_exam_edit($exam_id));
        Template::Show('exam_edit.tpl');
        return;
    }
    else {?>
    <h2><?php echo $title->exam_description; ?> - Revision List</h2>
    <table>
        <tr>
            <td><b>Revision Reason</b></td>
            <td><b>Revision Date</b></td>
            <td><b>Revised By</b></td>
        </tr>
    <?php
    foreach ($revisions as $revision) {

                echo 	'<tr>
							<td>';
                $rev = ExamsData::get_revision_type($revision->revision);
                echo $rev->revision;
                echo '</td>
							<td>'.date(DATE_FORMAT, strtotime($revision->date_revised)).'</td>
							<td>';
                $pilot = PilotData::GetPilotData($revision->revised_by);
                echo ''.$pilot->firstname.' '.$pilot->lastname.' - ';
                echo PilotData::GetPilotCode($pilot->code, $revision->revised_by);
                echo '</td>
						</tr>';
            }
        }
        ?>
        <tr>
            <td colspan="3"><a href="<?php echo SITE_URL ?>/index.php/Exams_admin/edit_exam?id=<?php echo $exam_id; ?>">Return To Exam Editor</a></td>
        </tr>
    </table>