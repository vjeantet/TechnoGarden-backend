<?php

namespace App\Services;

class PeopleService extends BaseService
{

    public function getAll()
    {
        return $this->db->fetchAll("SELECT * FROM people");
    }
    
    public function findOneByUsername($username)
    {
    	return $this->db->fetchAssoc('SELECT * FROM users WHERE username = ?;',array($username)) ;
    }
    
    public function findByTeamname($name)
    {
    	$sql='SELECT *
				FROM users u 
				INNER JOIN teams t ON t.`name` = u.`teamname`
				WHERE t.`name` = ?;';
    	
     	return $this->db->fetchAll($sql,array($name)) ;
    }
    
    public function findByTechnoCode($code)
    {
    	$sql='SELECT *
				FROM users u 
				INNER JOIN `user_team` ut ON ut.`id_user` = u.`id`
				INNER JOIN `team_techno` tt ON tt.`id_team` = ut.`id_team`
				INNER JOIN techno t ON t.`id` = tt.`id_techno`
				WHERE
				t.`code` = ?;';
    	 
    	return $this->db->fetchAll($sql,array($code)) ;
    }

    function save($person)
    {
        $this->db->insert("people", $person);
        return $this->db->lastInsertId();
    }

    function update($id, $person)
    {
        return $this->db->update('people', $person, ['id' => $id]);
    }
}
