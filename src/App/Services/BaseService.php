<?php

namespace App\Services;


use Doctrine\DBAL\Connection;
class BaseService
{
/**
 * 
 * @var Connection
 */
    protected $db;

    public function __construct($db)
    {
        $this->db = $db;

    }

}
