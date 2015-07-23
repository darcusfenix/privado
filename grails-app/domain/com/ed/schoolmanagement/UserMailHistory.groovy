package com.ed.schoolmanagement

class UserMailHistory {
    String from
    String to
    String subject
    String bodyContent
    String htmlContent
    String attachmentPath
    boolean send = false
    static constraints = {
        from nullable: true, blank:true
        to nullable: true, blank:true
        subject nullable: true, blank:true
        bodyContent nullable: true, blank:true
        attachmentPath nullable: true, blank:true
        htmlContent nullable: true, blank: true
        send nullable:false
    }
    static mapping = {
        version false
        from column: 'from_mail'
        to column: 'to_mail'
        bodyContent type:'text'
        htmlContent type:'text'
    }
}
