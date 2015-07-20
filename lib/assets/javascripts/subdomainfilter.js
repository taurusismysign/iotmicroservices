var sources = ['FACEBOOK','TUMBLR','EMAIL','TWITTER','FEED','LINKEDIN','BROWSER','YOUTUBE','PINTEREST'];

function UpdateTimeLapse()
{	
	var a = moment();
	$('div[publishtime]').filter(function(){		
		var b = moment($(this).attr('publishtime'));
		$(this).removeAttr('publishtime');
		$(this).attr('calculatedtime',a.diff(b, 'days'));
	});
}

function FilterByTime(v)
{	
	$('div[calculatedtime]').filter(function(){
		if ($(this).attr('calculatedtime') > v)
			$(this).hide();
		else
			$(this).show();
	});	
}

function FilterBySource(v)
{
	var actn = "HIDE";
	if(v == "ALL")
		actn = "SHOW";
			
	for (var i=0; i<sources.length; i++) {
			Action(sources[i], actn);			
		}
	
	Action(v,"SHOW");
}

function Action(name, actn)
{
	if(actn == "SHOW")
		$('.source-'+name).show();
	else
		$('.source-'+name).hide();
}

function InitAdminControl()
{
	if(isadmin == 1)
	{
		$(".card-holder-singlecol").sortable({
            opacity: 0.8, connectWith: ".card-holder-singlecol",
            cursor: "crosshair",
            start: function (event, ui) {
                        ui.item.toggleClass("card-highlight");
                },
                stop: function (event, ui) {
                        ui.item.toggleClass("card-highlight");
            },
            receive: function(event, ui) {
	        	var myOrder = new Array();
	        	$(".card-holder-singlecol div.card").each(function() {
	            	myOrder.push($(this).attr("submission-string"));
	        	});
	        	console.log(myOrder.toString());  
	    	},
            update: function(event, ui) {
               
            }
        }).disableSelection();
    }
}

function UpdateAdminControl()
{
	if(isadmin == 1)
	{
		$('.portlet-contributor-actions').show();
		$('.take-form').show();		
    }
}

function ShowShareModal(l, t)
{
	LoadShareLinks('twitter','share_mag_twitter',t, l);
	LoadShareLinks('facebook','share_mag_facebook',t,l);
	LoadShareLinks('linkedin','share_mag_linkedin',t,l);
	LoadShareLinks('gplus','share_mag_gplus',t,l);
	LoadShareLinks('mail','share_mag_mail',t,l);
	
    $('#formshare').modal();
}

function ShowStoryModal()
{
    $("#story_area_status").hide();
    $("#story_area_error_status").hide();
    $("story_link").val('');
    $("#storydataholder").show();

    $('#formstory').modal();
}

function LoadShareLinks(sn,htmlelement,text,url)
{
	var hrefval = "";
	switch(sn)
	{
		case "twitter":
	  		hrefval = "https://twitter.com/intent/tweet?text=My take * " + text + "&url=" + url + "&source=netcurate&via=netcurate";
	  		break;
		case "facebook":
			hrefval = "https://www.facebook.com/sharer/sharer.php?u=" + url + "&t=" + text;
	  		break;
	  	case "linkedin":
	  		hrefval = "http://www.linkedin.com/shareArticle?mini=true&source=netcurate&url=" + url + "&title=" + text;
      		break;
      	case "gplus":
      		hrefval = "https://plus.google.com/share?url=" + url;
      		break;
      	case "mail":
      		hrefval = "mailto:?subject=" + text + "&body=" + url;
			break;
	}
	
	if(hrefval.length > 0) {
		$("#"+htmlelement).attr("href",hrefval);
	}
}

function ShowTakeModal(t)
{
	$('#take_area').val("");
    
    $('#take_submission_id').val(t.parent().parent().parent().attr("submission-string"));

    var an = t.parent().parent().find('h3').find('a');

	LoadShareLinks('twitter','take_share_twitter',"My take * " + an.html(), an.attr("href"));
	LoadShareLinks('facebook','take_share_facebook',"My take * " + an.html(), an.attr("href"));
	LoadShareLinks('linkedin','take_share_linkedin',"My take * " + an.html(), an.attr("href"));
	LoadShareLinks('gplus','take_share_gplus',"My take * " + an.html(), an.attr("href"));
	LoadShareLinks('mail','take_share_mail',"My take * " + an.html(), an.attr("href"));
	
	
    $("#take_area_status").hide();
    $("#take_area_error_status").hide();
    $("textarea#take_area").val('');
    $("#takedataholder").show();
    $("#takesocialholder").hide();
    
    $('#formtake').modal();
}
   	
   
function ResetLiveSection()
{
	$("#div_live_stories").show();
	$("#div_draft_stories").hide();
		
	$('.card-holder-singlecol').empty();
	$('.pagination').empty();
	
	$( "#btn_show_stories_draft" ).removeClass("btn green").addClass("btn");
	$( "#btn_show_stories_live" ).removeClass("btn").addClass("btn green");
}
   
function ResetDraftSection()
{
 	$("#div_live_stories").hide();
	$("#div_draft_stories").show();

	$('.draft-card-holder-singlecol').empty();
	$('.draft_pagination').remove();

	$( "#btn_show_stories_live" ).removeClass("btn green").addClass("btn");
	$( "#btn_show_stories_draft" ).removeClass("btn").addClass("btn green");
}


