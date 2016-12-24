@isTest
private class IMGE_ChooseImageTest {

	static testmethod void testIMGE_ChooseImage(){
	
	IMGE_ChooseImage img = new IMGE_ChooseImage(); 
	Document document = new Document();
	document.Name = 'Image Anywhere';
	document.AuthorId = UserInfo.getUserId();
	document.FolderId = UserInfo.getUserId();
	insert document;
	RestRequest req = new RestRequest();
	RestResponse res = new RestResponse();
	
	req.requestURI = '/services/apexrest/BKSL/ImageUpload';
	req.httpMethod = 'GET';
	RestContext.request = req;
	RestContext.response = res;
	List<Document> doGet = IMGE_ChooseImage.doGet();
	
	req.addParameter('ImageId', document.Id);
	req.addParameter('FileName', document.Name);
	req.addParameter('FolderId', document.FolderId);
	req.httpMethod = 'POST';
	RestContext.request = req;
	RestContext.response = res;
	String doPostUpdate = IMGE_ChooseImage.doPost();
	System.assertNotEquals(document.Id, null);
	
	req.addParameter('ImageId', document.Id);
	req.httpMethod = 'DELETE';
	RestContext.request = req;
	RestContext.response = res;
	String doDelete = IMGE_ChooseImage.doDelete();
	System.assertNotEquals(document.Id, null);
	
	req.addParameter('ImageId',null );
	req.addParameter('FileName', document.Name);
	req.addParameter('FolderId', document.FolderId);
	req.httpMethod = 'POST';
	RestContext.request = req;
	RestContext.response = res;
	String doPostInsert = IMGE_ChooseImage.doPost();
	
	}
}