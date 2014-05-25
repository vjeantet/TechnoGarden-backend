<?php

namespace App\Controllers;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use App\Services\searchService;


class SearchController
{
	/**
	 * 	
	 * @var searchService
	 */
    protected $searchService;

    public function __construct($service)
    {
        $this->searchService = $service;
    }


    
    public function findTechnosTeamsPeopleByTerm(Request $request)
    {
    	$term = trim($request->get('q')) ;
    	
    	return new JsonResponse($this->searchService->findTechnosTeamsPeopleByTerm($term));
    }
    

}
