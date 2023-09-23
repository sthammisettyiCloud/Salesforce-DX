@isTest
public class JobApplicationControllerTest {
    @isTest
    static void testSubmitApplication() {
        // Create test data (you may need to create test data for your custom object)
        Job_Application__c testApplication = new Job_Application__c(Name = 'Test Applicant');
        insert testApplication;

        PageReference pageRef = Page.JobApplicationPage;
        Test.setCurrentPage(pageRef);

        // Instantiate the controller
        JobApplicationController controller = new JobApplicationController();
        controller.jobApplication = testApplication;

        // Simulate file attachment
        controller.attachmentName = 'test_resume.txt';
        controller.attachment = Blob.valueOf('Test resume content');

        // Call the submitApplication method
        Test.startTest();
        PageReference result = controller.submitApplication();
        Test.stopTest();

        // Add assertions here to verify the expected behavior
        // For example, check if the record and attachment were created successfully
    }
}