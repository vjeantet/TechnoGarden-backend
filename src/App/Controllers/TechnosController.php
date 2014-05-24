<?php

namespace App\Controllers;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use App\Services\TechnosService;


class TechnosController
{

	/**
	 * 
	 * @var TechnosService
	 */
    protected $technosService;

    public function __construct($service)
    {
        $this->technosService = $service;
    }

	public function findOneByCode($code)
	{
		$techno = $this->technosService->findOneByCode($code) ;
		return new JsonResponse($techno) ;
	}
    
    public function save(Request $request)
    {

        $person = $this->getDataFromRequest($request);
        return new JsonResponse(array("id" => $this->technosService->save($person)));

    }

    public function update($id, Request $request)
    {
        $note = $this->getDataFromRequest($request);
        $this->technosService->update($id, $note);
        return new JsonResponse($note);

    }

    public function delete($id)
    {

        return new JsonResponse($this->technosService->delete($id));

    }

    public function getDataFromRequest(Request $request)
    {
        return array(
            "note" => $request->request->get("person")
        );
    }
}
