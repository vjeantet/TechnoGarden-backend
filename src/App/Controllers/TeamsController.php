<?php

namespace App\Controllers;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use App\Services\TeamsService;


class TeamsController
{
	/**
	 * 	
	 * @var TeamsService
	 */
    protected $teamsService;

    public function __construct($service)
    {
        $this->teamsService = $service;
    }


    
    public function findOneByName($name)
    {
    	return new JsonResponse($this->teamsService->findOneByName($name));
    }
    
    public function findOneById($id)
    {
    	return new JsonResponse($this->teamsService->findOneById($id));
    }
    
    public function findByTechnoCode($code)
    {
    	return new JsonResponse($this->teamsService->findByTechnoCode($code));
    }
    
    /**
     * Retourne la liste des equipes proches d'une premiere equipe
     * @param string $name
     * @return \Symfony\Component\HttpFoundation\JsonResponse
     */
    public function findByProximityById($teamid)
    {
    	return new JsonResponse($this->teamsService->findProximitiesById($teamid));
    }
    
    
    
    public function addTechnoByTechnoId($id, Request $request)
    {
    	$techno_id = $request->get('techno_id');
    	$level_usage = $request->get('level_usage');
    	
    	return new JsonResponse($this->teamsService->insertTechnoByTechnoId($id, $techno_id,$level_usage)) ;
    }
    
	public function addTechnoByTechnoId2($id, $techno_id, Request $request)
    {
    	$level_usage = $request->get('level_usage');
    	return new JsonResponse($this->teamsService->insertTechnoByTechnoId($id, $techno_id,$level_usage)) ;
    }
    
    public function removeTechnoByTechnoId($id,$techno_id)
    {
    	return new JsonResponse($this->teamsService->deleteTeamTechnoByTechnoId($id,$techno_id));
    }
    
    public function save(Request $request)
    {

        $person = $this->getDataFromRequest($request);
        return new JsonResponse(array("id" => $this->teamsService->save($person)));

    }

    public function update($id, Request $request)
    {
        $note = $this->getDataFromRequest($request);
        $this->teamsService->update($id, $note);
        return new JsonResponse($note);

    }

    public function delete($id)
    {

        return new JsonResponse($this->teamsService->delete($id));

    }

    public function getDataFromRequest(Request $request)
    {
        return array(
            "note" => $request->request->get("person")
        );
    }
}
