/**
 * 
 */

function checkImageType(fileName) {
	var pattern = /jpg|gif|png|jpeg/i;
	
	return fileName.match(pattern);
}

function getFileInfo(fullName) {
	var fileName, imgsrc, getLink;
	var fileLink; //UUID하고 원래 파일 이름하고 적용하는 애?
	
	if(checkImageType(fullName)){
		imgsrc = "/displayFile?fileName="+fullName;
		fileLink = fullName.substr(14); 
		//'_' 다음부터의 이름 -> 나중에 보여줄 때 원래 이름만 보여주기 위해서 따로 잡음
		var prefix = fullName.substr(0,12);
		var suffix = fullName.substr(14);
		getLink = "/displayFile?fileName="+(prefix+suffix);
	} else {
		imgsrc="../resources/img/back.jpg";
		fileLink = fullName.substr(12);
		getLink = "/displayFile?fileName="+fullName;
	}
	
	fileName = fileLink.substr(fileLink.indexOf("_")+1);
	
	return {fileName:fileName, imgsrc:imgsrc, getLink:getLink, fullName:fullName};
	//앞에 있는 속성은 handlebars의 source에 있는 속성명과 같아야함
	
}