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
<?php
if (isset($message)) {echo '<br />'; echo $message;}

echo '<br /><center>
			<table>
				<tr><td>Exam</td><td>Result</td><td>Date Scored</td></tr>';
foreach($history as $exam) {
    echo '<tr><td>'.$exam->exam_title.'</td><td>'.$exam->result.'</td><td>'.$exam->date.'</td></tr>';
}
echo '</table></center>';
?>
