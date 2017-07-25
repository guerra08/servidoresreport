  
/*Query para resultar nos servidores que fazem parte de um curso / servidores que concluiram um curso*/

/*Concluintes de vários cursos*/

		SELECT 	u.firstname,
		u.lastname,
		c.shortname,
        cc.timecompleted,
        cc.course,
        cc.userid
        FROM {course_completions} cc, {groups} g, {groups_members} gm
        INNER JOIN {course} c ON c.id = cc.course
        INNER JOIN {user} u ON u.id = cc.userid
        WHERE cc.timecompleted between $startdate and $enddate AND g.name = 'Servidor do IFRS' 
		AND g.id = gm.groupid AND u.id = gm.userid
        ORDER BY c.shortname, u.firstname
;

/*Concluintes de um curso específico*/

		SELECT cc.userid, u.firstname, u.lastname, cc.timecompleted
		FROM {user} u, {course_completions} cc, {groups} g, {groups_members} gm
		WHERE cc.timecompleted between $startdate and $enddate
		AND cc.course = '".$id."'
		AND u.id = cc.userid
		AND g.name = 'Servidor do IFRS'
		AND g.id = gm.groupid
		AND u.id = gm.userid
		ORDER BY u.firstname, u.lastname
