<?php

namespace Tests\Services;
use Silex\Application;
use Silex\Provider\DoctrineServiceProvider;
use App\Services\TeamsService;


class TeamsServiceTest extends \PHPUnit_Framework_TestCase
{

    private $teamsService;

    public function setUp()
    {
        $app = new Application();
        $app->register(new DoctrineServiceProvider(), array(
            "db.options" => array(
		        'driver'    => 'pdo_mysql',
		        'host'      => '10.12.9.2',
		        'dbname'    => 'technogarden',
		        'user'      => 'technogarden',
		        'password'  => 'technogarden',
		        'charset'   => 'utf8',
            ),
        ));
        $this->teamsService = new TeamsService($app["db"]);

        //@todo initialiser les tables avec des données
        // Exemple
        //$stmt = $app["db"]->prepare("CREATE TABLE ....");
        //$stmt->execute();
    }

    public function testFindOneByName()
    {
        $data = $this->teamsService->findOneByName('Techno Garden');
        $this->assertNotNull($data);
    }



}
