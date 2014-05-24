<?php

namespace App\Services;

class SearchService extends BaseService
{
	public function findTechnosTeamsPeopleByTerm($term)
	{

		$sql = 'SELECT t.* FROM teams t WHERE t.`name` like ? LIMIT 5' ;
		$team_list_tmp = $this->db->fetchAll($sql,array('%'.$term.'%')) ;
		
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
		
		$sql = 'SELECT u.* FROM users u
				WHERE
				u.`description` like ?
				OR u.`firstname` like ?
				OR u.`username` like ?
				OR u.`twittername` like ? LIMIT 5;';
		
		$person_list = $this->db->fetchAll($sql,array('%'.$term.'%','%'.$term.'%','%'.$term.'%','%'.$term.'%')) ;
		
		return array(
			'teams' 	=> $team_list,
			'technos' 	=> $techno_list,
			'people' 	=> $person_list,
		) ;
	}
}
