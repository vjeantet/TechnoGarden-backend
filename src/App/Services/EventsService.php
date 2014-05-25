<?php

namespace App\Services;
use Doctrine\DBAL\Connection;
use PDO;

class EventsService extends BaseService
{

	public function createEvent($event, $technos)
	{
		$data = array(
				'user_id' => $event['user_id'],
				'content' => $event['content'],
				'team_id' => $event['team_id']
		);
		$types = array(
				'user_id' => PDO::PARAM_INT,
				'content' => PDO::PARAM_STR,
				'team_id' => PDO::PARAM_INT
		);
		$this->db->insert("event", $data, $types);
		$eventId =  $this->db->lastInsertId();
		
		foreach($technos as $techno)
		{
			$this->db->insert(
					"event_techno",
					array('id_event' => $eventId, 'id_techno' => $techno['id']),
					array('id_event' => PDO::PARAM_INT, 'id_techno' => PDO::PARAM_INT));
		}
		return true;		
	}

	function deleteEvents()
	{
		$this->db->executeQuery("DELETE FROM event_techno");
		$this->db->executeQuery("DELETE FROM event_team");
		$this->db->executeQuery("DELETE FROM event");
		return 1;
	}
	
	function getEvents($teamname)
	{
		return $this->db->fetchAll("SELECT * FROM events WHERE team = ?;", array($teamname));
	}

	public function getProximityEvents($team_ids)
	{
		$sql = "SELECT e.*, TRIM(CONCAT(u.firstname,' ',u.`lastname`)) as 'author'
		FROM event e
		INNER JOIN users u ON u.`id` = e.user_id
		WHERE e.team_id IN (:teamids)
		ORDER BY created_on DESC;";
		$event_list_tmp = $this->db->fetchAll($sql, array('teamids' => $team_ids), array('teamids' => Connection::PARAM_INT_ARRAY)) ;
		
		$event_list = array() ;
		foreach ($event_list_tmp as $k => $event)
		{
			unset($k) ;
			$event['technos'] = $this->db->fetchAll('SELECT t.* FROM techno t INNER JOIN event_techno et ON et.id_techno = t.id AND et.id_event = ? ',array($event['id']))	;
			$event_list[] = $event ;
		}

		return $event_list;
	}
}
