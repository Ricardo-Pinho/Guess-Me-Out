var svgNS = "http://www.w3.org/2000/svg";  
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
	
	
	$.getJSON("../gettypebycolor.json",{component_id: 3,color: skinColor},
	  function(data) {/*whatever*/
		skinColorID=data.component_id;
		skinColorRGB=data.svg;
		for(var j=0; j<myFace.childNodes.length; j++) 
			myFace.childNodes[j].setAttribute("fill",skinColorRGB);
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
	$.getJSON("../gettypebycolor.json",{component_id: 4,color: eyeColor},
	  function(data) {
		eyeColorRGB=data.svg;
		for(var j=0; j<myEyes.childNodes.length; j++) 
			myEyes.childNodes[j].setAttribute("fill",eyeColorRGB);
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
	$.getJSON("../gettypebycolor.json",{component_id: 9,color: shirtColor},
	  function(data) {
		shirtColorRGB=data.svg;
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
	$.getJSON("../gettypebycolor.json",{component_id: 2,color: hairColor},
		function(data) {
			hairColorRGB=data.svg;
			for(var j=0; j<myHair.childNodes.length; j++) 
				myHair.childNodes[j].setAttribute("fill",hairColorRGB);
			for(var j=0; j<myMoustache.childNodes.length; j++) 
				myMoustache.childNodes[j].setAttribute("fill",hairColorRGB);
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
	$.getJSON("../gettypebycolor.json",{component_id: 1,color: hairType},
		function(data) {
			myHair.innerHTML=data.svg;
			for(var j=0; j<myHair.childNodes.length; j++) 
				myHair.childNodes[j].setAttribute("fill",hairColorRGB);
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
	$.getJSON("../gettypebycolor.json",{component_id: 5,color: moustacheType},
		function(data) {
			myMoustache.innerHTML=data.svg;
			for(var j=0; j<myMoustache.childNodes.length; j++) 
				myMoustache.childNodes[j].setAttribute("fill",hairColorRGB);
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
	$.getJSON("../getavatar.json",{avatarid:avatar},
		function(data) {
		var comp;
		$.each(data,function (index, value){
			comp=value.component_id;
			
			if (comp==1)
			{ 
				hairTypeID2=value.componenttype_id;
				hairType=value.color;
			}
			if (comp==2) 
			{ 
				hairColorID2=value.componenttype_id;
				hairColor=value.color;
			}
			if (comp==3) 
			{ 
				skinColorD2=value.componenttype_id;
				skinColor=value.color
			}
			if (comp==4) 
			{ 
				eyeColorID2=value.componenttype_id;
				eyeColor=value.color;
			}
			if (comp==5) 
			{ 
				moustacheTypeID2=value.componenttype_id;
				moustacheType=value.color;
			}
			if (comp==9) 
			{ 
				shirtColorID2=value.componenttype_id;
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
		
		$.post("updatecomponent.json", { avatarcomponent_id: hairTypeID2, componenttype_id: hairTypeID  });
		$.post("updatecomponent.json", { avatarcomponent_id: hairColorID2, componenttype_id: hairColorID  });
		$.post("updatecomponent.json", { avatarcomponent_id: skinColorID2, componenttype_id: skinColorID  });
		$.post("updatecomponent.json", { avatarcomponent_id: eyeColorID2, componenttype_id: eyeColorID  });
		$.post("updatecomponent.json", { avatarcomponent_id: moustacheTypeID2, componenttype_id: moustacheTypeID  });
		$.post("updatecomponent.json", { avatarcomponent_id: shirtColorID2, componenttype_id: shirtColorID  });
		/*copy paste por aki fora cos parametros*/
	});
	
});