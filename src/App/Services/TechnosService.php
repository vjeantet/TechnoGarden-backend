<?php

namespace App\Services;

class TechnosService extends BaseService
{

    public function findOneByCode($code)
    {
        return $this->db->fetchAssoc("SELECT * FROM techno WHERE code = ?",array($code));
    }

    function save($person)
    {
        $this->db->insert("people", $person);
        return $this->db->lastInsertId();
    }

    function update($id, $person)
    {
        return $this->db->update('people', $person, ['id' => $id]);
    }
}
