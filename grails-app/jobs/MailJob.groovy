import com.ed.schoolmanagement.UserMailHistory
import uk.co.desirableobjects.sendgrid.SendGridEmail
import uk.co.desirableobjects.sendgrid.SendGridEmailBuilder

class MailJob {

    def sendGridService

    static triggers = {
        cron cronExpression: "0 0/2 * 1/1 * ? *"
    }

    def group = "MailCronTask"

    def execute() {
        UserMailHistory.findAllBySend(false).each { mailHistory ->
            SendGridEmail sendGridEmail = new SendGridEmailBuilder()
                    .from(mailHistory.from)
                    .to(mailHistory.to)
                    .subject(mailHistory.subject)
                    .withHtml(mailHistory.htmlContent ?: "")
                    .build()
            try {
                sendGridService.send(sendGridEmail)
                mailHistory.send = true
                mailHistory.save(flush: true);
            } catch (Exception e) {
                log.error("Failed on sending email")
                log.error(e)
            }
        }
    }
}