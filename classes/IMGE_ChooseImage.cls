@RestResource(urlMapping='/BKSL/ImageUpload/') 
global with sharing class IMGE_ChooseImage {
    global IMGE_ChooseImage() {
        
    }
    @HttpPost
    global static String doPost() {
        
        RestRequest req = RestContext.request;
        Document doc = new Document();
        Blob imageBlob = req.requestBody; 
        String ImageId = req.params.get('ImageId');
        String fileName = req.params.get('FileName');
        String folderId = req.params.get('FolderId');
        if(ImageId !=null){
            doc.Body = imageBlob;   
            doc.Id = ImageId;   
            update doc;
        }else{
            doc.FolderId = folderId;
            doc.isPublic = true;
            doc.Body = imageBlob;        
            doc.Name = fileName;
            insert doc;
        }
        return doc.Id;
    }
    @HttpGet
    global static List<Document> doGet() {
        RestRequest req = RestContext.request;
        String folderId = req.params.get('FolderId');
        return [SELECT Id,Name,DeveloperName,LastModifiedDate FROM Document WHERE FolderId =:folderId];
    }
    @HttpDelete
    global static String doDelete() {
        Id docId = RestContext.request.params.get('ImageId');
        Document doc = [SELECT Id FROM Document WHERE Id =: docId];
        delete doc;
        return 'success';
  }

}