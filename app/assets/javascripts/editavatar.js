
var svgNS = "http://www.w3.org/2000/svg";  
var path="http://localhost:3000/";
var avatar;
function SVGElement(id,svg){
	this.ID=id;
	this.svg=svg;
}
function SVGComponent(){
	this.types=new Array();
	this.i=0;
	this.avcompid=0;
	function add(id,svg)
	{
		this.types.push(new SVGElement(id,svg));
	}
	function locate(componenttypeID)
	{
		for (var i=0;i<types.length;i++)
		{
			if (types[i].ID==componenttypeID)
			{
				this.i=i;
				break;
			}
		}
	}
	function typeid()
	{
		return types[i].ID;
	}
}
var skinColor;
var eyeColor;
var hairColor;
var hairType;
var moustacheType;
var noseType;
var mouthType;
var shirtType;
var shirtColor;




function changeSkinColor(ch)
{
	
	skinColor.i+=ch;
	
	if (skinColor.i<0){ 
		skinColor.i=skinColor.types.length-1;
	}
	if (skinColor.i==skinColor.types.length){
		skinColor.i=0;
	}
	var elem=skinColor.types[skinColor.i];
	
	var myFace=document.getElementById("Body");
	for(var j=0; j<myFace.children.length; j++) 
		myFace.children[j].setAttribute("fill",elem.svg);
	myFace=document.getElementById("Nose");
	for(var j=0; j<myFace.children.length; j++) 
		myFace.children[j].setAttribute("fill",elem.svg);
	myFace=document.getElementById("Ear");
	for(var j=0; j<myFace.children.length; j++) 
		myFace.children[j].setAttribute("fill",elem.svg);

	
}

function changeEyeColor(ch)
{
	var myEyes=document.getElementById("Eye_Color");
	eyeColor.i+=ch;
	if (eyeColor.i<0){ 
		eyeColor.i=eyeColor.types.length-1;
	}
	if (eyeColor.i==eyeColor.types.length){
		eyeColor.i=0;
	}
	var elem=eyeColor.types[eyeColor.i];
	for(var j=0; j<myEyes.children.length; j++) 
		myEyes.children[j].setAttribute("fill",elem.svg);
			
}


function changeShirtColor(ch)
{
	var myShirt=document.getElementById("Tshirt").firstChild;
	shirtColor.i+=ch;
	
	if (shirtColor.i<0){ 
		shirtColor.i=shirtColor.types.length-1;
	}
	if (shirtColor.i==shirtColor.types.length){
		shirtColor.i=0;
	}
	var elem=shirtColor.types[shirtColor.i];
	myShirt.setAttribute("fill",elem.svg);	
}

function changeHairColor( ch)
{
	var myHair= document.getElementById("Hair");
	var myMoustache= document.getElementById("Moustache");
	hairColor.i+=ch;
	
	if (hairColor.i<0){ 
		hairColor.i=hairColor.types.length-1;
	}
	if (hairColor.i==hairColor.types.length){
		hairColor.i=0;
	}
	var elem=hairColor.types[hairColor.i];

	for(var j=0; j<myHair.children.length; j++) 
		myHair.children[j].setAttribute("fill",elem.svg);
	for(var j=0; j<myMoustache.children.length; j++) 
		myMoustache.children[j].setAttribute("fill",elem.svg);
			
}

function changeHairType( ch)
{
	var myHair= document.getElementById("Hair");
	hairType.i+=ch;
	
	if (hairType.i<0){ 
		hairType.i=hairType.types.length-1;
	}
	if (hairType.i==hairType.types.length){
		hairType.i=0;
	}
	var elem=hairType.types[hairType.i];
	myHair.innerHTML=elem.svg;
	for(var j=0; j<myHair.children.length; j++)
		myHair.children[j].setAttribute("fill",hairColor.types[hairColor.i].svg);
}

function changeMoustacheType( ch)
{
	var myMoustache= document.getElementById("Moustache");
	moustacheType.i+=ch;
	
	if (moustacheType.i<0){ 
		moustacheType.i=moustacheType.types.length-1;
	}
	if (moustacheType.i==moustacheType.types.length){
		moustacheType.i=0;
	}
	var elem=moustacheType.types[moustacheType.i];
	myMoustache.innerHTML=elem.svg;
	for(var j=0; j<myMoustache.children.length; j++) 
		myMoustache.children[j].setAttribute("fill",hairColor.types[hairColor.i].svg);
	
}

function changeMouthType( ch)
{
	var myMouth= document.getElementById("Mouth");
	mouthType.i+=ch;
	
	if (mouthType.i<0){ 
		mouthType.i=mouthType.types.length-1;
	}
	if (mouthType.i==mouthType.types.length){
		mouthType.i=0;
	}
	var elem=mouthType.types[mouthType.i];
	myMouth.innerHTML=elem.svg;		
}

function changeNoseType( ch)
{
	var myNose= document.getElementById("Nose");
	noseType.i+=ch;
	
	if (noseType.i<0){ 
		noseType.i=noseType.types.length-1;
	}
	if (noseType.i==noseType.types.length){
		noseType.i=0;
	}
	var elem=noseType.types[noseType.i];
	myNose.innerHTML=elem.svg;
	for(var j=0; j<myNose.children.length; j++) 
		myNose.children[j].setAttribute("fill",skinColor.types[skinColor.i].svg);	
}


function changeShirtType( ch)
{
	var myShirt= document.getElementById("Tshirt");
	shirtType.i+=ch;
	
	if (shirtType.i<0){ 
		shirtType.i=shirtType.types.length-1;
	}
	if (shirtType.i==shirtType.types.length){
		shirtType.i=0;
	}
	var elem=shirtType.types[shirtType.i];
	myShirt.innerHTML=elem.svg;
	myShirt.children[0].setAttribute("fill",shirtColor.types[skinColor.i].svg);		
}


function addType(data,type,comp)
{
	
}

function addColor(data,type,comp)
{

}

$(document).ready(function() {
	
	$("svg").hide();
	for (var i=0;i<$("svg").length;i++)
	{
		avatar=parseInt($("svg:eq("+i+")").attr('id'));
		if (avatar>0){
			$.getJSON(path+"getavatar2.json",{id:avatar},function(data) {
				$("svg:eq("+i+")").innerHTML=data.svg;
			});
			
		}	
	}
	
	$("svg").show();
	
	if ($("#editsvg")!=null)
	{
		hairType=new SVGComponent();
		hairColor=new SVGComponent();
		skinColor=new SVGComponent();
		eyeColor=new SVGComponent();
		moustacheType=new SVGComponent();
		noseType=new SVGComponent();
		mouthType=new SVGComponent();
		shirtType=new SVGComponent();
		shirtColor=new SVGComponent();
		
		$.getJSON(path+"svgs_android",{componentid:1},function(data){addType(data,hairType,"hairType");});
		$.getJSON(path+"svgs_android",{componentid:2},function(data){addColor(data,hairColor,"hairColor");});
		$.getJSON(path+"svgs_android",{componentid:3},function(data){addColor(data,skinColor,"skinColor");});
		$.getJSON(path+"svgs_android",{componentid:4},function(data){addColor(data,eyeColor,"eyeColor");});
		$.getJSON(path+"svgs_android",{componentid:5},function(data){addType(data,moustacheType,"moustacheType");});
		$.getJSON(path+"svgs_android",{componentid:6},function(data){addType(data,noseType,"noseType");});
		$.getJSON(path+"svgs_android",{componentid:7},function(data){addType(data,mouthType,"mouthType");});
		$.getJSON(path+"svgs_android",{componentid:8},function(data){addType(data,shirtType,"shirtType");});
		$.getJSON(path+"svgs_android",{componentid:9},function(data){addColor(data,shirtColor,"shirtColor");});
		
		
		$.getJSON(path+"getavatar.json",{avatarid:avatar},	function(data) {
			var comp;
			$.each(data,function (index, value){
				comp=value.component_id;
				
				if (comp==1)
				{ 
					hairType.avcompid=value.id;
					hairType.locate(value.componenttype_id);
				}
				if (comp==2) 
				{ 
					hairColor.avcompid=value.id;
					hairColor.locate(value.componenttype_id);
				}
				if (comp==3) 
				{ 
					skinColor.avcompid=value.id;
					skinColor.locate(value.componenttype_id);
				}
				if (comp==4) 
				{ 
					eyeColor.avcompid=value.id;
					eyeColor.locate(value.componenttype_id);
				}
				if (comp==5) 
				{ 
					moustache.avcompid=value.id;
					moustacheType.locate(value.componenttype_id);
				}
				if (comp==6) 
				{ 
					noseType.avcompid=value.id;
					noseType.locate(value.componenttype_id);
				}
				if (comp==7) 
				{ 
					mouthType.avcompid=value.id;
					mouthType.locate(value.componenttype_id);
				}
				if (comp==8) 
				{ 
					shirtType.avcompid=value.id;
					shirtType.locate(value.componenttype_id);
				}
				if (comp==9) 
				{ 
					shirtColor.avcompid=value.id;
					shirtColor.locate(value.componenttype_id);
				}
			});
		});
	}
	
	
	$("#save").click(function(){
		
		$.getJSON(path+"updatecomponent.json", { avatarcomponentid: hairType.avcompid, componenttypeid: hairType.typeid()  }, function(json) {});
		$.getJSON(path+"updatecomponent.json", { avatarcomponentid: hairColor.avcompid, componenttypeid: hairColor.typeid()  }, function(json) {});
		$.getJSON(path+"updatecomponent.json", { avatarcomponentid: skinColor.avcompid, componenttypeid: skinColor.typeid()  }, function(json) {});
		$.getJSON(path+"updatecomponent.json", { avatarcomponentid: eyeColor.avcompid, componenttypeid: eyeColor.typeid()  }, function(json) {});
		$.getJSON(path+"updatecomponent.json", { avatarcomponentid: moustacheType.avcompid, componenttypeid: moustacheType.typeid()  }, function(json) {});
		$.getJSON(path+"updatecomponent.json", { avatarcomponentid: noseType.avcompid, componenttypeid: noseType.typeid()  }, function(json) {});
		$.getJSON(path+"updatecomponent.json", { avatarcomponentid: mouthType.avcompid, componenttypeid: mouthType.typeid()  }, function(json) {});
		$.getJSON(path+"updatecomponent.json", { avatarcomponentid: shirtType.avcompid, componenttypeid: shirtType.typeid()  }, function(json) {});
		$.getJSON(path+"updatecomponent.json", { avatarcomponentid: shirtColor.avcompid, componenttypeid: shirtColor.typeid()  }, function(json) {});
	});
	
});
 
