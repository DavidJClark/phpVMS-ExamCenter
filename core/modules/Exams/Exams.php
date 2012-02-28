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

class Exams extends CodonModule {
    public function index() {
        if(!Auth::LoggedIn()) {
            Template::Set('message', '<div id="error"><b>You must be logged in to access this feature!</b></div><br />');
            Template::Show('frontpage_main.tpl');
            return;
        }
        else {
            $open = ExamsData::get_setting_info('2');
            if ($open->value == '0') {
                $message = ExamsData::get_setting_info('3');
                echo '<div id="error">'.$message->value.'</div>';
            }
            else {
                $pid = Auth::$userinfo->pilotid;
                $message = ExamsData::get_setting_info('4');
                Template::Set('message', '<h4>'.$message->value.'</h4>');
                Template::Set('exams', ExamsData::get_exams());
                Template::Set('pilotmoney', Auth::$userinfo->totalpay);//use Autn class!
                Template::Show('exam_list.tpl');
            }
        }
    }

    public function request_exam()  {
        $id = $_GET['id'];
        $pilot_id = Auth::$userinfo->pilotid;

        ExamsData::request_exam($pilot_id, $id);

        $pid = Auth::$userinfo->pilotid;
        $message = ExamsData::get_setting_info('4');
        Template::Set('message', '<h4>'.$message->value.'</h4>');
        Template::Set('exams', ExamsData::get_exams());
        Template::Set('pilotmoney', Auth::$userinfo->totalpay);//use Autn class!
        Template::Show('exam_list.tpl');
    }

    public function buy_exam() {
        $id = $_GET['id'];
        $pid = Auth::$userinfo->pilotid;

        $examcost = ExamsData::buy_exam($id);
        $pilotmoney = AUTH::$userinfo->totalpay;

        if ($examcost->cost > $pilotmoney) {
            Template::Set('message', '<div id="error"><b>You do not have enough funds in your company account to purchase the '.$examcost->exam_description.' exam!</b></div>');
            Template::Set('exams', ExamsData::get_exams());
            Template::Set('pilotmoney', $pilotmoney);
            Template::Show('exam_list.tpl');
        }
        else {
            Template::Set('examdescription', $examcost->exam_description);
            Template::Set('examid', $examcost->id);
            Template::Set('examcost', $examcost->cost);
            Template::Set('pilotmoney', $pilotmoney);
            Template::Show('exam_purchase_confirm.tpl');
        }
    }
    public function purchase_exam() {
        $exam_id = $_GET['id'];

        $exam = ExamsData::get_exam($exam_id);

        $pid = Auth::$userinfo->pilotid;

        Template::Set('pilotpay', ExamsData::pay_for_exam($pid, $exam_id));
        Template::Set('questions', $exam);
        Template::Set('title', ExamsData::get_exam_title($exam_id));
        Template::Set('howmany_questions', ExamsData::get_howmany_questions($exam_id));
        Template::Show('exam.tpl');
    }
    public function grade_exam() {
        $exam_id = DB::escape($this->post->exam_id);
        $howmany = DB::escape($this->post->howmany);
        $exam_description = DB::escape($this->post->exam_description);
        $passing = DB::escape($this->post->passing);
        $version = DB::escape($this->post->version);
        $i=1;
        $correct=0;
        Template::Set('title', $exam_description);
        Template::Show('exam_question_result_header.tpl');
        while ($i<= $howmany):

            $id = 'question_id' . $i;
            $question_id = DB::escape($this->post->$id);
            $id2 = 'question' . $i;
            $answer = DB::escape($this->post->$id2);

            $cor = ExamsData::compare_answer($question_id, $answer);
            if ($cor->correct_answer == $answer) {
                Template::ClearVars($wrong);
                $question = ExamsData::get_question($question_id);
                Template::Set('question', $question->question );
                if ($question->correct_answer == '1') {Template::Set('answer', $question->answer_1 );}
                elseif ($question->correct_answer == '2') {Template::Set('answer', $question->answer_2 );}
                elseif ($question->correct_answer == '3') {Template::Set('answer', $question->answer_3 );}
                elseif ($question->correct_answer == '4') {Template::Set('answer', $question->answer_4 );}
                Template::Set('number', $i);
                Template::Set('div', 'success');
                Template::Show('exam_question_result.tpl');
                $correct++;
            }
            else {
                $question = ExamsData::get_question($question_id);
                Template::Set('question', $question->question );
                if ($question->correct_answer == '1') {Template::Set('answer', $question->answer_1 );}
                elseif ($question->correct_answer == '2') {Template::Set('answer', $question->answer_2 );}
                elseif ($question->correct_answer == '3') {Template::Set('answer', $question->answer_3 );}
                elseif ($question->correct_answer == '4') {Template::Set('answer', $question->answer_4 );}

                if ($answer == '1') {Template::Set('wrong', $question->answer_1 );}
                elseif ($answer == '2') {Template::Set('wrong', $question->answer_2 );}
                elseif ($answer == '3') {Template::Set('wrong', $question->answer_3 );}
                elseif ($answer == '4') {Template::Set('wrong', $question->answer_4 );}
                Template::Set('number', $i);
                Template::Set('div', 'error');
                Template::Show('exam_question_result.tpl');
            }
            $i++;
        endwhile;
        $result = round((($correct / $howmany) * 100), 0);
        if ($result >= $passing) {
            $passfail = 1;
        }
        else {
            $passfail = 0;
        }

        $pid = Auth::$userinfo->pilotid;

        $approve = ExamsData::get_setting_info('5');
        if ($approve->value == '1'); {ExamsData::unassign_exam($pid, $exam_id);}
        ExamsData::record_results($pid, $exam_id, $exam_description, $result, $passfail, $version);

        if ($result >= $passing) {
            echo '<tr><td colspan="2"><br /><h4>You Passed With A '.$result.'% On The Exam.</h4></td></tr>';
        }
        else {
            echo '<tr><td colspan="2"><br /><h4>You Did Not Pass The Exam.<br /> A '.$passing.'% Is Required To Pass The Exam.<br />You Scored '.$result.'%</h4></td></tr>';
        }
        echo '</table><br />';
        echo '<form method="link" action="'.SITE_URL.'/index.php/Exams/view_profile">';
        echo '<input type="submit" value="Return To Exam Center"></form>';
    }

    public function view_profile() {
        $id = Auth::$userinfo->pilotid;

        Template::Set('pilotdata', ExamsData::get_pilot_data($id));
        Template::Show('exam_view_profile.tpl');
    }
}