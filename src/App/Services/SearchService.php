<?php

namespace App\Services;

class SearchService extends BaseService
{
	public function findTechnosTeamsPeopleByTerm($term)
	{
		// Compute teams
		$sql = 'SELECT distinct t.* 
				FROM teams t 
				LEFT JOIN team_techno tt ON tt.`id_team` = t.`id`
				LEFT JOIN techno tek ON tek.`id` = tt.`id_techno` 
				WHERE t.`name` like ?
				OR
									( tek.`code` like ? OR tek.`label` like ? OR tek.`type` like ? OR tek.`description` like ?)
				
				LIMIT 5' ;
		
		$team_list_tmp = $this->db->fetchAll($sql,array('%'.$term.'%','%'.$term.'%','%'.$term.'%','%'.$term.'%','%'.$term.'%')) ;
		
		// Compute teams technos
		$sql = 'SELECT t.*
				FROM techno t
				INNER JOIN team_techno tt ON tt.`id_team` = ? AND tt.`id_techno` = t.`id` ;
    			';
		
		$team_list = array() ;
		$team_ids = array();
		
		foreach($team_list_tmp as $k => $team)
		{
			unset($k) ;
			$team_techno_list = $this->db->fetchAll($sql,array($team['id'])) ;
			$team['technos'] = $team_techno_list ;
			$team_list[] = $team ;
			$team_ids[] = $team['id'];
		}
		
		// Compute technos
		$sql = 'SELECT t.* FROM techno t 
				WHERE 
				t.`description` like ?
				OR t.`code` like  ?
				OR t.`label` like ?
				OR t.`type` like ?
				LIMIT 5		' ;
		$techno_list = $this->db->fetchAll($sql,array('%'.$term.'%','%'.$term.'%','%'.$term.'%','%'.$term.'%')) ;
		
		// Compute events
		$eventsService = new EventsService($this->db);
		$events_list = $eventsService->getProximityEvents($team_ids);

		// Compute persons
		$sql = 'SELECT distinct u.*
				FROM users u
				LEFT JOIN team_techno tt ON tt.`id_team` = u.`id_team`
				LEFT JOIN techno tek ON tek.`id` = tt.`id_techno`
		
				WHERE
		
				( tek.`code` like ? OR tek.`label` like ? OR tek.`type` like ? OR tek.`description` like ?)
		
				LIMIT 7';
		
		$person_list = $this->db->fetchAll($sql,array('%'.$term.'%','%'.$term.'%','%'.$term.'%','%'.$term.'%')) ;
		
		
		return array(
			'teams' 	=> $team_list,
			'technos' 	=> $techno_list,
			'events' 	=> $events_list,
			'people'	=> $person_list
		) ;
	}
}
