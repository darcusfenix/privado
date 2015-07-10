package com.ed.paycontrol

import com.ed.accesscontrol.StudentService

import java.sql.Blob


class VoucherPayment implements Serializable{

    Integer paymentId
    Integer stateId
    Blob image
    Date payDate
    Float pay
    static belongsTo = [studentService: StudentService]
    StateVoucher stateVoucher

    static constraints = {

        image blank: true, nullable: true
        payDate blank: true, nullable: true
        pay blank: true, nullable: true

    }




    static mapping = {
        table 't_voucher_payment_tab'
        id name: 'paymentId', column: 'id_payment', generator: 'identity'
        image column: 'bl_image'
        payDate column: 'fh_pay'
        pay column: 'nu_pay'
        version false
    }
}

