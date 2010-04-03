/*
 * jQuery Transitions Plugin v0.0.2
 * http://whynotonline.com/
 *
 * Copyright (c) 2009 Nivanka Fonseka
 * BSD licenses.
 * http://open.whynotonline.com/license/
 * 
 * This plugin is a for which you can use to add different find of transitions to your webpage.
 * Feel free to use this on your websites, but please leave this message in the files
 */

$Transitions = {
	Box : []	
}
   

jQuery.fn.transition = function($options) {
	

	var defaults = {
		duration : 5000,
		images : [],
		type : 'default'
	};
	
	$current = jQuery(this);
	
	jQuery.extend(defaults, $options);
	

	
	for(i = 0; i < defaults['images'].length; i++){ 
		$div = jQuery('<div></div>');
		$style = 'width:' + $current.width() + 'px; height: ' + $current.height() + 'px; background:url(' + defaults['images'][i] + ');';
		
		if(defaults['type'] != 'tinker')
			$style +='position:absolute;';
		
		if(i != 0){
			$style += 'display:none;';	
		}
		else{
			$style += 'display:block;';
		}
		
		$div.attr('style', $style);
		$div.addClass('transitionRotator-' + i);
		$div.addClass('transitionRotator');
		$current.append($div);
		
		$height = $current.height();
		
		$Transitions['Box'][$current.attr('id')] = {
		    $id : $current.attr('id'),
			$TransitionCurrent : 0,
			$TransitionItems : defaults['images'].length,
			$speed : defaults['duration'] / 3,
			$currentMargin : 0,
			$maxTopMargin : $height * defaults['images'].length * -1
		   };
		
	}
	
	if(defaults['type'] == 'fade')
		setInterval ( "transitionRotatorFade('" + $current.attr('id') +  "')", defaults['duration'] );
	else if(defaults['type'] == 'tinker')
		transitionRotatorTinker($current.attr('id') , defaults['duration']);
	else
		setInterval ( "transitionRotator('" + $current.attr('id') + "')", defaults['duration'] );
	
	
}

function transitionRotatorFade($id){	
	if($Transitions['Box'][$id]['$TransitionCurrent'] < ($Transitions['Box'][$id]['$TransitionItems'] - 1)){ 
		jQuery('#' + $id +'>.transitionRotator-' + $Transitions['Box'][$id]['$TransitionCurrent']).fadeOut($Transitions['Box'][$id]['$speed']);
		 $Transitions['Box'][$id]['$TransitionCurrent'] =  $Transitions['Box'][$id]['$TransitionCurrent'] + 1;
		jQuery('#' + $id +'>.transitionRotator-' + $Transitions['Box'][$id]['$TransitionCurrent']).fadeIn($Transitions['Box'][$id]['$speed']);
	}
	else{
		jQuery('#' + $id +'>.transitionRotator-' +  $Transitions['Box'][$id]['$TransitionCurrent']).fadeOut($Transitions['Box'][$id]['$speed']);
		 $Transitions['Box'][$id]['$TransitionCurrent'] =  0;
		jQuery('.transitionRotator-' +  $Transitions['Box'][$id]['$TransitionCurrent']).fadeIn($Transitions['Box'][$id]['$speed']);
	}
}

function transitionRotatorTinker($id, $duration){
	jQuery('#' + $id +'>.transitionRotator').show();
	$Transitions['Box'][$id]['$maxTopMargin'] = $height *$Transitions['Box'][$id]['$TransitionItems'] * -1;
	
	setInterval("moveTop('" + $id + "')", $duration);
}

function moveTop($id){
	if($Transitions['Box'][$id]['$maxTopMargin'] + (jQuery('.transitionRotator-' + $Transitions['Box'][$id]['$TransitionCurrent']).height()) <= $Transitions['Box'][$id]['$currentMargin']){
		$Transitions['Box'][$id]['$currentMargin'] = $Transitions['Box'][$id]['$currentMargin'] - 1;
		$style = jQuery('#' + $id +'>.transitionRotator-0').css('margin-top',$Transitions['Box'][$id]['$currentMargin'] + 'px');
	}
	else{
		$Transitions['Box'][$id]['$currentMargin'] = 0;//jQuery('.transitionRotator-' + $TransitionCurrent).height();
		$style = jQuery('#' + $id +'>.transitionRotator-0').css('margin-top',$Transitions['Box'][$id]['$currentMargin'] + 'px');
	}
	
}

function transitionRotator($id){	
	if($Transitions['Box'][$id]['$TransitionCurrent'] < ($Transitions['Box'][$id]['$TransitionItems'] - 1)){ 
		jQuery('#' + $id +'>.transitionRotator-' + $Transitions['Box'][$id]['$TransitionCurrent']).hide($Transitions['Box'][$id]['$speed']);
		$Transitions['Box'][$id]['$TransitionCurrent'] = $Transitions['Box'][$id]['$TransitionCurrent'] + 1;
		jQuery('#' + $id +'>.transitionRotator-' + $Transitions['Box'][$id]['$TransitionCurrent']).show($Transitions['Box'][$id]['$speed']);
	}
	else{
		jQuery('#' + $id +'>.transitionRotator-' + $Transitions['Box'][$id]['$TransitionCurrent']).hide($Transitions['Box'][$id]['$speed']);
		$Transitions['Box'][$id]['$TransitionCurrent'] = 0;
		jQuery('#' + $id +'>.transitionRotator-' + $Transitions['Box'][$id]['$TransitionCurrent']).show($Transitions['Box'][$id]['$speed']);
	}
}