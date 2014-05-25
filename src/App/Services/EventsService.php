<?php

namespace App\Services;
use Doctrine\DBAL\Connection;

class EventsService extends BaseService
{

	public function createEvent($event)
	{
		/*$values = array();
		$sql = 'INSERT INTO `event`(`id`, `type`, `author`, `title`, `content`, `created_on`, `team_name`)
				VALUES (?);';*/
		$team = $this->teamsService->findOneByName($event['team']);
		//PUSH LINK IN event_team
		$this->db->insert("event", $event);


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
