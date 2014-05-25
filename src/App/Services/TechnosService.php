<?php

namespace App\Services;
use Doctrine\DBAL\Connection;
use PDO;

class TechnosService extends BaseService
{

    public function findOneByCode($code)
    {
        return $this->db->fetchAssoc("SELECT * FROM techno WHERE code = ?",array($code));
    }
    
    public function findSeveralByCode($codes)
    {
    	return $this->db->fetchAssoc(
    			"SELECT * FROM techno WHERE code in (:codes)",
    			array('codes' => $codes), 
    			array('codes' => Connection::PARAM_STR_ARRAY));
    }
    
    public function findByTeamName($name)
    {
    	$sql = 'SELECT t.*
				FROM techno t
				INNER JOIN `team_techno` tt ON tt.`id_techno` = t.`id`
				INNER JOIN `teams` tea ON tea.`id` = tt.`id_team` 
				WHERE tea.`name` = ?; ' ;
    	
    	
    	return $this->db->fetchAll($sql,array($name)) ;
    }
    
    public function findByTeamId($id)
    {
    	$sql = 'SELECT t.*
				FROM techno t
				INNER JOIN `team_techno` tt ON tt.`id_techno` = t.`id`
				INNER JOIN `teams` tea ON tea.`id` = tt.`id_team`
				WHERE tea.`id` = ?; ' ;
    	 
    	 
    	return $this->db->fetchAll($sql,array($id)) ;
    }
	
    public function findByPeopleUserName($username)
    {
    	$sql = 'SELECT t.*
				FROM techno t
				INNER JOIN `team_techno` tt ON tt.`id_techno` = t.`id`
				INNER JOIN `teams` tea ON tea.`id` = tt.`id_team` 
				INNER JOIN users u ON u.`id_team` = tea.`id` 
				WHERE u.`username`= ?;' ;
    	 
    	 
    	return $this->db->fetchAll($sql,array($username)) ;
    }

    public function getTechnos()
    {
        return $this->db->fetchAll("SELECT * FROM techno");
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
