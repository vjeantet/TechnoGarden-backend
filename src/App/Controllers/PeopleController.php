<?php

namespace App\Controllers;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use App\Services\PeopleService;


class PeopleController
{

	/**
	 * 
	 * @var PeopleService
	 */
    protected $peopleService;

    public function __construct($service)
    {
        $this->peopleService = $service;
    }
    
    public function findAllOrderByNameLastname()
    {
    	$person = $this->peopleService->findAllOrderByNameLastname() ;
    
    	return new JsonResponse($person);
    }
    
    public function findOneByUsername($username)
    {
    	$person = $this->peopleService->findOneByUsername($username) ;

    	return new JsonResponse($person);
    }
	public function findByTeamId($id)
	{
		$person_list = $this->peopleService->findByTeamId($id) ;
		 
		return new JsonResponse($person_list);
	}
	
    public function findByTeamName($name)
    {
    	$person_list = $this->peopleService->findByTeamname($name) ;
    	
    	return new JsonResponse($person_list);
    }
    
    /**
     * @todo inclure les technos utilisés par les users dans une équipe
     * 
     * @param string $code
     * @return \Symfony\Component\HttpFoundation\JsonResponse
     */
    public function findByTechnoCode($code)
    {
    	$person_list = $this->peopleService->findByTechnoCode($code) ;
    	
    	return new JsonResponse($person_list);
    }
    
    public function save(Request $request)
    {

        $person = $this->getDataFromRequest($request);
        return new JsonResponse(array("id" => $this->peopleService->save($person)));

    }

    public function update($id, Request $request)
    {
        $note = $this->getDataFromRequest($request);
        $this->peopleService->update($id, $note);
        return new JsonResponse($note);

    }

    public function delete($id)
    {

        return new JsonResponse($this->peopleService->delete($id));

    }

    public function getDataFromRequest(Request $request)
    {
        return array(
            "note" => $request->request->get("person")
        );
    }
}
