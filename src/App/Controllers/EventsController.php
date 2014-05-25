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
     * @var TechnosService
     */
    protected $technosService;
    
    /**
     * 
     * @var TeamsService
     */
    protected $teamsService;

    public function __construct($eventsService, $teamsService, $technosService)
    {
        $this->eventsService = $eventsService;
        $this->teamsService = $teamsService;
        $this->technosService = $technosService;
    }

    public function deleteEvents()
    {
    	return new JsonResponse($this->eventsService->deleteEvents());
    }    
    
    public function createEvent(Request $request)
    {
		$event = $request->get('event');
		$technos = $this->technosService->findSeveralByCode($event['technos']);
		return new JsonResponse($this->eventsService->createEvent($event, $technos));
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
