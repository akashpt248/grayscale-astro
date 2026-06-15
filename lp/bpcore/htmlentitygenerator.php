<?php
function mapArraytoSelect($arr,$attributes='',$title='',$default='NO-DEFAULT',$selecttitle="SELECT"){
	$a='
	<!--'.$title.' Starts-->

	<select  '.$attributes.'  >
	';

	if(is_array($arr)){
		$a.='<option value=""> ---'.$selecttitle.'---  </option>';

		foreach ($arr as $k => $val) {
			$a.= '<option '.(($default==$val)? "selected":"").' value="'.$val.'">'.$val.'</option>';
		}
	}else{
		$a.= '<option value="">NO-DATA</option>';

	}
	$a.='</select>

	<!--'.$title.' Ends-->

	';

	return $a;

}

function mapArraytoSelectFromSystemconfig($arr,$attributes='',$title='',$default='NO-DEFAULT',$selecttitle="SELECT"){
	$a='
	<!--'.$title.' Starts-->

	<select  '.$attributes.'  >
	';

	if(is_array($arr)){
		$a.='<option value=""> ---'.$selecttitle.'---  </option>';

		foreach ($arr as $k => $val) {
			$a.= '<option '.(($default==$val['configvalue'])? "selected":"").' value="'.$val['configvalue'].'">'.$val['configname'].'</option>';
		}
	}else{
		$a.= '<option value="">NO-DATA</option>';

	}
	$a.='</select>

	<!--'.$title.' Ends-->

	';

	return $a;

}

function mapArraytoSelectValueName($arr,$valuelabel,$namelabel,$attributes='',$title='',$default='NO-DEFAULT',$selecttitle="SELECT"){
	$a='
	<!--'.$title.' Starts-->

	<select  '.$attributes.'  >
	';

	if(is_array($arr)){
		$a.='<option value=""> ---'.$selecttitle.'---  </option>';

		foreach ($arr as $k => $val) {
			$a.= '<option '.(($default==$val[$valuelabel])? "selected":"").' value="'.$val[$valuelabel].'">'.$val[$namelabel].'</option>';
		}
	}else{
		$a.= '<option value="">NO-DATA</option>';

	}
	$a.='</select>

	<!--'.$title.' Ends-->

	';

	return $a;

}


 

?>