<?php

namespace App\Services;

class TeamsService extends BaseService
{

    public function getAll()
    {
        return $this->db->fetchAll("SELECT * FROM people");
    }
    
    public function findOneByName($name)
    {
    	$team = $this->db->fetchAssoc('SELECT * FROM teams WHERE name = ?;',array($name)) ;
    	$sql = 'SELECT t.*
				FROM techno t 
				INNER JOIN team_techno tt ON tt.`id_team` = ? AND tt.`id_techno` = t.`id` ;
    			';
    	
    	$team_techno_list = $this->db->fetchAll($sql,array($team['id'])) ;
    	$team['technos'] = $team_techno_list ;
    	
    	return $team ;
    }

    public function findByTechnoCode($code)
    {
    	$sql = 'SELECT *
					FROM teams t
					INNER JOIN `team_techno` tt ON tt.`id_team` = t.`id`
					INNER JOIN `techno` tek ON tek.`id` = tt.`id_techno`
					WHERE tek.`code` = ?;' ;
    	
    	return $this->db->fetchAll($sql,array($code)) ;	
    }
    
    /**
     * retourne les teams proches d'une team donnée par son nom
     * @param string $name
     * @return array of teams
     */
    public function findProximitiesByName($name)
    {
    	//@todo algo SQL en cours de redaction par Thomas
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
