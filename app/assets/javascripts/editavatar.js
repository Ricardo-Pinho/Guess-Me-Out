
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
}
SVGComponent.prototype.add=function(id,svg)
{
	this.types.push(new SVGElement(id,svg));
}
SVGComponent.prototype.locate= function (componenttypeID)
{
	for (var i=0;i<this.types.length;i++)
	{
		if (this.types[i].ID==componenttypeID)
		{
			this.i=i;
			break;
		}
	}
}
SVGComponent.prototype.typeid=function()
{
	return this.types[this.i].ID;
}
SVGComponent.prototype.lastindex=function()
{
	return this.types.length-1;
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
//INSTRUCTION var newcomponent;



function changeSkinColor(ch, k)
{

    if (ch!=-1) skinColor.i=ch;
    var elem=skinColor.types[skinColor.i];

    var myFace=document.getElementsByClassName("Body")[k];
    for(var j=0; j<myFace.children.length; j++)
        myFace.children[j].setAttribute("fill",elem.svg);
    myFace=document.getElementsByClassName("Nose")[k];
    for(var j=0; j<myFace.children.length; j++)
        myFace.children[j].setAttribute("fill",elem.svg);
    myFace=document.getElementsByClassName("Ear")[k];
    for(var j=0; j<myFace.children.length; j++)
        myFace.children[j].setAttribute("fill",elem.svg);
    (document.getElementById("skin_ctype_id")).value=skinColor.typeid();
    (document.getElementById("skin_comp_id")).value=skinColor.avcompid;


}

function changeEyeColor(ch, k)
{
    if (ch!=-1) eyeColor.i=ch;
    var myEyes=document.getElementsByClassName("Eye_Color")[k];
    var elem=eyeColor.types[eyeColor.i];
    for(var j=0; j<myEyes.children.length; j++)
        myEyes.children[j].setAttribute("fill",elem.svg);
    (document.getElementById("eye_color_ctype_id")).value=eyeColor.typeid();
    (document.getElementById("eye_color_comp_id")).value=eyeColor.avcompid;

}


function changeShirtColor(ch, k)
{
    var myShirt=document.getElementsByClassName("Tshirt")[k].firstChild;
    if (ch!=-1) shirtColor.i=ch;
    var elem=shirtColor.types[shirtColor.i];
    myShirt.setAttribute("fill",elem.svg);
    (document.getElementById("shirtcolor_ctype_id")).value=shirtColor.typeid();
    (document.getElementById("shirtcolor_comp_id")).value=shirtColor.avcompid;
}

function changeHairColor( ch, k)
{
    var myHair= document.getElementsByClassName("Hair")[k];
    var myMoustache= document.getElementsByClassName("Moustache")[k];
    if (ch!=-1) hairColor.i=ch;
    var elem=hairColor.types[hairColor.i];

    for(var j=0; j<myHair.children.length; j++)
        myHair.children[j].setAttribute("fill",elem.svg);
    for(var j=0; j<myMoustache.children.length; j++)
        myMoustache.children[j].setAttribute("fill",elem.svg);
    (document.getElementById("hair_ctype_id")).value=hairColor.typeid();
    (document.getElementById("hair_comp_id")).value=hairColor.avcompid;

}

function changeHairType( ch, k)
{
    var myHair= document.getElementsByClassName("Hair")[k];
    if (ch!=-1) hairType.i=ch;
    var elem=hairType.types[hairType.i];
    myHair.innerHTML=elem.svg;
    for(var j=0; j<myHair.children.length; j++)
        myHair.children[j].setAttribute("fill",hairColor.types[hairColor.i].svg);
    (document.getElementById("hair_type_ctype_id")).value=hairType.typeid();
    (document.getElementById("hair_type_comp_id")).value=hairType.avcompid;
}

function changeMoustacheType( ch, k)
{
    var myMoustache= document.getElementsByClassName("Moustache")[k];
    if (ch!=-1) moustacheType.i=ch;
    var elem=moustacheType.types[moustacheType.i];
    myMoustache.innerHTML=elem.svg;
    for(var j=0; j<myMoustache.children.length; j++)
        myMoustache.children[j].setAttribute("fill",hairColor.types[hairColor.i].svg);
    (document.getElementById("moustache_ctype_id")).value=moustacheType.typeid();
    (document.getElementById("moustache_comp_id")).value=moustacheType.avcompid;

}

function changeMouthType( ch, k)
{
    var myMouth= document.getElementsByClassName("Mouth")[k];
    if (ch!=-1) mouthType.i=ch;
    var elem=mouthType.types[mouthType.i];
    myMouth.innerHTML=elem.svg;
    (document.getElementById("mouth_ctype_id")).value=mouthType.typeid();
    (document.getElementById("mouth_comp_id")).value=mouthType.avcompid;
}

function changeNoseType( ch, k)
{
    var myNose= document.getElementsByClassName("Nose")[k];
    if (ch!=-1) noseType.i=ch;
    var elem=noseType.types[noseType.i];
    myNose.innerHTML=elem.svg;
    for(var j=0; j<myNose.children.length; j++)
        myNose.children[j].setAttribute("fill",skinColor.types[skinColor.i].svg);
    (document.getElementById("nose_ctype_id")).value=noseType.typeid();
    (document.getElementById("nose_comp_id")).value=noseType.avcompid;
}


function changeShirtType( ch, k)
{
    var myShirt= document.getElementsByClassName("Tshirt")[k];
    if (ch!=-1) shirtType.i=ch;
    var elem=shirtType.types[shirtType.i];
    myShirt.innerHTML=elem.svg;
    myShirt.children[0].setAttribute("fill",shirtColor.types[shirtColor.i].svg);
    (document.getElementById("shirttype_ctype_id")).value=shirtType.typeid();
    (document.getElementById("shirttype_comp_id")).value=shirtType.avcompid;
}

//INSTRUCTION funcion changeCompName(ch)


function addType(data,type,comp)
{
	for (var i=0;i<data.length;i++)
	{
		type.add(data[i].id,data[i].svg);
		if (comp!="")
		{	
			if (data[i].svg=="")$(".component."+comp).append($('<div class="svgpreview"><svg class="svgpreview" version="1.1" baseProfile="basic" data-component='+data[i].component_id+' data-type='+type.lastindex()+'  x="0px" y="0px" width="100px" height="100px"  viewBox="0 0 512 512" xml:space="preserve"> <circle id="svg_1" r="180" cy="256" cx="256" stroke-width="47" stroke="#4c4c4c" fill="#ff0000" fill-opacity="0"/> <line fill="none" stroke="#4c4c4c" stroke-width="51" fill-opacity="0" x1="135.5" y1="385.99999" x2="380.49999" y2="117" id="svg_4"/></svg></div>'));
			else $(".component."+comp).append($('<div class="svgpreview"><svg class="svgpreview" version="1.1" baseProfile="basic" data-component='+data[i].component_id+' data-type='+type.lastindex()+'  x="0px" y="0px" width="100px" height="100px"  viewBox="0 0 512 512" xml:space="preserve">'+data[i].svg+'</svg></div>'));
		}
	}
}

function addColor(data,type,comp)
{
	for (var i=0;i<data.length;i++)
	{
		type.add(data[i].id,data[i].svg);
		if (comp!="")
		{
			$(".component."+comp).append($('<div class="svgpreview"><svg class="svgpreview" version="1.1" baseProfile="basic" data-component='+data[i].component_id+' data-type='+type.lastindex()+'  x="0px" y="0px" width="100px" height="100px"  viewBox="0 0 512 512" xml:space="preserve"><rect ry="90" rx="90" id="svg_1" height="392" width="392" y="60" x="60" stroke-width="19" stroke="#000000" fill="'+data[i].svg+'"/></svg></div>'));
		}
	}
}



$(document).ready(function() {
  for(var i=0;i<$("svg").length;i++)
  {
      drawAvatar(i);
  }
});

    function drawAvatar(i){
    if ($("svg").length>0)
	{
		avatar=parseInt($("svg:eq("+i+")").attr('data-avatar'));
		if (avatar>0)
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
			
			if ($(".editsvg").length>0)
			{
				var user=parseInt($("svg:eq("+0+")").attr('data-user'));
				$.getJSON(path+"svgs_user_android",{userid:user,componentid:1},function(data){addType(data,hairType,"hairType");});
				$.getJSON(path+"svgs_user_android",{userid:user,componentid:2},function(data){addColor(data,hairColor,"hairColor");});
				$.getJSON(path+"svgs_user_android",{userid:user,componentid:3},function(data){addColor(data,skinColor,"skinColor");});
				$.getJSON(path+"svgs_user_android",{userid:user,componentid:4},function(data){addColor(data,eyeColor,"eyeColor");});
				$.getJSON(path+"svgs_user_android",{userid:user,componentid:5},function(data){addType(data,moustacheType,"moustacheType");});
				$.getJSON(path+"svgs_user_android",{userid:user,componentid:6},function(data){addType(data,noseType,"noseType");});
				$.getJSON(path+"svgs_user_android",{userid:user,componentid:7},function(data){addType(data,mouthType,"mouthType");});
				$.getJSON(path+"svgs_user_android",{userid:user,componentid:8},function(data){addType(data,shirtType,"shirtType");});
				$.getJSON(path+"svgs_user_android",{userid:user,componentid:9},function(data){addColor(data,shirtColor,"shirtColor");});
				//INSTRUCTION $.getJSON(path+"svgs_user_android",{userid:user,componentid:X},function(data){addColor/Type(data,newcomponent,"<edit/shop html class name>");});
				
				var compdivs = $('.component');
				$('.compnav a').click(function () {
					
					compdivs.hide().filter("."+this.hash.substring(1)).show();
					
					$('.compnav a').removeClass('selected');
					$(this).addClass('selected');
					return false;
				}).filter(':first').click();
				
				
				$(document).on("click",'div.svgpreview',function(event){
					
					var comp=$(this).children(":first").attr("data-component");
					var type=$(this).children(":first").attr("data-type");
				
					if (comp==1)
					{ 
						changeHairType(type,i);
					}
					if (comp==2) 
					{ 
						changeHairColor(type,i);
					}
					if (comp==3) 
					{ 
						changeSkinColor(type,i);
					}
					if (comp==4) 
					{ 
						changeEyeColor(type,i);
					}
					if (comp==5) 
					{ 
						changeMoustacheType(type,i);
					}
					if (comp==6) 
					{ 
						changeNoseType(type,i);
					}
					if (comp==7) 
					{ 
						changeMouthType(type,i);
					}
					if (comp==8) 
					{ 
						changeShirtType(type,i);
					}
					if (comp==9) 
					{ 
						changeShirtColor(type,i);
					}
					/* //INSTRUCTION if (comp==componentID) 
					{ 
						changeCompName(type);
					}*/
					return false;
				});


				$("#save").click(function(){
					//$.getJSON(path+"updateavatarsvg.json", { avatarid: avatar, svg:  document.getElementById(avatar).innerHTML }, function(json) {});




					/*$.getJSON(path+"updatecomponent.json", { avatarcomponentid: hairType.avcompid, componenttypeid: hairType.typeid()  }, function(json) {});
					$.getJSON(path+"updatecomponent.json", { avatarcomponentid: hairColor.avcompid, componenttypeid: hairColor.typeid()  }, function(json) {});
					$.getJSON(path+"updatecomponent.json", { avatarcomponentid: skinColor.avcompid, componenttypeid: skinColor.typeid()  }, function(json) {});
					$.getJSON(path+"updatecomponent.json", { avatarcomponentid: eyeColor.avcompid, componenttypeid: eyeColor.typeid()  }, function(json) {});
					$.getJSON(path+"updatecomponent.json", { avatarcomponentid: moustacheType.avcompid, componenttypeid: moustacheType.typeid()  }, function(json) {});
					$.getJSON(path+"updatecomponent.json", { avatarcomponentid: noseType.avcompid, componenttypeid: noseType.typeid()  }, function(json) {});
					$.getJSON(path+"updatecomponent.json", { avatarcomponentid: mouthType.avcompid, componenttypeid: mouthType.typeid()  }, function(json) {});
					$.getJSON(path+"updatecomponent.json", { avatarcomponentid: shirtType.avcompid, componenttypeid: shirtType.typeid()  }, function(json) {});
					$.getJSON(path+"updatecomponent.json", { avatarcomponentid: shirtColor.avcompid, componenttypeid: shirtColor.typeid()  }, function(json) {});*/


					//INSTRUCTION $.getJSON(path+"updatecomponent.json", { avatarcomponentid: newcomponent.avcompid, componenttypeid: newcomponent.typeid()  }, function(json) {});
				});
				
				
				
				
				
			}
			else
			{
				$.getJSON(path+"svgs_android",{componentid:1},function(data){addType(data,hairType,"");});
				$.getJSON(path+"svgs_android",{componentid:2},function(data){addColor(data,hairColor,"");});
				$.getJSON(path+"svgs_android",{componentid:3},function(data){addColor(data,skinColor,"");});
				$.getJSON(path+"svgs_android",{componentid:4},function(data){addColor(data,eyeColor,"");});
				$.getJSON(path+"svgs_android",{componentid:5},function(data){addType(data,moustacheType,"");});
				$.getJSON(path+"svgs_android",{componentid:6},function(data){addType(data,noseType,"");});
				$.getJSON(path+"svgs_android",{componentid:7},function(data){addType(data,mouthType,"");});
				$.getJSON(path+"svgs_android",{componentid:8},function(data){addType(data,shirtType,"");});
				$.getJSON(path+"svgs_android",{componentid:9},function(data){addColor(data,shirtColor,"");});
				//INSTRUCTION $.getJSON(path+"svgs_android",{componentid:9},function(data){addColor(data,newcomponent,"");});
					
			}


           $.getJSON(path+"getavatar.json",{avatarid:avatar},	function(data) {
				
				var comp;
				$.each(data,function (index, value){
					comp=value.component_id;
					
					if (comp==1)
					{ 
						hairType.avcompid=value.id;
						hairType.locate(value.componenttype_id);
                        (document.getElementById("hair_type_ctype_id")).value=hairType.typeid();
                        (document.getElementById("hair_type_comp_id")).value=hairType.avcompid;

					}
					if (comp==2) 
					{ 
						hairColor.avcompid=value.id;
						hairColor.locate(value.componenttype_id);
                        (document.getElementById("hair_ctype_id")).value=hairColor.typeid();
                        (document.getElementById("hair_comp_id")).value=hairColor.avcompid;
					}
					if (comp==3) 
					{ 
						skinColor.avcompid=value.id;
						skinColor.locate(value.componenttype_id);
                        (document.getElementById("skin_ctype_id")).value=skinColor.typeid();
                        (document.getElementById("skin_comp_id")).value=skinColor.avcompid;
					}
					if (comp==4) 
					{ 
						eyeColor.avcompid=value.id;
						eyeColor.locate(value.componenttype_id);
                        (document.getElementById("eye_color_ctype_id")).value=eyeColor.typeid();
                        (document.getElementById("eye_color_comp_id")).value=eyeColor.avcompid;
					}
					if (comp==5) 
					{ 
						moustacheType.avcompid=value.id;
						moustacheType.locate(value.componenttype_id);
                        (document.getElementById("moustache_ctype_id")).value=moustacheType.typeid();
                        (document.getElementById("moustache_comp_id")).value=moustacheType.avcompid;
					}
					if (comp==6) 
					{ 
						noseType.avcompid=value.id;
						noseType.locate(value.componenttype_id);
                        (document.getElementById("nose_ctype_id")).value=noseType.typeid();
                        (document.getElementById("nose_comp_id")).value=noseType.avcompid;
					}
					if (comp==7) 
					{ 
						mouthType.avcompid=value.id;
						mouthType.locate(value.componenttype_id);
                        (document.getElementById("mouth_ctype_id")).value=mouthType.typeid();
                        (document.getElementById("mouth_comp_id")).value=mouthType.avcompid;
					}
					if (comp==8) 
					{ 
						shirtType.avcompid=value.id;
						shirtType.locate(value.componenttype_id);
                        (document.getElementById("shirttype_ctype_id")).value=shirtType.typeid();
                        (document.getElementById("shirttype_comp_id")).value=shirtType.avcompid;
					}
					if (comp==9) 
					{ 
						shirtColor.avcompid=value.id;
						shirtColor.locate(value.componenttype_id);
                        (document.getElementById("shirtcolor_ctype_id")).value=shirtColor.typeid();
                        (document.getElementById("shirtcolor_comp_id")).value=shirtColor.avcompid;
					}
					/* //INSTRUCTION if (comp==componentID) 
					{ 
						newcomponent.avcompid=value.id;
						newcomponent.locate(value.componenttype_id);
					}*/
				});

				var svgelem=document.getElementsByTagName("svg")[i];
				svgelem.innerHTML="<g class=\"Body\"><path id=\"path5\" fill=\"#FFD3B3\" d=\"M80.434,513.702h401.96c0,0,1.483-44.497-28.182-80.837c-29.665-36.339-58.04-50.063-80.837-62.296c-15.203-8.158-20.707-9.093-29.851-14.833c-9.725-6.104-8.712-32.308-10.383-45.053c-0.68-15.621-1.359-25.469-2.039-38.194l-114.581,26.884c0.947,10.058,2.535,21.444,2.596,29.665c-0.862,7.763-1.485,31.057-12.607,35.598c-11.004,4.493-40.444,16.058-56.734,22.249c-19.165,7.876-38.156,18.457-49.317,33.373c-11.35,15.167-15.957,28.963-17.799,44.126C80.456,482.519,80.434,513.702,80.434,513.702L80.434,513.702z\"/><path id=\"Face-8\" fill=\"#FFD3B3\" d=\"M203.334,323.991c0,0,76.873,22.928,136.888-33.042c60.016-55.969,51.356-132.379,47.878-159.814c-4.117-32.467-31.02-76.873-88.337-80.245c-57.318-3.372-98.452,2.697-122.728,32.367c-24.275,29.671-7.305,52.202-17.532,89.012c-4.861,17.494-19.556,50.574-18.207,74.85C142.644,271.395,151.41,307.808,203.334,323.991L203.334,323.991z\"/></g><g class=\"Right_Eye_White\"><path id=\"path3786-5\" fill=\"#FFFFFF\" d=\"M250.357,225.482c10.586,1.895,20.422-5.816,24.774-14.984 c7.773-13.894,13.138-30.986,7.438-46.608c-2.434-6.667-7.192-13.764-14.845-14.629c-8.021-1.44-14.824,4.341-19.892,9.803 c-9.818,10.753-12.754,25.879-12.921,40.007c0.247,9.753,3.982,20.644,12.938,25.628 C248.647,225.065,249.49,225.338,250.357,225.482z\"/></g> <g class=\"Left_Eye_White\"><path id=\"path3809-4\" fill=\"#FFFFFF\" d=\"M172.904,210.851c0,0,6.54,1.55,12.393-7.745c5.852-9.294,10.154-21.687,9.639-40.275 c-0.517-18.589-9.467-23.58-15.663-21.343s-13.425,13.598-16.352,25.646c-2.926,12.049-2.065,24.957-1.032,30.121 C162.921,202.417,167.224,209.474,172.904,210.851L172.904,210.851z\"/> </g> <g class=\"Eye_Color\"><path id=\"path3815-2\" fill=\"#000000\" d=\"M176.863,199.835c5.729,0.944,11.476-10.047,12.22-19.965c1.428-19.012-2.069-27.957-7.057-28.228 c-5.682-0.309-10.499,11.359-11.704,22.203S169.29,198.975,176.863,199.835z\"/><path id=\"path3817-1\"  fill=\"#000000\" d=\"M249.841,212.573c7.918,1.377,12.909-9.639,14.975-22.72s-1.894-25.99-7.573-27.367 s-12.909,12.221-14.286,23.236S241.924,211.024,249.841,212.573L249.841,212.573z\"/></g> <g class=\"Nose\"><path id=\"path3891-9\" fill=\"#FFD3B3\" d=\"M209.737,187.787c0,0-3.931,13.925-6.063,20.6c-1.037,3.246-14.592,20.881-13.559,23.807 c1.032,2.927,22.72,4.819,22.72,4.819s3.786-21.515,3.098-28.571S209.737,187.787,209.737,187.787z\"/></g> <g class=\"Ear\"><path id=\"path3893-9\" fill=\"#FFD3B3\" d=\"M320.906,178.9c0,0,11.681,5.191,9.826,17.243c-1.854,12.051-2.225,8.528-3.894,13.163 c-1.668,4.636,0.742,6.118-2.781,10.383c-3.522,4.265-9.27,7.046-9.27,7.046s9.826,10.012,15.944,1.298s2.225-6.86,5.006-11.866 s5.748-0.186,9.085-13.72c3.338-13.535,3.522-15.574-2.41-25.216C336.48,167.59,320.906,178.9,320.906,178.9L320.906,178.9z\"/></g><g class=\"Mouth\"><path id=\"Mouth-0\" fill=\"#FFFFFF\" fill-opacity=\"0.9647\" d=\"M265.841,260.849c0,0-61.926,13.35-73.421,12.236 c-11.495-1.112-35.969-22.248-35.969-22.248s17.799,28.923,33.744,31.519C206.139,284.951,265.841,260.849,265.841,260.849z\"/></g><g class=\"Hair\"><path id=\"path21\" fill=\"#E6B45E\" d=\"M163.119,32.668c-17.314,12.758-25.625,27.953-40.097,72.902 c-6.365,19.772-3.645,28.249-5.468,47.386c-1.63,17.117,8.202,59.233,8.202,59.233l11.847-15.491l7.29,18.226l15.491-43.742 l-2.733,41.008c13.053-29.166,13.95-65.626,39.185-87.482c10.297,27.394,8.693,56.771,4.557,86.571 c12.418-24.067,23.987-29.196,20.959-78.37c0.821,25.212,2.57,50.424,4.557,75.636c9.545-28.271,9.275-57.77,36.451-83.837 c12.035,14.201,13.144,37.77,8.201,66.523c13.728-13.932,24.954-29.649,21.871-55.588c10.242,0,3.037,85.709,2.733,89.305 c-0.681,8.081,24.397-98.495,10.024-103.886c8.087,13.366,18.131,23.602,14.58,55.588c10.434-2.839,19.234-4.046,20.049,2.734 c7.37,13.669,4.766,27.338,5.468,41.007l12.758-46.475l-14.581,86.571l23.693-51.942l-9.112,77.458l20.048-41.008l5.468,58.322 c0,0,24.604-77.459,20.048-136.691c-4.557-59.233-26.476-105.367-38.273-119.378c-29.161-34.628-59.284-14.401-53.766-17.313 c3.454-1.823-6.716-13.67-24.604-16.403c-17.518-1.907-31.128-5.78-65.612-0.911C194.179,16.598,189.716,16.448,163.119,32.668 L163.119,32.668z\"/></g> <g class=\"Moustache\"><path id=\"path21\" fill=\"#E6B45E\" /></g> <g class=\"Tshirt\"><path id=\"path25\" fill=\"#C42C2C\" d=\"M76.5,487.5c0,0-5-28,13.5-59s63.391-50.771,87.03-58.061 c23.47-7.238,36.53-13.172,36.53-13.172s-3.277,9.646-6.939,27.556C202.589,404.546,215.5,417,232.5,417.5s48.744-6.983,73.854-22.5 c24.494-15.138,37.432-42.771,37.237-43.207c0,0,11.208,10.894,24.247,16.01c23.03,9.036,45.359,18.337,62.161,31.697 c16.9,13.438,45.613,58.53,49.401,76.917c0.195,0.947-53.109,22.958-81.401,37.083L113,513L76.5,487.5z\"/></g>";
				//INSTRUCTION EDIT:default svg. must have all groups for javascript selection with class name.
                changeEyeColor(-1,i);
				changeSkinColor(-1,i);
				changeHairColor(-1,i);
				changeShirtColor(-1,i);
				changeHairType(-1,i);
				changeMoustacheType(-1,i);
				changeNoseType(-1,i);
				changeMouthType(-1,i);
				changeShirtType(-1,i);

				//INSTRUCTION changeCompName(-1);
			});

		}
	}
	
}
 
