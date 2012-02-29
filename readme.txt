EXAMCenter

Developed by:
simpilot - David Clark
www.simpilotgroup.com
www.david-clark.net

Developed using phpVMS ver 1.2.778 and ie8

Released under the following license:
Creative Commons Attribution-Noncommercial-Share Alike 3.0 Unported License

Features:
2 Levels of Administration
-Administrator
-Staff Member
Exam and Question creation and editing
Optional "Assign Only" system

Installation:
1 - Download Package and place files in your phpVMS install in the proper paths
2 - Load the exam_center.sql file in your phpVMS database using phpMYAdmin or similar
3 - Place a link to the EXAMCenter in your menu ->

<a href="<?php echo url('/Exams') ?>">EXAMCenter</a>


4 - Place a link in your menu for the Admins and Staff Members of EXAMCenter ->

<?php
$admin = ExamsData::check_admin(Auth::$userinfo->pilotid);
                if ($admin->admin_level >= '1')
                {echo '<a href="'.url('/Exams_admin').'">EXAMCenter Admin</a>';}
?>


5 - Start building exams!  ;)

Some Notes:

1 - EXAMCenter Staff Members have the ability to assign & approve exams, author exams and questions, and create revision reasons.
2 - EXAMCenter Administrators have all the abilities that a staff member has plus the ability to open and close the center, add/remove staff members and admins, edit static messages for the EXAMCenter, change the assign/purchase option, and edit revision codes.
3 - The system automatically assigns the pilot with the database id of "1" as the first administrator. DO NOT un-assign this pilot as an admin unless you have at least one more admin assigned, you will not be able to log back into the center as an admin. I am still working on a check that will not let you do this but wanted to get the beta out.
4 - There are two exams already in the database to give some guidance on how things work.