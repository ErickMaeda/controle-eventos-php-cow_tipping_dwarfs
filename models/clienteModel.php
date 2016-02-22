<?php

/**
 * Data that needs to be copied in news Model Entitys
 */
class clienteModel extends model {

    var $tabPadrao = 'cliente';
    var $campo_chave = 'id_cliente';

    // An empty structure to create news Entitys 
    public function estrutura_vazia() {
        $dados = null;
        $dados[0]['id_cliente'] = NULL;
        $dados[0]['nome_cliente'] = NULL;
        $dados[0]['endereco_cliente'] = NULL;
        $dados[0]['codigo_uc'] = NULL;
        $dados[0]['codigo_nis'] = NULL;
        $dados[0]['cpf_cliente'] = NULL;
        $dados[0]['rg_cliente'] = NULL;
        $dados[0]['stat'] = NULL;
        $dados[0]['id_estado'] = NULL;
        $dados[0]['id_cidade'] = NULL;
        $dados[0]['telefone_cliente'] = NULL;

        return $dados;
    }

    /** Retrieve the Entity */
    public function getCliente($where = null, $limit = null) {
        $select = array('*');
        return $this->read($this->tabPadrao, $select, $where, null, $limit, null, null);
    }

    /** Save a new Entity  */
    public function setCliente($array) {

        $this->startTransaction();
        $id = $this->transaction(
        $this->insert($this->tabPadrao, $array, false));
        $this->commit();

        return $id;
    }

    /** Update the Entity */
    public function updCliente($array) {
        //Chave    
        $where = $this->campo_chave . " = " . $array[$this->campo_chave];
        $this->startTransaction();
        $this->transaction($this->update($this->tabPadrao, $array, $where));
        $this->commit();
        return true;
    }

    /** Remove the Entity */
    public function delCliente($array) {
        //Key 
        $where = $this->campo_chave . " = " . $array[$this->campo_chave];
        
        $this->startTransaction();
        $this->transaction($this->update($this->tabPadrao, $array2, $where));
        $this->commit();
        return true;
    }

}

?>
