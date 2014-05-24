<?php

namespace App;

use Silex\Application;

class RoutesLoader
{
    private $app;

    public function __construct(Application $app)
    {
        $this->app = $app;
        $this->instantiateControllers();

    }

    private function instantiateControllers()
    {
        //PEOPLE 
    	$this->app['people.controller'] = $this->app->share(function () {
            return new Controllers\PeopleController($this->app['people.service']);
        });
    	
    	//TEAMS
        $this->app['teams.controller'] = $this->app->share(function () {
      		return new Controllers\TeamsController($this->app['teams.service']);
       	});
        
        //TECHNOS 
       	$this->app['technos.controller'] = $this->app->share(function () {
       		return new Controllers\TechnosController($this->app['technos.service']);
       	});
    }

    public function bindRoutesToControllers()
    {
        $api = $this->app["controllers_factory"];

        /**
         * PEOPLE
         */
        // rechercher personne by username
        $api->get('/people/{username}'			, "people.controller:findOneByUsername");
        // rechercher les personnes d'une team particuliere
        $api->get('/teams/{name}/people'	, "people.controller:findByTeamName");        
        // rechercher les personnes associées à une techno
        $api->get('/technos/{code}/people'		, "people.controller:findByTechnoCode");
        
        /**
         * TEAMS
         */
        // rechercher une team par son nom
        $api->get('/teams/{name}'			, "teams.controller:findOneByName");
        // rechercher les equipes associées à une techno
        $api->get('/technos/{code}/teams'		, "teams.controller:findByTechnoCode");
        // recherche les equipes proches d'une autre equipe
        $api->get('/teams/{name}/proximity/teams', "teams.controller:findByProximityByName") ;
                
        /**
         * TECHNO - ASSETS
         */
        // rechercher une techno par son nom
        $api->get('/technos/{code}'				, "technos.controller:findOneByCode");
        // rechercher les technos d'une team particuliere
        $api->get('/teams/{name}/technos'	, "technos.controller:findByTeamName");
        // rechercher les technos d'une personne particuliere
        $api->get('/people/{username}/technos'	, "technos.controller:findByPeopleUsername");  
        // recherche les technos d'une équipe utilisé par un de ses membres.
        $api->get('/teams/{name}/peoples/{username}/technos'	, "technos.controller:findByTeamByUsername");
        
        
/*
        $api->post('/notes', "notes.controller:save");
        $api->post('/notes/{id}', "notes.controller:update");
        $api->delete('/notes/{id}', "notes.controller:delete");
*/
        $this->app->mount($this->app["api.endpoint"].'/'.$this->app["api.version"], $api);
    }
}

