public class ViewAccountsOpportunityController {
    //Property to bind list of Opportunities...
    public List<Opportunity> AccOpps {
        get {
            return [select id,name,stagename,type,Amount from opportunity where accountid=:Apexpages.currentPage().getParameters().get('id')];
        } set;
    }
    //Assigned Opportunity ID to delete this record id.
    public ID OpportunityID {get;set;}
    public ViewAccountsOpportunityController(ApexPages.StandardController controller){
    }
    
    //Method used to delete record.
    public void DeleteOpp(){
        try{
            Database.DeleteResult dsr = database.delete(OpportunityID);
            //if success, show message.
            if(dsr.isSuccess()){
                //**later** commented below soql query as it was not needed.
                //AccOpps = [select id,name,stagename,type from opportunity where accountid=:Apexpages.currentPage().getParameters().get('id')];
                ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.CONFIRM,'Deleted succesfully.'));    
            }
            
        }
        catch(Exception e){
            ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.ERROR,'Error in saving records: ' + e.getMessage()));
        }
    }
    
}