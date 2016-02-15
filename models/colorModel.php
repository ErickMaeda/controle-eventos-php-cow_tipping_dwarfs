<?php
/** 
 * Data that needs to be copied in news Model Entitys
 */


class colorModel extends model {
    
    var $tabPadrao = 'colors';
    var $campo_chave = 'id';

    // An empty structure to create news Entitys 
    public function estrutura_vazia() {
        $dados = null;
        $dados[0]['id'] = NULL;
        $dados[0]['name'] = NULL;
        $dados[0]['created'] = NULL;
        $dados[0]['active'] = NULL;        
        return $dados;
    }

    
    /** Retrieve the Entity */
    public function getColor($where = null) {
        $select = array('*');
        return $this->read($this->tabPadrao, $select, $where, null, null, null, null);
    }

    /** Save a new Entity  */
    public function setColor($array) {

        $this->startTransaction();

        $id = $this->transaction(
                $this->insert($this->tabPadrao, $array, false)
        );

        $this->commit();

        return $id;
    }

    /** Update the Entity */
    public function updColor($array) {
        //Chave    
        $where = $this->campo_chave . " = " . $array[$this->campo_chave];
        $this->startTransaction();
        $this->transaction($this->update($this->tabPadrao, $array, $where));
        $this->commit();
        return true;
    }

     /** Remove the Entity */
    public function delColor($array) {
        //Key 
        $where = $this->campo_chave . " = " . $array[$this->campo_chave];
        $array2['active'] = 0; // Muda status para zero excluido!   
        $this->startTransaction();
        $this->transaction($this->update($this->tabPadrao, $array2, $where));
        $this->commit();
        return true;
    }

}

?>
