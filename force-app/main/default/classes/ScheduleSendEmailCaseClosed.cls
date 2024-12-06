public class ScheduleSendEmailCaseClosed implements Schedulable {
    public void execute(SchedulableContext SC) {
        SendEmailClosedCaseBatch batch = new SendEmailClosedCaseBatch();
        Database.executeBatch(batch);
    }

    public static void scheduleJob() {
        String cronExp = '0 0 0 * * ?';
        System.schedule('Send email Case Closed Job', cronExp, new ScheduleSendEmailCaseClosed());
    }
}