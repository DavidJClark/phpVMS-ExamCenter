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

class ExamsData extends Codondata {
    public function check_admin($id) {
        $query = "SELECT *
                FROM exams_admin
                WHERE pilot_id = '$id'";
        
        return DB::get_row($query);
    }

    public function get_admin($level) {
        $query = "SELECT *
                FROM exams_admin
                WHERE admin_level='$level'";

        return DB::get_results($query);
    }

    public function get_admin_data($id) {
        $query = "SELECT *
                FROM exams_admin
                WHERE pilot_id='$id'";

        return DB::get_row($query);
    }

    public function add_admin($pilot_id, $admin_level)  {
        $query="INSERT INTO exams_admin (pilot_id, admin_level)
                VALUES ('$pilot_id', '$admin_level')";

        DB::query($query);
    }

    public function edit_admin($pilot_id, $admin_level) {
        $upd = "UPDATE exams_admin SET admin_level='$admin_level' WHERE pilot_id='$pilot_id'";

        DB::query($upd);
    }

    public function delete_admin($pilot_id) {
        $query = "DELETE FROM exams_admin
                WHERE pilot_id='$pilot_id'";

        DB::query($query);
    }

    public function get_exams() {
        $query = "SELECT *
                FROM exams
                WHERE active='1'
                ORDER BY cost ASC";

        return DB::get_results($query);
    }

    public function get_exams_admin() {
        $query = "SELECT *
                FROM exams
                ORDER BY cost ASC";

        return DB::get_results($query);
    }

    public function get_setting_info($id) {
        $query = "SELECT *
                FROM exams_settings
                WHERE id='$id'";

        return DB::get_row($query);
    }

    public function edit_setting_value($id, $value) {
        $upd = "UPDATE exams_settings
            SET value='$value'
            WHERE id='$id'";

        DB::query($upd);
    }

    public function get_exam_count() {
        $query = "SELECT COUNT(*) AS total
		FROM exams";

        return DB::get_row($query);
    }

    public function get_exams_unapproved() {
        $query = "SELECT *
                FROM exams_results
                WHERE approved=0";

        return  DB::get_results($query);
    }

    public function get_pilot_data($id) {
        $query = "SELECT *
                FROM exams_results
                WHERE pilot_id='$id'
                ORDER BY date DESC";

        return DB::get_results($query);
    }

    public function get_pilot_record($id) {
        $query = "SELECT *
		FROM exams_results
		WHERE id='$id'";

        return DB::get_row($query);
    }

    public function edit_pilot_record($id, $approved) {
        $upd = "UPDATE exams_results
            SET approved='$approved'
            WHERE id='$id'";

        DB::query($upd);
    }

    public function get_exams_taken_total($id) {
        $query = "SELECT COUNT(*) AS total
		FROM exams_results
		WHERE pilot_id='$id'";

        return DB::get_row($query);
    }

    public function get_exams_average_total($id, $num_exams) {
        if ($num_exams==0) {
            $percentage = 'No Exams Taken';
            return $percentage;
        }
        else {
            $query = "SELECT result
		FROM exams_results
		WHERE pilot_id='$id'";
            $results = DB::get_results($query);
            $total=0;
            foreach($results as $result) {
                $total = $total + $result->result;
            }
            $percentage = ($total / $num_exams);
            return round($percentage, 1);
        }
    }

    public function get_question_count() {
        $query = "SELECT COUNT(*) AS total
		FROM exams_questions";

        return DB::get_row($query);
    }

    public function get_exams_taken() {
        $query = "SELECT passfail
		FROM exams_results";
        $counts = DB::get_results($query);
        $totalpass=0;
        if (isset($counts))
        {
        $total=0;
        foreach ($counts as $count) {
            $totalpass = $totalpass + $count->passfail;
            $total++;
        }
        }
        return array($totalpass, $total);
    }

    public function get_questions_admin() {
        $query = "SELECT *
		FROM exams_questions
		ORDER BY id ASC";

        return DB::get_results($query);
    }

    public function request_exam($pilot_id, $id)    {
        $query = "INSERT INTO exams_requests (pilot_id, exam_id)
                 VALUES ('$pilot_id', '$id')";

        DB::query($query);
    }

    public function check_for_request($pilot_id, $id)   {
        $query = "SELECT COUNT(*) AS total
                FROM exams_requests
                WHERE pilot_id='$pilot_id'
                AND exam_id='$id'";

        return DB::get_row($query);
    }

    public function get_exam_requests() {
        $query = "SELECT *
                FROM exams_requests";

        return DB::get_results($query);
    }

    public function unrequest_exam($pilot_id, $exam_id) {
        $query = "DELETE FROM exams_requests
                WHERE pilot_id='$pilot_id'
                AND exam_id='$exam_id'";

        DB::query($query);
    }

    public function buy_exam($id) {
        $query = "SELECT *
		FROM   exams
		WHERE id='$id'";

        return DB::get_row($query);
    }

    public function pay_for_exam($pid, $exam_id) {
        $query = "SELECT *
		FROM   exams
		WHERE id='$exam_id'";

        $cost = DB::get_row($query);

        $query2 = "SELECT *
		FROM   phpvms_pilots
		WHERE pilotid='$pid'";

        $bank = DB::get_row($query2);

        $newbank = (($bank->totalpay) - ($cost->cost));

        $upd = "UPDATE phpvms_pilots SET totalpay='$newbank' WHERE pilotid='$pid'";

        DB::query($upd);

        //should be able to use AUTH class!
        $query3 = "SELECT *
		FROM   phpvms_pilots
		WHERE pilotid='$pid'";

        return DB::get_row($query3);
    }

    //use auth class!
    //public function pilot_money($pid) {
    //    $query = "SELECT ROUND(totalpay,2) as totalpay
    //	FROM phpvms_pilots
    //	WHERE pilotid='$pid'";
    //
    //  return DB::get_row($query);
    //}

    public function get_exam($id) {
        $query = "SELECT *
		FROM exams
		WHERE id='$id'";

        $exam = DB::get_results($query);
        foreach ($exam as $examdata)
            $query2 = "SELECT *
                    FROM exams_questions
                    WHERE exam_id='$examdata->id'
                    AND active='1'";

        return DB::get_results($query2);
    }

    public function get_exam_edit($id) {
        $query = "SELECT *
		FROM exams
		WHERE id='$id'";

        return DB::get_row($query);
    }

    public function get_exam_title($id) {
        $query = "SELECT id, exam_description, passing, version
		FROM   exams
		WHERE id='$id'";

        return DB::get_row($query);
    }

    public function get_howmany_questions($id) {
        $query = "SELECT COUNT(*) AS total
		FROM exams_questions
		WHERE exam_id='$id'
                AND active='1'";

        return DB::get_row($query);
    }

    public function get_howmany_questions_active($id) {
        $query = "SELECT COUNT(*) AS total
		FROM exams_questions
                WHERE exam_id='$id'
                AND active ='1'";

        return DB::get_row($query);
    }

    public function compare_answer($question_id, $answer) {
        $query = "SELECT correct_answer
                FROM exams_questions
                WHERE id='$question_id'";

        return DB::get_row($query);
    }

    //public function get_answer($question_id, $answer)
    //	{
    //		$query = "SELECT *
    //				FROM exams_questions
    //				WHERE id='$question_id'";
    //
    //		return DB::get_row($query);
    //	}

    public function record_results($pid, $exam_id, $exam_description, $result, $passfail, $version) {
        $query="INSERT INTO exams_results (pilot_id, exam_id, exam_title, result, passfail, date, exam_version)
                VALUES ('$pid', '$exam_id', '$exam_description', '$result', '$passfail', NOW(), '$version')";

        DB::query($query);
    }

    public function approve_result($id, $approve) {
        $upd = "UPDATE exams_results SET approved='$approve' WHERE id='$id'";

        DB::query($upd);
    }

    public function edit_exam($active, $id, $description, $passing, $cost) {
        $upd = "UPDATE exams SET active='$active', cost='$cost', passing='$passing', exam_description='$description' WHERE id='$id'";

        DB::query($upd);
    }

    public function get_question($id) {
        $query = "SELECT *
                FROM exams_questions
                WHERE id='$id'";

        return DB::get_row($query);
    }

    public function edit_question($id, $question, $answer_1, $answer_2, $answer_3, $answer_4, $correct_answer, $active, $new_exam) {
        $upd = "UPDATE exams_questions
                SET exam_id='$new_exam',
                        question='$question',
                        answer_1='$answer_1',
                        answer_2='$answer_2',
                        answer_3='$answer_3',
                        answer_4='$answer_4',
                        correct_answer='$correct_answer',
                        active='$active'
                        WHERE id='$id'";

        DB::query($upd);
    }

    public function increase_exam_version($id) {
        $sql = "SELECT version
            FROM exams
            WHERE id='$id'";

        $version = DB::get_row($sql);

        $ver = ($version->version + 1);

        $upd = "UPDATE exams
            SET version='$ver'
            WHERE id='$id'";

        DB::query($upd);
    }

    public function increase_exam_changed_date($id) {
        $upd = "UPDATE exams
            SET last_changed=NOW()
            WHERE id='$id'";

        DB::query($upd);
    }

    public function create_new_test($exam_description, $cost, $passing) {
        $created_by = Auth::$userinfo->pilotid;

        $query="INSERT INTO exams (exam_description, passing, cost, created_date, last_changed, created_by)
                VALUES ('$exam_description', '$passing', '$cost', NOW(), NOW(), '$created_by')";

        DB::query($query);

        $query2 = "SELECT id FROM exams WHERE exam_description='$exam_description'";

        $exam_id = DB::get_row($query2);

        $query3="INSERT INTO exams_exam_revisions (exam_id, revised_by, revision, date_revised)
                VALUES ('$exam_id->id', '$created_by', '1', NOW())";

        DB::query($query3);
    }

    public function create_new_question($exam_id, $question, $answer_1, $answer_2, $answer_3, $answer_4, $correct_answer, $active) {
        $created_by = Auth::$userinfo->pilotid;

        $query = "INSERT INTO exams_questions (exam_id, question, answer_1, answer_2, answer_3, answer_4, correct_answer, active)
		VALUES ('$exam_id', '$question', '$answer_1', '$answer_2', '$answer_3', '$answer_4', '$correct_answer', '$active')";

        DB::query($query);

        $query2="INSERT INTO exams_exam_revisions (exam_id, revised_by, revision, date_revised)
		VALUES ('$exam_id', '$created_by', '2', NOW())";

        DB::query($query2);

        $query3 = "SELECT id FROM exams_questions WHERE question='$question'";

        $question_id = DB::get_row($query3);

        $query4="INSERT INTO exams_questions_revisions (question_id, revised_by, revision, date_revised)
		VALUES ('$question_id->id', '$created_by', '2', NOW())";

        DB::query($query4);
    }

    //public function get_exam_history($pid) //not sure if i am using this anymore
    //	{
    //		$query = "SELECT *
    //				FROM exams_results
    //				WHERE pilot_id='$pid'";
    //
    //		return DB::get_results($query);
    //	}

    public function get_last_exam_revision($id) {
        $query = "SELECT *
                FROM exams_exam_revisions
                WHERE exam_id='$id'";

        return DB::get_row($query);
    }

    public function add_exam_revision($exam_id, $revised_by, $revision) {
        $query="INSERT INTO exams_exam_revisions (exam_id, revised_by, revision, date_revised)
		VALUES ('$exam_id', '$revised_by', '$revision', NOW())";

        DB::query($query);
    }

    public function get_exam_revisions($id) {
        $query = "SELECT *
                FROM exams_exam_revisions
                WHERE exam_id='$id'
                ORDER BY date_revised DESC";

        return DB::get_results($query);
    }

    public function save_new_revision($revision) {
        $created_by = Auth::$userinfo->pilotid;

        $query="INSERT INTO exams_revisions_types (revision, editable, date_created, created_by)
		VALUES ('$revision', '1', NOW(), '$created_by')";

        DB::query($query);
    }

    public function get_revision_type($id) {
        $query = "SELECT *
                FROM exams_revisions_types
                WHERE id='$id'";

        return DB::get_row($query);
    }

    public function get_revision_total() {
        $query = "SELECT COUNT(*)AS total
		FROM exams_revisions_types";

        return DB::get_row($query);
    }

    public function get_revision_reasons() {
        $query = "SELECT *
                FROM exams_revisions_types
                ORDER BY id ASC";

        return DB::get_results($query);
    }

    public function get_revision($id) {
        $query = "SELECT *
                FROM exams_revisions_types
                WHERE id='$id'";

        return DB::get_row($query);
    }

    public function edit_revision($id, $revision, $active) {
        $upd = "UPDATE exams_revisions_types
                SET revision='$revision', active='$active'
                WHERE id='$id'";

        DB::query($upd);
    }

//exam asignment functions

    public function assigned_exams()    {
        $query = "SELECT *
                FROM exams_available";
        
        return DB::get_results($query);
    }

    public function get_assigned_exams($id) {
        $query = "SELECT *
                FROM exams_available
                WHERE pilot_id='$id'";

        return DB::get_results($query);
    }

    public function check_exam_assigned($id, $exam_id) {
        $query = "SELECT COUNT(*) AS total
                FROM exams_available
                WHERE pilot_id='$id'
                AND exam_id='$exam_id'";

        return DB::get_row($query);
    }

    public function assign_exam($pilot_id, $exam_id) {
        $query = "INSERT INTO exams_available (exam_id, pilot_id)
		VALUES ('$exam_id', '$pilot_id')";

        DB::query($query);
    }

    public function unassign_exam($pilot_id, $exam_id) {
        $query = "DELETE FROM exams_available
                WHERE exam_id='$exam_id'
                AND pilot_id='$pilot_id'";

        DB::query($query);
    }

    public function delete_pilot_record($id) {
        $query = "DELETE FROM exams_results
		WHERE id='$id'";

        DB::query($query);
    }

    public function get_howmany_assigned($id) {
        $query = "SELECT COUNT(*) AS total
                FROM exams_available
                WHERE pilot_id='$id'";

        return DB::get_row($query);
    }

    public function check_exam_passed($pilot_id, $exam_id) {
        $query = "SELECT COUNT(*) AS total
                FROM exams_results
                WHERE pilot_id='$pilot_id'
                AND exam_id='$exam_id'
                AND passfail=1";

        return DB::get_row($query);
    }
}