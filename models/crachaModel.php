<?php
/**
 * Data that needs to be copied in news Model Entitys
 */


class crachaModel extends model {

    var $tabPadrao = 'cracha';
    var $campo_chave = 'id_cracha';

    // An empty structure to create news Entitys 
    public function estrutura_vazia() {
        $dados = null;
        $dados[0]['id_cracha'] = NULL;
        $dados[0]['des_cracha'] = NULL;

        return $dados;
    }

    
    /** Retrieve the Entity */
    public function getCracha($where = null) {
        $select = array('*');
        return $this->read($this->tabPadrao, $select, $where, null, null, null, null);
    }
    
    /** Retrieve the Entity */
    public function getCrachaDepartamento($query) {
        return $this->readSQL($query);
    }

    /** Save a new Entity  */
    public function setCracha($array) {

        $this->startTransaction();
        $id = $this->transaction(
                $this->insert($this->tabPadrao, $array, false)
        );

        $this->commit();

        return $id;
    }

    /** Update the Entity */
    public function updCracha($array) {
        //Chave    
        $where = $this->campo_chave . " = " . $array[$this->campo_chave];
        $this->startTransaction();
        $this->transaction($this->update($this->tabPadrao, $array, $where));
        $this->commit();
        return true;
    }

     /** Remove the Entity */
    public function delCracha($array) {
        //Key 
        $where = $this->campo_chave . " = " . $array[$this->campo_chave];
        $this->startTransaction();
        $this->transaction($this->delete($this->tabPadrao, $where));
        $this->commit();
        return true;
    }
}

?>