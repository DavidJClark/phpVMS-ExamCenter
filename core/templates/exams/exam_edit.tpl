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
    <h2><?php echo $exam->exam_description; ?></h2>
    <?php
    if (isset($message)) {echo $message;}
    ?>
    <table>
        <tr>
            <td>Date Created:</td>
            <td><?php echo date(DATE_FORMAT, strtotime($exam->created_date)) ?></td>
        </tr>
        <tr>
            <td>Exam Created By:</td>
            <td>
<?php $pilot = PilotData::GetPilotData($exam->created_by); ?>
                <?php echo ''.$pilot->firstname.' '.$pilot->lastname.' - '; ?>
                <?php echo PilotData::GetPilotCode($pilot->code, $exam->created_by); ?>
            </td>
        </tr>
        <tr>
            <td>Current Version:</td>
            <td>ver-<?php echo $exam->version; ?></td>
        </tr>
        <tr>
            <td>Date Of Last Revision:</td>
            <td><?php echo date(DATE_FORMAT, strtotime($exam->last_changed)) ?></td>
        </tr>
        <tr>
            <td>Last Revision By:</td>
            <td>
<?php 

                $rev = ExamsData::get_last_exam_revision($exam->id);
                $pilot2 = PilotData::GetPilotData($rev->revised_by);
                echo ''.$pilot2->firstname.' '.$pilot2->lastname.' - ';
                echo PilotData::GetPilotCode($pilot2->code, $rev->revised_by);
                ?>
            </td>
        </tr>
        <tr>
            <td>See Revision List</td>
            <td><a href="<?php echo SITE_URL ?>/index.php/Exams_admin/see_exam_revisions?id=<?php echo $exam->id; ?>">Revisions List</a></td>
        </tr>
        <tr>
            <td>Current Total Number Of Questions Assigned To Exam:</td>
            <td><?php $questions = ExamsData::get_howmany_questions($exam->id); echo $questions->total; ?></td>
        </tr>
        <tr>
            <td>Current Number Of Active Questions On Exam:</td>
            <td><?php $active = ExamsData::get_howmany_questions_active($exam->id); echo $active->total; ?></td>
        </tr>
        <tr>
            <td>Edit Questions</td>
            <td><a href="<?php echo SITE_URL ?>/index.php/Exams_admin/edit_questions?id=<?php echo $exam->id; ?>">Edit Questions</a></td>
        </tr>
    </table>

    <form action="<?php echo url('/Exams_admin');?>" method="post" enctype="multipart/form-data">
        <table>
            <tr>
                <td>Field</td>
                <td>Current Value</td>
                <td>New Value</td>
            </tr>
            <tr>
                <td>Active Test</td>
                <td><?php
if ($exam->active == 0) {
                        $cur_active = '0';
                        $active = 'No';
                        echo '<div id="error">'.$active.'</div>';
                    }
                    else {
                        $cur_active = '1';
                        $active = 'Yes';
                        echo '<div id="success">Yes</div>';
                    }
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
            <tr>
                <td>Exam Description</td>
                <td><?php echo $exam->exam_description ?></td>
                <td><textarea type="text" name="description" rows="2" cols="40" value=""><?php echo $exam->exam_description ?></textarea></td>
            </tr>
            <tr>
                <td>Exam Cost</td>
                <td>$<?php echo $exam->cost; ?></td>
                <td>$<input type="text" name="cost" value="<?php echo $exam->cost; ?>" /></td>
            </tr>
            <tr>
                <td>Percentage Need To Pass</td>
                <td><?php echo $exam->passing; ?></td>
                <td><input type="text" name="passing" value="<?php echo $exam->passing; ?>" /></td>
            </tr>
            <tr>
                <td colspan="2">Reason For Revision:</td>
                <td><select type="text" name="reason">
<?php
$reasons = (ExamsData::get_revision_reasons());

foreach ($reasons as $reason) {	echo '<option value="'.$reason->id.'">'.$reason->revision.'</option>'; }
?>	
                    </select></td>
            </tr>
        </table><br />
        <input type="hidden" name="exam_id" value="<?php echo $exam->id; ?>" />
        <input type="hidden" name="current" value="<?php echo $num_questions->total; ?>" />
        <input type="hidden" name="action" value="save_changes" />
        <input type="submit" value="Save Changes" />
    </form>
</center>