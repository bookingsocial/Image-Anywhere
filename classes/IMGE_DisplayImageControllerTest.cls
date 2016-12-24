@isTest
private class IMGE_DisplayImageControllerTest {

	static testmethod void testIMGE_DisplayImageCntrl(){
	
	IMGE_DisplayImageController img = new IMGE_DisplayImageController(); 
	Document document = new Document();
	document.Name = 'Image Anywhere';
	document.AuthorId = UserInfo.getUserId();
	document.FolderId = UserInfo.getUserId();
	document.DeveloperName = 'Deva';
	insert document;
	System.assertEquals('Deva', document.DeveloperName);
	System.assertNotEquals(document.Name, null);
	img.setIMGE_uname('Deva');
	img.getIMGE_uname();
	}
}