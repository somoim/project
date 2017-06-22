/**
 * 
 */

function checkImageType(fileName) {
	var pattern = /jpg|gif|png|jpeg/i;
	
	return fileName.match(pattern);
}

function getFileInfo(sg_picture) {
	var fileName, imgsrc, getLink;
	var fileLink; //UUID하고 원래 파일 이름하고 적용하는 애?
	
	if(checkImageType(sg_picture)){
		imgsrc = "/displayFile?fileName="+sg_picture;
		fileLink = sg_picture.substr(14); 
		//'_' 다음부터의 이름 -> 나중에 보여줄 때 원래 이름만 보여주기 위해서 따로 잡음
		var prefix = sg_picture.substr(0,12);
		var suffix = sg_picture.substr(14);
		getLink = "/displayFile?fileName="+(prefix+suffix);
	} else {
		imgsrc="../resources/img/back.jpg";
		fileLink = sg_picture.substr(12);
		getLink = "/displayFile?fileName="+sg_picture;
	}
	
	fileName = fileLink.substr(fileLink.indexOf("_")+1);
	
	return {fileName:fileName, imgsrc:imgsrc, getLink:getLink, sg_picture:sg_picture};
	//앞에 있는 속성은 handlebars의 source에 있는 속성명과 같아야함
	
}