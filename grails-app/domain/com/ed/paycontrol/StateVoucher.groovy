/**
 * By: Tapia Mujica Fernando on 6/07/15
 * Desc: Relationship between state machine voucher with vouchers
 */

package com.ed.paycontrol

class StateVoucher implements Serializable{

    String name
    String description

    static mapping = {
        table 't_state_voucher_cat'
        id column: 'id_state', generator: 'identity'
        name column: 'nb_state'
        description column: 'ds_state'
        version false
    }

    Integer getStateVoucherId(){
        return this.id;
    }

// TODO: Talk of Enum classes for the catalogs.
}