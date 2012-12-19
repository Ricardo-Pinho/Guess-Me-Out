var svgNS = "http://www.w3.org/2000/svg";  
var path="http://localhost:3000/";
var avatar;
var skinColor;
var skinColorRGB;
var skinColorID;
var skinColorID2;
var eyeColor;
var eyeColorRGB;
var eyeColorID;
var eyeColorID2;
var hairColor;
var hairColorRGB;
var hairColorID;
var hairColorID2;
var hairType;
var hairTypeID;
var hairTypeID2;
var moustacheType;
var moustacheTypeID;
var moustacheTypeID2;
var noseType;
var noseTypeID;
var noseTypeID2;
var mouthType;
var mouthTypeID;
var mouthTypeID2;
var shirtType;
var shirtTypeID;
var shirtTypeID2;
var shirtColor;
var shirtColorRGB;
var shirtColorID;
var shirtColorID2;



function changeSkinColor(ch)
{
	var myFace=document.getElementById("Body");
	
	skinColor+=ch;
	
	if (skinColor==0){ 
		skinColor=2;
	}
	if (skinColor==3){
		skinColor=1;
	}
	
	
	$.getJSON(path+"gettypebycolor.json",{component_id: 3,color: skinColor},
	  function(data) {/*whatever*/
		data=data[0];
		skinColorID=data.id;
		skinColorRGB=data.svg;
		for(var j=0; j<myFace.children.length; j++) 
			myFace.children[j].setAttribute("fill",skinColorRGB);
			myFace=document.getElementById("Nose");
		for(var j=0; j<myFace.children.length; j++) 
			myFace.children[j].setAttribute("fill",skinColorRGB);
		myFace=document.getElementById("Ear");
		for(var j=0; j<myFace.children.length; j++) 
			myFace.children[j].setAttribute("fill",skinColorRGB);
	});
	
}

function changeEyeColor(ch)
{
	var myEyes=document.getElementById("Eye_Color");
	eyeColor+=ch;
	if (eyeColor==0){ 
		eyeColor=5;
	}
	if (eyeColor==6){
		eyeColor=1;
	}
	$.getJSON(path+"gettypebycolor.json",{component_id: 4,color: eyeColor},
	  function(data) {
		data=data[0];
		eyeColorRGB=data.svg;
		eyeColorID=data.id;
		for(var j=0; j<myEyes.children.length; j++) 
			myEyes.children[j].setAttribute("fill",eyeColorRGB);
	});			
}


function changeShirtColor(ch)
{
	var myShirt=document.getElementById("Tshirt").firstChild;
	
	shirtColor+=ch;
	if (shirtColor==0){ 
		shirtColor=2;
	}
	if (shirtColor==3){
		shirtColor=1;
	}
	$.getJSON(path+"gettypebycolor.json",{component_id: 9,color: shirtColor},
	  function(data) {
		data=data[0];
		shirtColorRGB=data.svg;
		shirtColorID=data.id;
		myShirt.setAttribute("fill",shirtColorRGB);
	});			
	
}

function changeHairColor( ch)
{
	var myHair= document.getElementById("Hair");
	var myMoustache= document.getElementById("Moustache");
	hairColor=hairColor+ch;
	if (hairColor==0){ 
		hairColor=2;
	}
	if (hairColor==3){
		hairColor=1;
	}
	$.getJSON(path+"gettypebycolor.json",{component_id: 2,color: hairColor},
		function(data) {
			data=data[0];
			hairColorRGB=data.svg;
			hairColorID=data.id;
			for(var j=0; j<myHair.children.length; j++) 
				myHair.children[j].setAttribute("fill",hairColorRGB);
			for(var j=0; j<myMoustache.children.length; j++) 
				myMoustache.children[j].setAttribute("fill",hairColorRGB);
	});			
}

function changeHairType( ch)
{
	var myHair= document.getElementById("Hair");
	hairType=hairType+ch;
	if (hairType==0){ 
		hairType=2;
	}
	if (hairType==3){
		hairType=1;
	}
	$.getJSON(path+"gettypebycolor.json",{component_id: 1,color: hairType},
		function(data) {
			data=data[0];
			myHair.innerHTML=data.svg;
			hairTypeID=data.id;
			for(var j=0; j<myHair.children.length; j++) 
				myHair.children[j].setAttribute("fill",hairColorRGB);
	});			
}

function changeMoustacheType( ch)
{
	var myMoustache= document.getElementById("Moustache");
	moustacheType=moustacheType+ch;
	if (moustacheType==0){ 
		moustacheType=2;
	}
	if (moustacheType==3){
		moustacheType=1;
	}
	$.getJSON(path+"gettypebycolor.json",{component_id: 5,color: moustacheType},
		function(data) {
			data=data[0];
			myMoustache.innerHTML=data.svg;
			moustacheTypeID=data.id;
			for(var j=0; j<myMoustache.children.length; j++) 
				myMoustache.children[j].setAttribute("fill",hairColorRGB);
	});			
}

function changeMouthType( ch)
{
	var myMouth= document.getElementById("Mouth");
	mouthType=mouthType+ch;
	if (mouthType==0){ 
		moustacheType=1;
	}
	if (mouthType==2){
		moustacheType=1;
	}
	$.getJSON(path+"gettypebycolor.json",{component_id: 7,color: mouthType},
		function(data) {
			data=data[0];
			myMouth.innerHTML=data.svg;
			mouthTypeID=data.id;
	});			
}

function changeNoseType( ch)
{
	var myNose= document.getElementById("Nose");
	noseType=noseType+ch;
	if (noseType==0){ 
		noseType=1;
	}
	if (noseType==2){
		noseType=1;
	}
	$.getJSON(path+"gettypebycolor.json",{component_id: 6,color: noseType},
		function(data) {
			data=data[0];
			myNose.innerHTML=data.svg;
			noseTypeID=data.id;
			for(var j=0; j<myNose.children.length; j++) 
				myNose.children[j].setAttribute("fill",skinColorRGB);
	});			
}


function changeShirtType( ch)
{
	var myShirt= document.getElementById("Tshirt");
	shirtType=shirtType+ch;
	if (shirtType==0){ 
		shirtType=1;
	}
	if (shirtType==2){
		shirtType=1;
	}
	$.getJSON(path+"gettypebycolor.json",{component_id: 8,color: shirtType},
		function(data) {
			data=data[0];
			myShirt.innerHTML=data.svg;
			shirtTypeID=data.id;
			myShirt.children[0].setAttribute("fill",shirtColorRGB);
	});			
}

$(document).ready(function() {
	skinColor=1;
	eyeColor=1;
	hairColor=1;
	hairType=1;
	moustacheType=1;
	noseType=1;
	mouthType=1;
	shirtType=1;
	shirtColor=1;
	avatar=parseInt($("svg").attr('id'));
	$.getJSON(path+"getavatar.json",{avatarid:avatar},
		function(data) {
		var comp;
		$.each(data,function (index, value){
			comp=value.component_id;
			
			if (comp==1)
			{ 
				hairTypeID2=value.id;
				hairType=value.color;
			}
			if (comp==2) 
			{ 
				hairColorID2=value.id;
				hairColor=value.color;
			}
			if (comp==3) 
			{ 
				skinColorID2=value.id;
				skinColor=value.color
			}
			if (comp==4) 
			{ 
				eyeColorID2=value.id;
				eyeColor=value.color;
			}
			if (comp==5) 
			{ 
				moustacheTypeID2=value.id;
				moustacheType=value.color;
			}
			if (comp==6) 
			{ 
				noseTypeID2=value.id;
				noseType=value.color;
			}
			if (comp==7) 
			{ 
				mouthTypeID2=value.id;
				mouthType=value.color;
			}
			if (comp==8) 
			{ 
				shirtTypeID2=value.id;
				shirtType=value.color;
			}
			if (comp==9) 
			{ 
				shirtColorID2=value.id;
				shirtColor=value.color;
			}
		});
		changeEyeColor(0);
		changeSkinColor(0);	
		changeHairColor(0);
		changeShirtColor(0);	
		changeHairType(0);	
		changeMoustacheType(0);
		changeNoseType(0);
		changeMouthType(0);
		changeShirtType(0);
	});
	
	
	
	
	$("#save").click(function(){
		
		$.getJSON(path+"updatecomponent.json", { avatarcomponentid: hairTypeID2, componenttypeid: hairTypeID  }, function(json) {});
		$.getJSON(path+"updatecomponent.json", { avatarcomponentid: hairColorID2, componenttypeid: hairColorID  }, function(json) {});
		$.getJSON(path+"updatecomponent.json", { avatarcomponentid: skinColorID2, componenttypeid: skinColorID  }, function(json) {});
		$.getJSON(path+"updatecomponent.json", { avatarcomponentid: eyeColorID2, componenttypeid: eyeColorID  }, function(json) {});
		$.getJSON(path+"updatecomponent.json", { avatarcomponentid: moustacheTypeID2, componenttypeid: moustacheTypeID  }, function(json) {});
		$.getJSON(path+"updatecomponent.json", { avatarcomponentid: noseTypeID2, componenttypeid: noseTypeID  }, function(json) {});
		$.getJSON(path+"updatecomponent.json", { avatarcomponentid: mouthTypeID2, componenttypeid: mouthTypeID  }, function(json) {});
		$.getJSON(path+"updatecomponent.json", { avatarcomponentid: shirtTypeID2, componenttypeid: shirtTypeID  }, function(json) {});
		$.getJSON(path+"updatecomponent.json", { avatarcomponentid: shirtColorID2, componenttypeid: shirtColorID  }, function(json) {});
	});
	
});