<?php
/**
 * Data that needs to be copied in news Model Entitys
 */


class cidadeModel extends model {

    var $tabPadrao = 'cidade';
    var $campo_chave = 'id_cidade';

    // An empty structure to create news Entitys 
    public function estrutura_vazia() {
        $dados = null;
        $dados[0]['id_cidade'] = NULL;
        $dados[0]['des_cidade'] = NULL;

        return $dados;
    }

    
    /** Retrieve the Entity */
    public function getCidade($where = null, $limit = null) {
        $select = array('*');
        return $this->read($this->tabPadrao, $select, $where, null, $limit, null, null);
    }
    
    /** Retrieve the Entity */
    public function getCidadeEstado($query) {
        return $this->readSQL($query);
    }

    /** Save a new Entity  */
    public function setCidade($array) {

        $this->startTransaction();
        $id = $this->transaction(
                $this->insert($this->tabPadrao, $array, false)
        );

        $this->commit();

        return $id;
    }

    /** Update the Entity */
    public function updCidade($array) {
        //Chave    
        $where = $this->campo_chave . " = " . $array[$this->campo_chave];
        $this->startTransaction();
        $this->transaction($this->update($this->tabPadrao, $array, $where));
        $this->commit();
        return true;
    }

     /** Remove the Entity */
    public function delCidade($array) {
        //Key 
        $where = $this->campo_chave . " = " . $array[$this->campo_chave];
        $this->startTransaction();
        $this->transaction($this->delete($this->tabPadrao, $where));
        $this->commit();
        return true;
    }
}

?>
