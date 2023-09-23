public class JobApplicationController {
    public Job_Application__c jobApplication { get; set; }
    public Blob attachment { get; set; }
    public String attachmentName { get; set; }

    public JobApplicationController() {
        jobApplication = new Job_Application__c();
    }

    public PageReference submitApplication() {
        try {
            insert jobApplication;
            
            if (attachment != null) {
                Attachment resumeAttachment = new Attachment(
                    ParentId = jobApplication.Id,
                    Name = attachmentName,
                    Body = attachment
                );
                insert resumeAttachment;
            }

            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'Application submitted successfully.'));
        } catch (Exception e) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'An error occurred: ' + e.getMessage()));
        }

        return null;
    }
}