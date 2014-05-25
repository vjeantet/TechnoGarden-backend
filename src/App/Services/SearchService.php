<?php

namespace App\Services;

class SearchService extends BaseService
{
	public function findTechnosTeamsPeopleByTerm($term)
	{

		$sql = 'SELECT t.* 
				FROM teams t 
				LEFT JOIN team_techno tt ON tt.`id_team` = t.`id`
				LEFT JOIN techno tek ON tek.`id` = tt.`id_techno` 
				WHERE t.`name` like ?
				OR
									( tek.`code` like ? OR tek.`label` like ? OR tek.`type` like ? OR tek.`description` like ?)
				
				LIMIT 5' ;
		
		$team_list_tmp = $this->db->fetchAll($sql,array('%'.$term.'%','%'.$term.'%','%'.$term.'%','%'.$term.'%','%'.$term.'%')) ;
		
		$sql = 'SELECT t.*
				FROM techno t
				INNER JOIN team_techno tt ON tt.`id_team` = ? AND tt.`id_techno` = t.`id` ;
    			';
		
		$team_list = array() ;
		foreach($team_list_tmp as $k => $team)
		{
			unset($k) ;
			$team_techno_list = $this->db->fetchAll($sql,array($team['id'])) ;
			$team['technos'] = $team_techno_list ;
			$team_list[] = $team ;
		}
		

		$sql = 'SELECT t.* FROM techno t 
				WHERE 
				t.`description` like ?
				OR t.`code` like  ?
				OR t.`label` like ?
				OR t.`type` like ?
				LIMIT 5		' ;
		$techno_list = $this->db->fetchAll($sql,array('%'.$term.'%','%'.$term.'%','%'.$term.'%','%'.$term.'%')) ;
		
		$sql = 'SELECT distinct u.*, t.name as teamname 
				FROM users u 
				LEFT JOIN teams t ON t.id = u.id_team
				LEFT JOIN team_techno tt ON tt.`id_team` = u.`id_team`
				LEFT JOIN techno tek ON tek.`id` = tt.`id_techno` 
				
				WHERE
								
				( tek.`code` like ? OR tek.`label` like ? OR tek.`type` like ? OR tek.`description` like ?)
				
				LIMIT 5';
		
		$person_list = $this->db->fetchAll($sql,array('%'.$term.'%','%'.$term.'%','%'.$term.'%','%'.$term.'%')) ;
		
		return array(
			'teams' 	=> $team_list,
			'technos' 	=> $techno_list,
			'people' 	=> $person_list,
		) ;
	}
}
