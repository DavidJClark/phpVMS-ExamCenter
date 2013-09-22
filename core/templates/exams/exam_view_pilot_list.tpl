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
    <h2>Active Pilot's</h2>
    <h4>Assign Exams - Edit Exam Records</h4>
    <table border="1" width="80%">
        <tr>
            <td>Assign Exams<br />(If enabled)</td>
            <td>Pilot</td>
            <td>Number Of Exams<br />Taken To Date</td>
            <td>Number Of Exams<br />Currently Assigned</td>
            <td>Overall Average<br />Exam Score</td>
            <td>View/Edit Records<br />Admin Use Only</td>
        </tr>
        <?php foreach ($pilots as $pilot) {
            $total =  ExamsData::get_exams_taken_total($pilot->pilotid);
            $average =  ExamsData::get_exams_average_total($pilot->pilotid, $total->total);

            if ($average == 'No Exams Taken') { ?>
        <tr>
            <td>
                        <?php
                        $assign = ExamsData::get_setting_info('5');
                        if ($assign->value == '1') {echo '<a href="'.SITE_URL.'/index.php/Exams_admin/assign_exams_pilotlist?id='.$pilot->pilotid.'">Assign Exams</a>';}
                        else {echo 'Disabled';}
                        ?>
            </td>
            <td><?php echo $pilot->firstname.' '.$pilot->lastname.' - '.(PilotData::GetPilotCode($pilot->code, $pilot->pilotid)); ?></td>
            <td><?php  echo $total->total; ?></td>
            <td><?php $total = ExamsData::get_howmany_assigned($pilot->pilotid); echo $total->total; ?></td>
            <td>0</td>
            <td>No Exam Records</td>
        </tr>
            <?php }
            else {
                ?>
        <tr>
            <td>
                        <?php
                        $assign = ExamsData::get_setting_info('5');
                        if ($assign->value == '1') {echo '<a href="'.SITE_URL.'/index.php/Exams_admin/assign_exams_pilotlist?id='.$pilot->pilotid.'">Assign Exams</a>';}
                        else {echo 'Disabled';}
                        ?>
            </td>
            <td><?php echo $pilot->firstname.' '.$pilot->lastname.' - '.(PilotData::GetPilotCode($pilot->code, $pilot->pilotid)); ?></td>
            <td><?php  echo $total->total; ?></td>
            <td><?php $total = ExamsData::get_howmany_assigned($pilot->pilotid); echo $total->total; ?></td>
            <td><?php  echo $average; ?></td>

                    <?php
                    $admin = ExamsData::check_admin(Auth::$userinfo->pilotid);
                    if ($admin->admin_level == '1') {echo '<td><a href="'.SITE_URL.'/index.php/Exams_admin/view_pilot?id='.$pilot->pilotid.'">View/Edit</a></td>'; }
                    else {echo '<td>View/Edit</td>'; }
                    ?>
        </tr>
                <?php
    }
        }
        ?>
    </table>

    <form method="link" action="<?php echo SITE_URL ?>/index.php/Exams_admin">
        <input type="submit" value="Return To Exam Admin Panel"></form>
    exam_view_pilotlist.tpl
</center>