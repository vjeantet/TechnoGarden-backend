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
		$sql = "SELECT * FROM event e
				WHERE e.team_id IN (:teamids)
				ORDER BY created_on DESC;";

		return $this->db->fetchAll($sql, array('teamids' => $team_ids), array('teamids' => Connection::PARAM_INT_ARRAY));
	}
}
