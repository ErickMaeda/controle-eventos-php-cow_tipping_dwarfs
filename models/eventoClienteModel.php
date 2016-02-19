<?php

/**
 * Data that needs to be copied in news Model Entitys
 */
class eventoClienteModel extends model {

    var $tabPadrao = 'evento_cliente';
    var $campo_chave = 'id_evento_cliente';

    // An empty structure to create news Entitys 
    public function estrutura_vazia() {
        $dados = null;
        $dados[0]['id_evento_cliente'] = NULL;
        $dados[0]['id_cliente'] = NULL;
        $dados[0]['id_evento'] = NULL;
        $dados[0]['dt_cadastro'] = NULL;
        $dados[0]['stat'] = NULL;

        return $dados;
    }

    /** Retrieve the Entity */
    public function getEventoCliente($where = null, $limit = null) {
        $select = array('*');
        return $this->read($this->tabPadrao, $select, $where, null, $limit, null, null);
    }

    /** Save a new Entity  */
    public function setEventoCliente($array) {

        $this->startTransaction();

        $id = $this->transaction(
                $this->insert($this->tabPadrao, $array, false)
        );

        $this->commit();

        return $id;
    }

    /** Update the Entity */
    public function upEventoCliente($array) {
        //Chave    
        $where = $this->campo_chave . " = " . $array[$this->campo_chave];
        $this->startTransaction();
        $this->transaction($this->update($this->tabPadrao, $array, $where));
        $this->commit();
        return true;
    }

    /** Remove the Entity */
    public function delEventoCliente($array) {
        //Key 
        $where = $this->campo_chave . " = " . $array[$this->campo_chave];
        $array2['stat'] = 0; // Muda status para zero excluido!   
        $this->startTransaction();
        $this->transaction($this->update($this->tabPadrao, $array2, $where));
        $this->commit();
        return true;
    }

}

?>
