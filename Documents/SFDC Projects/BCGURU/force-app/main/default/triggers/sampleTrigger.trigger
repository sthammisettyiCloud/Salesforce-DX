trigger sampleTrigger on Account (before insert) {

    for(Account a : Trigger.New){
        a.Description = 'Hai';
    } 
}