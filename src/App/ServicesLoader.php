<?php

namespace App;

use Silex\Application;

class ServicesLoader
{
    protected $app;

    public function __construct(Application $app)
    {
        $this->app = $app;
    }

    public function bindServicesIntoContainer()
    {
        $this->app['people.service'] = $this->app->share(function () {
            return new Services\PeopleService($this->app["db"]);
        });
        
        $this->app['teams.service'] = $this->app->share(function () {
        	return new Services\TeamsService($this->app["db"]);
        });
        
    	$this->app['technos.service'] = $this->app->share(function () {
      		return new Services\TechnosService($this->app["db"]);
       	});
    	
    	$this->app['search.service'] = $this->app->share(function () {
    		return new Services\SearchService($this->app["db"]);
    	});
    }
}

