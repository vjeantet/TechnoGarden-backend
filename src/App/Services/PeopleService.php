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
    
    public function findAllOrderByNameLastname()
    {
    	$sql = 'SELECT u.*,t.name as teamname
				FROM users u
				INNER JOIN teams t ON t.id = u.id_team			
				ORDER BY t.name, lastname, firstname';
    	
    	return $this->db->fetchAll($sql) ;
    }
    
    public function findByTeamname($name)
    {
    	$sql='SELECT *
				FROM users u 
				INNER JOIN teams t ON t.`id` = u.`id_team`
				WHERE t.`name` = ?;';
    	
     	return $this->db->fetchAll($sql,array($name)) ;
    }
    
    public function findByTeamId($id)
    {
    	$sql='SELECT *
				FROM users u 
				WHERE u.`id_team` = ?;';
    	
     	return $this->db->fetchAll($sql,array($id)) ;
    }
    
    public function findByTechnoCode($code)
    {
    	$sql='SELECT *
				FROM users u 
				INNER JOIN `team_techno` tt ON tt.`id_team` = u.`id_team`
				INNER JOIN techno t ON t.`id` = tt.`id_techno`
				WHERE
				t.`code` = ?;';
    	 
    	return $this->db->fetchAll($sql,array($code)) ;
    }

    public function updateDescription($id, $description){
        $userDesc = array(
            'id'   => $id,
            'description' => $description,
        );
        $types = array(
                'id' => PDO::PARAM_INT,
                'description' => PDO::PARAM_STR,
        );

        $sql = 'UPDATE users
        SET description = ?
        WHERE id = ?;';
        
        return $this->db->query($sql, $userDesc, $types);
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
