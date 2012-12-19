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

$(document).ready(function() {
	skinColor=1;
	eyeColor=1;
	hairColor=1;
	hairType=1;
	moustacheType=1;
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
	});
	
	
	
	
	$("#save").click(function(){
		
		$.getJSON(path+"updatecomponent.json", { avatarcomponentid: hairTypeID2, componenttypeid: hairTypeID  }, function(json) {});
		$.getJSON(path+"updatecomponent.json", { avatarcomponentid: hairColorID2, componenttypeid: hairColorID  }, function(json) {});
		$.getJSON(path+"updatecomponent.json", { avatarcomponentid: skinColorID2, componenttypeid: skinColorID  }, function(json) {});
		$.getJSON(path+"updatecomponent.json", { avatarcomponentid: eyeColorID2, componenttypeid: eyeColorID  }, function(json) {});
		$.getJSON(path+"updatecomponent.json", { avatarcomponentid: moustacheTypeID2, componenttypeid: moustacheTypeID  }, function(json) {});
		$.getJSON(path+"updatecomponent.json", { avatarcomponentid: shirtColorID2, componenttypeid: shirtColorID  }, function(json) {});
	});
	
});