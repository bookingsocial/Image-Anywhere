global class IMGE_DisplayImageController {
	global string IMGE_uname;
    global ID IMGE_uid{get;set;}
	global string getIMGE_uname(){ return IMGE_uname; }
	global void setIMGE_uname(string s){
		IMGE_uname = s;
		IMGE_DisplayImageController();
	}
	
	global void IMGE_DisplayImageController() {
		list<Document> images=[SELECT Id,Name,DeveloperName FROM Document WHERE DeveloperName =:IMGE_uname];
        if(!images.isEmpty())
        	IMGE_uid=images[0].Id;
	}
}