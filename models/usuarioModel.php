<?php

/**
 * Data that needs to be copied in news Model Entitys
 */
class usuarioModel extends model {

    var $tabPadrao = 'usuario';
    var $campo_chave = 'id_usuario';

    // An empty structure to create news Entitys 
    public function estrutura_vazia() {
        $dados = null;
        $dados[0]['id_usuario'] = NULL;
        $dados[0]['nome_usuario'] = NULL;

        return $dados;
    }

    /** Retrieve the Entity */
    public function getUsuario($where = null, $limit = null) {
        $select = array('*');
        return $this->read($this->tabPadrao, $select, $where, null, $limit, null, null);
    }

    /** Save a new Entity  */
    public function setUsuario($array) {

        $this->startTransaction();
        $id = $this->transaction(
                $this->insert($this->tabPadrao, $array, false)
        );

        $this->commit();

        return $id;
    }

    /** Update the Entity */
    public function updUsuario($array) {
        //Chave    
        $where = $this->campo_chave . " = " . $array[$this->campo_chave];
        $this->startTransaction();
        $this->transaction($this->update($this->tabPadrao, $array, $where));
        $this->commit();
        return true;
    }

    /** Remove the Entity */
    public function delUsuario($array) {
        //Key 

        $where = $this->campo_chave . " = " . $array[$this->campo_chave];
        $this->startTransaction();
        $this->transaction($this->delete($this->tabPadrao, $where));
        $this->commit();
        return true;
    }

}

?>
