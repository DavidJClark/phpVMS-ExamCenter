CREATE TABLE IF NOT EXISTS `phpvms_exams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_description` text NOT NULL,
  `passing` int(3) NOT NULL DEFAULT '100',
  `cost` int(10) NOT NULL DEFAULT '0',
  `active` int(1) NOT NULL DEFAULT '0',
  `version` int(5) NOT NULL DEFAULT '1',
  `created_date` varchar(25) NOT NULL,
  `last_changed` varchar(25) NOT NULL,
  `created_by` int(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

INSERT INTO `phpvms_exams` (`id`, `exam_description`, `passing`, `cost`, `active`, `version`, `created_date`, `last_changed`, `created_by`) VALUES
(1, 'Standard Operating Procedure', 50, 10000, 1, 6, '2009-11-21 20:04:44', '2009-11-25 23:45:29', 0),
(2, 'Chief Pilot', 50, 50000, 0, 1, '2009-11-21 20:04:44', '0000-00-00', 0),
(3, 'VOR Navigation', 50, 2000, 0, 7, '2009-11-19 20:04:44', '2009-11-24 10:28:20', 0),
(5, 'Private Pilot', 50, 1000, 1, 24, '2009-09-21 20:04:44', '2009-11-25 23:53:16', 1);

CREATE TABLE IF NOT EXISTS `phpvms_exams_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pilot_id` int(5) NOT NULL,
  `admin_level` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

INSERT INTO `phpvms_exams_admin` (`id`, `pilot_id`, `admin_level`) VALUES
(1, 1, 1);

CREATE TABLE IF NOT EXISTS `phpvms_exams_available` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_id` int(11) NOT NULL,
  `pilot_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `phpvms_exams_exam_revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_id` int(5) NOT NULL,
  `revised_by` int(5) NOT NULL,
  `revision` int(5) NOT NULL,
  `date_revised` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

INSERT INTO `phpvms_exams_exam_revisions` (`id`, `exam_id`, `revised_by`, `revision`, `date_revised`) VALUES
(17, 5, 1, 1, '2009-11-25 23:53:16');

CREATE TABLE IF NOT EXISTS `phpvms_exams_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_id` int(5) NOT NULL,
  `question` text NOT NULL,
  `answer_1` text NOT NULL,
  `answer_2` text NOT NULL,
  `answer_3` text NOT NULL,
  `answer_4` text NOT NULL,
  `correct_answer` int(1) NOT NULL,
  `active` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

INSERT INTO `phpvms_exams_questions` (`id`, `exam_id`, `question`, `answer_1`, `answer_2`, `answer_3`, `answer_4`, `correct_answer`, `active`) VALUES
(1, 1, 'What color do you think the background is?', 'Red', 'Blue', 'Black', 'White', 4, 1),
(2, 1, 'What color do you think the text color is?', 'Red', 'Red', 'Black', 'Red', 3, 1),
(20, 5, 'What is the purpose of the rudder on an airplane?\r\n', 'To control roll. ', 'To control yaw. ', 'To control overbanking tendency. ', 'All of the above.', 2, 1),
(16, 5, 'No person may operate an aircraft in acrobatic flight when the flight visibility is less than\r\n', '3 miles', '5 miles', '7 miles', '9 miles', 1, 1),
(15, 5, 'The danger of spatial disorientation during flight in poor visual conditions may be reduced by\r\n', 'shifting the eyes quickly between the exterior visual field and the instrument panel.', 'leaning the body in the opposite direction of the motion of the aircraft. ', 'having faith in the instruments rather than taking a chance on the sensory organs.', 'All of the above', 3, 1),
(17, 5, 'When operating under VFR below 18,000 feet MSL, unless otherwise authorized, what transponder code should be selected?\r\n', '7700', '1200', '7600', 'You should not transmit a transponder code when you are VFR.', 2, 1),
(19, 5, 'With respect to the certification of aircraft, which is a category of aircraft?\r\n', 'Landplane, seaplane', 'Airplane, rotorcraft, glider.', 'Normal, utility, acrobatic.', 'Winged', 3, 1),
(18, 5, 'The responsibility for ensuring that maintenance personnel make the appropriate entries in the aircraft maintenance records indicating the aircraft has been approved for return to service lies with the\r\n', 'mechanic who performed the work', 'owner or operator.', 'Pilot-in-command. ', 'None of the above.', 2, 1),
(21, 5, 'No person may use an ATC transponder unless it has been tested and inspected within at least the preceding\r\n', '6 calendar months.', '24 calendar months.', '12 calendar months.', '18 calendar months.', 2, 1),
(22, 5, 'What often leads to spatial disorientation or collision with ground/obstacles when flying under Visual Flight Rules (VFR)?\r\n', 'Getting behind the aircraft. ', 'Duck-under syndrome. ', 'Continual flight into instrument conditions. ', 'None of the above.', 3, 1),
(23, 5, 'The amount of water vapor which air can hold depends on the\r\n', 'dewpoint.', 'air temperature. ', 'stability of the air. ', 'All of the above.', 2, 1),
(24, 5, 'Who is primarily responsible for maintaining an aircraft in airworthy condition?\r\n', 'Mechanic.', 'Owner or operator. ', 'Pilot-in-command. ', 'Airport personnel.', 2, 1);

CREATE TABLE IF NOT EXISTS `phpvms_exams_questions_revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(5) NOT NULL,
  `revised_by` int(5) NOT NULL,
  `revision` int(5) NOT NULL,
  `date_revised` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

INSERT INTO `phpvms_exams_questions_revisions` (`id`, `question_id`, `revised_by`, `revision`, `date_revised`) VALUES
(1, 29, 1, 2, '2009-11-22 00:53:06');

CREATE TABLE IF NOT EXISTS `phpvms_exams_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pilot_id` int(4) NOT NULL,
  `exam_id` int(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `phpvms_exams_results` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pilot_id` int(5) NOT NULL,
  `exam_id` int(5) NOT NULL,
  `exam_title` text NOT NULL,
  `exam_version` int(5) NOT NULL,
  `result` int(3) NOT NULL,
  `passfail` int(1) NOT NULL DEFAULT '0',
  `date` date NOT NULL DEFAULT '0000-00-00',
  `approved` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `phpvms_exams_results_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `result_id` int(5) NOT NULL,
  `question` varchar(250) NOT NULL,
  `answer_1` varchar(250) NOT NULL,
  `answer_2` varchar(250) NOT NULL,
  `answer_3` varchar(250) NOT NULL,
  `answer_4` varchar(250) NOT NULL,
  `pilot_answer` int(1) NOT NULL,
  `cor_answer` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `phpvms_exams_revisions_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `revision` varchar(250) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  `editable` int(1) NOT NULL DEFAULT '0',
  `date_created` varchar(25) NOT NULL,
  `created_by` int(5) NOT NULL,
  `active` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

INSERT INTO `phpvms_exams_revisions_types` (`id`, `revision`, `deleted`, `editable`, `date_created`, `created_by`, `active`) VALUES
(1, 'Created New Exam', 0, 0, '', 0, 1),
(2, 'Created New Question', 0, 0, '', 0, 1),
(3, 'Unknown', 0, 0, '', 0, 1),
(4, 'Assigned Question To Exam', 0, 0, '', 0, 0),
(5, 'Unassigned Question From Exam', 0, 0, '', 0, 0),
(6, 'Activated Question On Exam', 0, 0, '', 0, 1),
(7, 'Deactivated Question On Exam', 0, 0, '', 0, 1);

CREATE TABLE IF NOT EXISTS `phpvms_exams_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `setting` varchar(50) NOT NULL,
  `value` varchar(150) NOT NULL,
  `setting_type` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

INSERT INTO `phpvms_exams_settings` (`id`, `setting`, `value`, `setting_type`) VALUES
(1, 'Global Exam Passing Grade Percentage', '85', 0),
(2, 'EXAMCenter Availibility', '1', 2),
(3, 'EXAMCenter Closed Message', 'Sorry but the EXAMCenter Is Currently Closed (Edit this message in the EXAMCenter Admin panel)', 1),
(4, 'EXAMCenter Welcome Message', 'EXAMCenter Welcome Message (Edit this message in the EXAMCenter Admin Panel)', 1),
(5, 'EXAMCenter Admin Dispatch Exams', '1', 2);