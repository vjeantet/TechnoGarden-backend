<?php

namespace App\Controllers;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use App\Services\EventsService;
use App\Services\TeamsService;


class EventsController
{

	/**
	 * 
	 * @var EventsService
	 */
    protected $eventsService;
    /**
     * 
     * @var TeamsService
     */
    protected $teamsService;

    public function __construct($eventsService, $teamsService)
    {
        $this->eventsService = $eventsService;
        $this->teamsService = $teamsService;
    }

    public function createEvent()
    {

    }


    /**
     * Retourne la liste des evenements qui sont lié à l'equipe passée en param
     * @param string $teamname
     * @return \Symfony\Component\HttpFoundation\JsonResponse
     */
    public function getEvents($teamid)
    {
        $nearTeams = $this->teamsService->findProximitiesById($teamid);
        $nearTeamIds = array();
        foreach ($nearTeams as $team){
            $nearTeamIds[] = $team['id'];
        }
        $nearTeamIds[] = $teamid;
        return new JsonResponse($this->eventsService->getProximityEvents($nearTeamIds));
    }

}
