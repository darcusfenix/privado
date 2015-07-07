/**
 * By: Tapia Mujica Fernando on 6/07/15
 * Desc:
 */

package com.ed.paycontrol

class StateVoucher implements Serializable{
    Integer id
    String name
    String description

    static mapping = {
        table 't_state_voucher_cat'
        id name: 'id', column: 'id_state', generator: 'identity'
        name column: 'nb_state'
        description column: 'ds_state'
        version false
    }

// TODO: Talk of Enum classes for the catalogs.
}