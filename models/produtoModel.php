<?php
/**
 * Data that needs to be copied in news Model Entitys
 */


class produtoModel extends model {

    var $tabPadrao = 'produto';
    var $campo_chave = 'id_produto';

    // An empty structure to create news Entitys 
    public function estrutura_vazia() {
        $dados = null;
        $dados[0]['id_produto'] = NULL;
        $dados[0]['des_produto'] = NULL;

        return $dados;
    }

    
    /** Retrieve the Entity */
    public function getProduto($where = null) {
        $select = array('*');
        return $this->read($this->tabPadrao, $select, $where, null, null, null, null);
    }
    
    /** Retrieve the Entity */
    public function getProdutoDepartamento($query) {
        return $this->readSQL($query);
    }

    /** Save a new Entity  */
    public function setProduto($array) {

        $this->startTransaction();
        $id = $this->transaction(
                $this->insert($this->tabPadrao, $array, false)
        );

        $this->commit();

        return $id;
    }

    /** Update the Entity */
    public function updProduto($array) {
        //Chave    
        $where = $this->campo_chave . " = " . $array[$this->campo_chave];
        $this->startTransaction();
        $this->transaction($this->update($this->tabPadrao, $array, $where));
        $this->commit();
        return true;
    }

     /** Remove the Entity */
    public function delProduto($array) {
        //Key 
        $where = $this->campo_chave . " = " . $array[$this->campo_chave];
        $this->startTransaction();
        $this->transaction($this->delete($this->tabPadrao, $where));
        $this->commit();
        return true;
    }
}

?>
<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

