<?php

/**
 * Data that needs to be copied in news Model Entitys
 */
class estadoModel extends model {

    var $tabPadrao = 'estado';
    var $campo_chave = 'id_estado';

    // An empty structure to create news Entitys 
    public function estrutura_vazia() {
        $dados = null;
        $dados[0]['id_estado'] = NULL;
        $dados[0]['des_estado'] = NULL;

        return $dados;
    }

    /** Retrieve the Entity */
    public function getEstado($where = null, $limit = null) {
        $select = array('*');
        return $this->read($this->tabPadrao, $select, $where, null, $limit, null, null);
    }

    /** Save a new Entity  */
    public function setEstado($array) {

        $this->startTransaction();
        $id = $this->transaction(
                $this->insert($this->tabPadrao, $array, false)
        );

        $this->commit();

        return $id;
    }

    /** Update the Entity */
    public function updEstado($array) {
        //Chave    
        $where = $this->campo_chave . " = " . $array[$this->campo_chave];
        $this->startTransaction();
        $this->transaction($this->update($this->tabPadrao, $array, $where));
        $this->commit();
        return true;
    }

    /** Remove the Entity */
    public function delEstado($array) {
        //Key 

        $where = $this->campo_chave . " = " . $array[$this->campo_chave];
        $this->startTransaction();
        $this->transaction($this->delete($this->tabPadrao, $where));
        $this->commit();
        return true;
    }

}

?>
