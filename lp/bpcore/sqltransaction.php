<?php
date_default_timezone_set("Asia/Calcutta"); 

function random_color_part() {
  return str_pad( dechex( mt_rand( 0, 127 ) ), 2  , '0', STR_PAD_LEFT);
}

function random_color() {
  return random_color_part() . random_color_part() . random_color_part();
}


function stringTruncate($string, $limit, $break=".", $pad="...")
{
  if(strlen($string) <= $limit) return $string;

  if(false !== ($breakpoint = strpos($string, $break, $limit))) {
    if($breakpoint < strlen($string) - 1) {
      $string = substr($string, 0, $breakpoint) . $pad;
    }
  }

  return $string;
}


function hscEncode($str,$encode=ENT_QUOTES){
  return htmlspecialchars($str,$encode);
}

// function hscDecode($str,$encode=ENT_QUOTES){
//   return htmlspecialchars_decode($str,$encode);
// }
function hscDecode($str, $encode = ENT_QUOTES) {
  return htmlspecialchars_decode($str ?? '', $encode);
}

function revealldata($data){
  return hscEncode($data);
}

function existOrEmpty($data){
   if(isset($data)){
       return $data;

   }else{
    return "";
   }
}
 

function extractAlphaNumHypen($str){
 return preg_replace("/[^A-Za-z0-9-]/", '', $str);
}

function makeLowerAlphaNumHypen($str){
  $str=(str_replace(' ', '-', strtolower($str)));
  return extractAlphaNumHypen($str);
}
function makeHypenToNormal($str){
  $str=str_replace('-', ' ', $str);
  return ($str);
}



function gen_uuid() {
  return sprintf( '%04x%04x-%04x-%04x-%04x-%04x%04x%04x',
        // 32 bits for "time_low"
    mt_rand( 0, 0xffff ), mt_rand( 0, 0xffff ),

        // 16 bits for "time_mid"
    mt_rand( 0, 0xffff ),

        // 16 bits for "time_hi_and_version",
        // four most significant bits holds version number 4
    mt_rand( 0, 0x0fff ) | 0x4000,

        // 16 bits, 8 bits for "clk_seq_hi_res",
        // 8 bits for "clk_seq_low",
        // two most significant bits holds zero and one for variant DCE1.1
    mt_rand( 0, 0x3fff ) | 0x8000,

        // 48 bits for "node"
    mt_rand( 0, 0xffff ), mt_rand( 0, 0xffff ), mt_rand( 0, 0xffff )
  );
}




function make_thumb($src, $dest, $desired_width) {

  /* read the source image */
  $source_image = imagecreatefromjpeg($src);
  $width = imagesx($source_image);
  $height = imagesy($source_image);
  
  /* find the "desired height" of this thumbnail, relative to the desired width  */
  $desired_height = floor($height * ($desired_width / $width));
  
  /* create a new, "virtual" image */
  $virtual_image = imagecreatetruecolor($desired_width, $desired_height);
  
  /* copy source image at a resized size */
  imagecopyresampled($virtual_image, $source_image, 0, 0, 0, 0, $desired_width, $desired_height, $width, $height);
  
  /* create the physical thumbnail image to its destination */
  imagejpeg($virtual_image, $dest);
}

function qbSectionWiseRender($section,$examid){
 $sqlRec=" WHERE questionbank_xamconsoleXC.qbstatus= 0 && questionbank_xamconsoleXC.qbsection='".$section."' && questionsheet_xamconsoleXC.examid='".$examid."' ";

 $datatable=joinTables('questionsheet_xamconsoleXC.id,questionsheet_xamconsoleXC.qbankid,questionbank_xamconsoleXC.qbid,questionbank_xamconsoleXC.qbtype,questionbank_xamconsoleXC.qbquestion,questionbank_xamconsoleXC.id ,questionbank_xamconsoleXC.qbsection','questionsheet_xamconsoleXC','questionbank_xamconsoleXC','INNER','questionsheet_xamconsoleXC.qbankid','questionbank_xamconsoleXC.id',$sqlRec,1);
 return $datatable;
}


function qbSectionWiseElementsCount($section,$examid){
 $sqlRec=" WHERE questionbank_xamconsoleXC.qbstatus= 0 && questionbank_xamconsoleXC.qbsection='".$section."' && questionsheet_xamconsoleXC.examid='".$examid."' ";

 $datatable=joinTables('questionsheet_xamconsoleXC.id,questionsheet_xamconsoleXC.qbankid,questionbank_xamconsoleXC.qbid,questionbank_xamconsoleXC.qbtype,questionbank_xamconsoleXC.qbquestion,questionbank_xamconsoleXC.id ,questionbank_xamconsoleXC.qbsection','questionsheet_xamconsoleXC','questionbank_xamconsoleXC','INNER','questionsheet_xamconsoleXC.qbankid','questionbank_xamconsoleXC.id',$sqlRec,2);
 return $datatable;
}


function qbAnswerFetch($examid){


  $sqlwhere=" WHERE questionbank_xamconsoleXC.qbstatus= 0  && questionsheet_xamconsoleXC.examid='".$examid."' ";

  $datatable=joinTables('questionsheet_xamconsoleXC.id,questionbank_xamconsoleXC.qbanswer','questionsheet_xamconsoleXC','questionbank_xamconsoleXC','INNER','questionsheet_xamconsoleXC.qbankid','questionbank_xamconsoleXC.id',$sqlwhere,1);
  return $datatable;

}

function checkExistence($primarykey,$check_field,$check_value,$table,$additional='',$type='s' ){
  require __DIR__.'/db-connect.php';
  $error_msg="";
  $prep_stmt = "SELECT ".$primarykey." FROM `".$table."` WHERE ".$check_field." = ?  ".$additional."  LIMIT 1";
  $stmt = $mysqli->prepare($prep_stmt);

       // check existing email
  if ($stmt) {
    $stmt->bind_param($type, $check_value);
    $stmt->execute();
    $stmt->store_result();

    if ($stmt->num_rows == 1) {
      $error_msg = 'Record already exists.';
      $stmt->close();
    }
  } else {
    $error_msg = 'Database error';
    $stmt->close();
  }

  return $error_msg;

}

function rowcount($check_field,$check_value,$table,$additional='',$type='s' ){
  require __DIR__.'/db-connect.php';

  $prep_stmt = "SELECT ".$check_field." FROM `".$table."` WHERE ".$check_field." = ?  ".$additional."  ";
  $stmt = $mysqli->prepare($prep_stmt);

  if ($stmt) {
    $stmt->bind_param($type, $check_value);
    $stmt->execute();
    $stmt->store_result();
    $data=$stmt->num_rows;
    $stmt->close();
  } else {
    $data =-1;
    $stmt->close();
  }

  return $data;

}



function orderstatus($outvalue,$invalue,$table='ordercart',$outcol='ostatus',$incol='oid',$additional=''){
  require __DIR__.'/db-connect.php';

  $sql = "UPDATE ".$table." SET ".$outcol." = '".$outvalue."' WHERE ".$incol." = '".$invalue."' ".$additional;
  if ($result = $mysqli->query($sql)) {

    return 1;
  } else {
    return 0;
  }

  $mysqli->close();

}


function updatecell($table,$outcol,$outvalue,$incol,$invalue,$additional=''){
  require __DIR__.'/db-connect.php';

  $sql = "UPDATE ".$table." SET ".$outcol." = '".$outvalue."' WHERE ".$incol." = '".$invalue."' ".$additional;
  if ($result = $mysqli->query($sql)) {

    return 1;
  } else {
    return 0;
  }

  $mysqli->close();

}

function serialtoarray($serial){

  $unserialised=unserialize($serial);

  $data='<table class="table">';

  foreach ($unserialised as $key => $value) {

    $data.= '<tr> <td>'.($key+1).'</td>';

    foreach ($value as $k => $val) {

      $data.= '<td>'.$val.'</td>';

    }

    $data.= '</tr>';


  }
  return  $data;
}

function shipaddress($serial){
  $unserialised=unserialize($serial);
  $data='<table class="table">';
  foreach ($unserialised as $key => $value) {

    $data.= '<tr>  ';


    $data.= '<td>'.$value.'</td>';


    $data.= '</tr>';


  }
  $data.= '</table>';


  return  $data;
}


function remarkdisp($serial){
  include_once 'urlns.php';
  if (empty($serial)) {
    return 'NO COMMENT';
  }

    // $unserialised=unserialize($serial);
  $unserialised= unserialize(base64_decode($serial));
  $data='<table class="table">';
  $data.=
  '<thead>
  <tr>
  <th>SN</th>
  <th>ODR STATUS</th>
  <th>ODR COMMENT</th>
  <th>NOTIFICATION</th>
  <th>ODR ID</th>
  <th>TIMESTAMP</th>

  </tr>


  </thead>
  <tbody>
  ';
  foreach ($unserialised as $key => $value) {

    $data.= '<tr> <td>'.($key+1).'</td>';

    foreach ($value as $k => $val) {

      $data.= '<td>'.$val.'</td>';

    }

    $data.= '</tr>';



  }
  $data.= '</tbody></table>';

  return  $data;
}


function orderdata($serial){
  include_once 'urlns.php';

  $unserialised=unserialize($serial);
  $data='<table class="table">';
  $data.=
  '<thead>
  <tr>
  <th>SN</th>
  <th>Ref</th>
  <th>Item</th>
  <th>Qty</th>
  <th>Price</th>
  <th>SKU</th>
  <th>Image</th>
  </tr>


  </thead>
  <tbody>
  ';
  foreach ($unserialised as $key => $value) {

    $data.= '<tr> <td>'.($key+1).'</td>';

    foreach ($value as $k => $val) {

      $data.= '<td>'.$val.'</td>';

    }

    $data.= '<td>'.extract_cell('sku','pid',$value[0],'product').'</td>';

    $data.= '<td><img width="80px" src="'.THUMBNAIL_URL.extract_cell('pthumb','pid',$value[0],'product').'"/></td>';

    $data.= '</tr>';



  }
  $data.= '</tbody></table>';

  return  $data;
}



//new img compressible

function resize($newWidth, $targetFile, $originalFile) {

  $info = getimagesize($originalFile);
  $mime = $info['mime'];

  switch ($mime) {
    case 'image/jpeg':
    $image_create_func = 'imagecreatefromjpeg';
    $image_save_func = 'imagejpeg';
    $new_image_ext = 'jpg';
    break;

    case 'image/png':
    $image_create_func = 'imagecreatefrompng';
    $image_save_func = 'imagepng';
    $new_image_ext = 'png';
    break;

    case 'image/gif':
    $image_create_func = 'imagecreatefromgif';
    $image_save_func = 'imagegif';
    $new_image_ext = 'gif';
    break;

    default: 
    throw new Exception('Unknown image type.');
  }

  $img = $image_create_func($originalFile);
  list($width, $height) = getimagesize($originalFile);

  $newHeight = ($height / $width) * $newWidth;
  $tmp = imagecreatetruecolor($newWidth, $newHeight);
  imagecopyresampled($tmp, $img, 0, 0, 0, 0, $newWidth, $newHeight, $width, $height);

  if (file_exists($targetFile)) {
    unlink($targetFile);
  }
  $image_save_func($tmp, "$targetFile");
}

function raw_img_upload( $imgfiles, $gal_id,$noserialize=0, $imgquality=100, $newimgwidth=0,$prefixname="Ed_", $target_dir = "../../imgserver/uploads/attachments/"){
  //require __DIR__.'/db-connect.php';
 $ext = pathinfo($imgfiles['name'], PATHINFO_EXTENSION);
 if($ext ==''){
  switch ($imgfiles['type']) {
    case 'image/jpeg':
    $ext='jpg';
    break;
    case 'image/png':
    $ext='png';
    break;
    default:
    $ext='';

  }
}
$target_file = $target_dir.$prefixname."_".$gal_id."_.".$ext;
if(move_uploaded_file($imgfiles['tmp_name'],$target_file)){
 return $target_file;
}


}


function compressed_img_upload( $imgfiles, $gal_id,$noserialize=0, $imgquality=100, $newimgwidth=0,$prefixname="pcm_", $target_dir = "../../imgserver/uploads/attachments/"){
  //require __DIR__.'/db-connect.php';
  $a=array();
  $images_arr = array();
  $uploadimgFlag=0;

  if(!empty($imgfiles['error'])){
    if(is_array($imgfiles['error'])){
      foreach($imgfiles['error'] as $key=>$val){
        if( $val ==0){
          $uploadimgFlag=1;
        }
      }
    } else{
      if( $imgfiles['error'] ==0){
        $uploadimgFlag=1;
      }
    }
  }



  if($uploadimgFlag==1){

    foreach($imgfiles['name'] as $key=>$val){
          //upload and stored images
      $filename_new=$imgfiles['name'][$key];
      $ext = pathinfo($filename_new, PATHINFO_EXTENSION);
      if($ext ==''){
        switch ($imgfiles['type'][$key]) {
          case 'image/jpeg':
          $ext='jpg';
          break;
          case 'image/png':
          $ext='png';
          break;
          default:
          $ext='';

        }
      }

      $target_file = $target_dir.$prefixname."_".$gal_id."_".$key.".".$ext;
      if(move_uploaded_file($imgfiles['tmp_name'][$key],$target_file)){
        // $target_file=$target_file."?rt=".time();
        $images_arr[] = $target_file;

        $filename = $target_file;
        list($wid, $hght) = getimagesize($filename);

       //  if($newimgwidth==0){
       //    if($wid >3840){
       //      resize(3840, $filename, $filename);

       //    }else{
       //      resize($wid, $filename, $filename);

       //    }
       //  }
       //  else{
       //   // resize($newimgwidth, $filename, $filename);

       // }

     }
   }
   if(!empty($images_arr )){ 
     if(count($images_arr)==1 && $noserialize==1 ){
       return $target_file;

     }else{
      if(!$noserialize)
        $img_serialize = serialize($images_arr);
      else
        $img_serialize = ($images_arr);

      return $img_serialize;
    }

  }
  else{
    return 'No Data';
  }

}else{
  return '';
}

}



    // compressible img end

function file_pdf_upload( $imgfiles, $gal_id,$noserialize=0,$prefixname="ugxcms", $target_dir = "../../imgserver/uploads/attachments/"){
  require __DIR__.'/db-connect.php';

  $a=array();
  $images_arr = array();
  $uploadimgFlag=0;

  if(!empty($imgfiles['error'])){
    if(is_array($imgfiles['error'])){
      foreach($imgfiles['error'] as $key=>$val){
        if( $val ==0){
          $uploadimgFlag=1;
        }
      }
    } else{
      if( $imgfiles['error'] ==0){
        $uploadimgFlag=1;
      }
    }
  }



  if($uploadimgFlag==1){

    foreach($imgfiles['name'] as $key=>$val){
          //upload and stored images
      $filename_new=$imgfiles['name'][$key];
      $ext = pathinfo($filename_new, PATHINFO_EXTENSION);
      if($ext == "pdf"){
        $target_file = $target_dir.$prefixname."_".$gal_id."_".$key.".".$ext;
        if(move_uploaded_file($imgfiles['tmp_name'][$key],$target_file)){
         $images_arr[] = $target_file;

         $filename = $target_file;
       }
     }

   }
   if(!empty($images_arr )){ 
     if(count($images_arr)==1 && $noserialize==1 ){
       return $target_file;

     }else{
      if(!$noserialize)
        $img_serialize = serialize($images_arr);
      else
        $img_serialize = ($images_arr);

      return $img_serialize;
    }

  }
  else{
    return 'No Data';
  }

}else{
  return '';
}

}

function file_choose_upload($filetype, $imgfiles, $gal_id,$noserialize=0,$prefixname="ugxcms", $target_dir = "../../imgserver/uploads/attachments/"){
  require __DIR__.'/db-connect.php';

  $a=array();
  $images_arr = array();
  $uploadimgFlag=0;

  if(!empty($imgfiles['error'])){
    if(is_array($imgfiles['error'])){
      foreach($imgfiles['error'] as $key=>$val){
        if( $val ==0){
          $uploadimgFlag=1;
        }
      }
    } else{
      if( $imgfiles['error'] ==0){
        $uploadimgFlag=1;
      }
    }
  }



  if($uploadimgFlag==1){

    foreach($imgfiles['name'] as $key=>$val){
          //upload and stored images
      $filename_new=$imgfiles['name'][$key];
      $ext = pathinfo($filename_new, PATHINFO_EXTENSION);
      if(in_array($ext, $filetype)){
        $target_file = $target_dir.$prefixname."_".$gal_id."_".$key.".".$ext;
        if(move_uploaded_file($imgfiles['tmp_name'][$key],$target_file)){
         $images_arr[] = $target_file;

         $filename = $target_file;
       }
     }

   }
   if(!empty($images_arr )){ 
     if(count($images_arr)==1 && $noserialize==1 ){
       return $target_file;

     }else{
      if(!$noserialize)
        $img_serialize = serialize($images_arr);
      else
        $img_serialize = ($images_arr);

      return $img_serialize;
    }

  }
  else{
    return 'No Data';
  }

}else{
  return '';
}

}

function sql_query_raw($query ){
  require __DIR__.'/db-connect.php';
  $insert_stmt = $mysqli->query($query); 
  echo $mysqli->error;
}

function sql_query_fetch($query) {
    require __DIR__ . '/db-connect.php';

    $result = $mysqli->query($query);

    if (!$result) {
        echo $mysqli->error;
        return [];
    }

    return $result->fetch_all(MYSQLI_ASSOC);
}


function insert_group($table_name,$table_col,$var_element ){
  require __DIR__.'/db-connect.php';

//vunerable

  if($var_element!=''){

    $insert_query='INSERT INTO `'.$table_name.'` ('.$table_col.') VALUES ('.$var_element.')';
    $insert_stmt = $mysqli->query($insert_query); 

  }


}



function insert_value($table_name,$table_col,$var_element ){
  require __DIR__.'/db-connect.php';



  if($var_element!=''){

    $insert_query='INSERT INTO '.$table_name.' ('.$table_col.') VALUES (?)';
    $insert_stmt = $mysqli->prepare($insert_query); 
    $insert_stmt->bind_param('s',$var_element);
    $insert_stmt->execute();
    $insert_stmt->close();
  }


}

function insert_value_table_element($method_type,$parameter_val,$data_type,$table_name,$table_col ){
  require __DIR__.'/db-connect.php';

  if($method_type=='POST'){
    if(isset($_POST[$parameter_val])){
      switch ($data_type) {
        case 'string':
        $var_element=filter_input(INPUT_POST,$parameter_val, FILTER_SANITIZE_STRING);
        break;

        case 'number':
        $var_element=filter_input(INPUT_POST,$parameter_val , FILTER_SANITIZE_NUMBER_INT);
        break;

      }

      if($var_element!=''){

        $insert_query='INSERT INTO '.$table_name.' ('.$table_col.') VALUES (?)';
        $insert_stmt = $mysqli->prepare($insert_query); 
        $insert_stmt->bind_param('s',$var_element);
        $insert_stmt->execute();
        $insert_stmt->close();
      }
    }

  }else {

    if(isset($_GET[$parameter_val])){
      switch ($data_type) {
        case 'string':
        $var_element=filter_input(INPUT_GET,$parameter_val, FILTER_SANITIZE_STRING);
        break;

        case 'number':
        $var_element=filter_input(INPUT_GET,$parameter_val , FILTER_SANITIZE_NUMBER_INT);
        break;

      }
      if($var_element!=''){

        $insert_query='INSERT INTO '.$table_name.' ('.$table_col.') VALUES (?)';
        $insert_stmt = $mysqli->prepare($insert_query); 
        $insert_stmt->bind_param('s',$var_element);
        $insert_stmt->execute();
        $insert_stmt->close();
      }


    }

  }  
}


function update_value( $var_element,$table_name,$table_col,$table_primary_key,$table_primary_val,$dtype='s',$additional=" " ){
  require __DIR__.'/db-connect.php';


  if($var_element!='' && $dtype=='s'){

    $update_query="UPDATE ".$table_name."  SET ".$table_col."= '". $var_element."'  WHERE ".$table_primary_key." = '".$table_primary_val."' ".$additional;

    $update_stmt = $mysqli->query($update_query); 

  }else {
   $update_query="UPDATE ".$table_name."  SET ".$table_col."= ". $var_element."  WHERE ".$table_primary_key." = '".$table_primary_val."' ".$additional;

   $update_stmt = $mysqli->query($update_query); 

 }

}

function update_set_value( $set_data,$table_name,$table_primary_key,$table_primary_val ){
  require __DIR__.'/db-connect.php';


  if($set_data!=''){

    $update_query="UPDATE ".$table_name."  SET ".$set_data."  WHERE ".$table_primary_key." = '".$table_primary_val."' ";

    $update_stmt = $mysqli->query($update_query); 

  }

}

     // update_value('STUDENT','members','user_type','userid','MEM_5d4d407f49934' );


function update_value_table_element($method_type,$parameter_val,$data_type,$table_name,$table_col,$table_primary_key,$table_primary_val ){
  require __DIR__.'/db-connect.php';
  include_once 'urlns.php';

  if($method_type=='POST'){
    if(isset($_POST[$parameter_val])){
      switch ($data_type) {
        case 'string':
        $var_element=filter_input(INPUT_POST,$parameter_val, FILTER_SANITIZE_STRING);
        break;

        case 'number':
        $var_element=filter_input(INPUT_POST,$parameter_val , FILTER_SANITIZE_NUMBER_INT);
        break;

        // no need of below code for Thumbnail since it is single file & having id as its filename thus no use of database update

        case 'image_thumb':
        $var_element_thumbnail=filter_input(INPUT_POST,$parameter_val , FILTER_SANITIZE_STRING);

        $var_element_data=$var_element_thumbnail;
        if(!empty($var_element_data)){    

          $update_query='UPDATE '.$table_name.'  SET '.$table_col.'=? WHERE '.$table_primary_key.' = ?';
          $update_stmt = $mysqli->prepare($update_query); 
          $update_stmt->bind_param('ss',$var_element_data,$table_primary_val);
          $update_stmt->execute();
          $update_stmt->close();

        }
        break;

      }

      if($var_element!=''){


        $update_query='UPDATE '.$table_name.'  SET '.$table_col.'=? WHERE '.$table_primary_key.' = ?';
        $update_stmt = $mysqli->prepare($update_query); 
        $update_stmt->bind_param('ss',$var_element,$table_primary_val);
        $update_stmt->execute();
        $update_stmt->close();
      }
    }

  }else if($method_type=='GET'){

    if(isset($_GET[$parameter_val])){
      switch ($data_type) {
        case 'string':
        $var_element=filter_input(INPUT_GET,$parameter_val, FILTER_SANITIZE_STRING);
        break;

        case 'number':
        $var_element=filter_input(INPUT_GET,$parameter_val , FILTER_SANITIZE_NUMBER_INT);
        break;


        // no need of below code for Thumbnail since it is single file & having id as its filename thus no use of database update

        case 'image_thumb':
        $var_element_thumbnail=filter_input(INPUT_GET,$parameter_val , FILTER_SANITIZE_STRING);

        $var_element_data=$var_element_thumbnail;
        if(!empty($var_element_data)){    
          $update_query='UPDATE '.$table_name.'  SET '.$table_col.'=? WHERE '.$table_primary_key.' = ?';
          $update_stmt = $mysqli->prepare($update_query); 
          $update_stmt->bind_param('ss',$var_element_data,$table_primary_val);
          $update_stmt->execute();
          $update_stmt->close();
        }
        break;




      }
      if($var_element!=''){

        $update_query='UPDATE '.$table_name.'  SET '.$table_col.'=? WHERE '.$table_primary_key.' = ?';
        $update_stmt = $mysqli->prepare($update_query); 
        $update_stmt->bind_param('ss',$var_element,$table_primary_val);
        $update_stmt->execute();
        $update_stmt->close();        
      }


    }

  } else{


    if(array_sum($_FILES[$parameter_val]['error']) == 0){
      switch ($data_type) {
        case 'images':
        break;
      }

      $images_arr = array();
      $counter=1;
      foreach($_FILES[$parameter_val]['name'] as $key=>$val){

        $up_filename=$table_primary_val."_".$counter.".".pathinfo($_FILES['images']['name'][$key],PATHINFO_EXTENSION);
        $target_file = IMAGE_NEWS_TARGET_DIR.IMAGE_NEWS_TARGET_PREFIX.$up_filename;
        $counter++;
        if(move_uploaded_file($_FILES['images']['tmp_name'][$key],$target_file)){
          $images_arr[] = $up_filename;
        }
      }

      $serialize_imgs = serialize($images_arr);

      if(!empty($serialize_imgs)){

        $update_query='UPDATE '.$table_name.'  SET '.$table_col.'=? WHERE '.$table_primary_key.' = ?';
        $update_stmt = $mysqli->prepare($update_query); 
        $update_stmt->bind_param('ss',$serialize_imgs,$table_primary_val);
        $update_stmt->execute();
        $update_stmt->close();
      }

    }



  }
}


function deletefile($Img)
{
  if( $images = @unserialize($Img))
  {
   $images = unserialize($Img);
   if(!empty($images)){

    foreach($images as $image_src)
    {
      unlink($image_src);                        
    }

  }
} 
else{
  unlink($Img);
}

}



function droprecord($table,$col,$value,$additional=''){
  require __DIR__.'/db-connect.php';

  $insert_stmt = $mysqli->prepare("DELETE FROM `".$table."` WHERE ".$col." = ? ". $additional); 
  $insert_stmt->bind_param('s', $value);
  $insert_stmt->execute();
  $insert_stmt->close();
}


function extract_cell($outcol,$incol,$invalue,$table,$additional=''){
  require __DIR__.'/db-connect.php';

  $sql = "SELECT ".$outcol." FROM ".$table." WHERE ".$incol." = '".$invalue."' ".$additional;
  $result = $mysqli->query($sql);
  if ($result->num_rows > 0) {
    if($row = $result->fetch_assoc()) {
     $output=$row[$outcol]; 
   }
   return $output;
 } else {
   return "NO-DATA";
 }

 $mysqli->close();

}

function joinTables($selectcols,$jointa,$jointb,$jointtype,$pkey,$fkey, $additional='',$sizeflg=1){
  require __DIR__.'/db-connect.php';
  $output=[];
  $sql = "SELECT ".$selectcols." FROM `".$jointa."` ".$jointtype." JOIN `".$jointb."` ON  ".$pkey." = ".$fkey." " .$additional ;
  $result = $mysqli->query($sql);
  if ($result->num_rows > 0) {

    if($sizeflg!=2){

      while($row = $result->fetch_assoc()) {
       $output[]=$row; 
     }
   }

   if($sizeflg==1){
     return array($result->num_rows,$output);
   }else if($sizeflg==2){
    return  $result->num_rows;

  } else{
   return  $output;
 }

} else {
  if($sizeflg==1){
   return array($result->num_rows,$output);
 }else if($sizeflg==2){
  return  $result->num_rows;

}  

else{
 return  $output;
}
}

$mysqli->close();

}


function ShowArrayInTable($arraydata,$classname='table'){

  $theadcontent="";
  $tbodycontent="";
  $thflg=0;
  foreach ($arraydata as $key => $value) {


    $tbodycontent.= '<tr> ';

    foreach ($value as $k => $val) {
     if($thflg==0){
      $theadcontent.="<th> ".$k."</th>";
    }

    $tbodycontent.= '<td>'.$val.'</td>';

  }

  $tbodycontent.= '</tr> ';


  $thflg=1;
}

$tablehead='<thead><tr>'.$theadcontent.'</tr> </thead>';

$tablebody='<tbody>'.$tbodycontent.'</tbody>';


$table="<table class=".$classname.">".$tablehead.$tablebody."</table>";
return $table;

}

// $params=[];
// $params['startDate']="2020-01-24";
// $params['endDate']="2020-01-24";

// $k=joinTables('tokenizer.id ,patients.gender,patients.age ','tokenizer','patients','INNER','tokenizer.ref_id','patients.puid',' where patients.gender= "male" and patients.age>18 and tokenizer.purpose="REG" and DATE(tokenizer.create_date) >= "'.$params['startDate'].'" and DATE(tokenizer.create_date) <= "'.$params['endDate'].'" ',2);


// $k=joinTables('  userdetails_xamconsoleXC.customer_dp,userdetails_xamconsoleXC.membership_no,answersheet_xamconsoleXC.totalmarkacquired , answersheet_xamconsoleXC.totalmarklost,answersheet_xamconsoleXC.correctansno , answersheet_xamconsoleXC.wrongansno, answersheet_xamconsoleXC.unattendedno  ','answersheet_xamconsoleXC','userdetails_xamconsoleXC','INNER','userdetails_xamconsoleXC.customer_id ',' answersheet_xamconsoleXC.mem_id ','',1);
// print_r($k);
// echo ShowArrayInTable($k);



function extract_full_oncol($table ,$incol,$incolval,$order=" "){
  require __DIR__.'/db-connect.php';
  $output=[];
  $sql = "SELECT * FROM `".$table."` WHERE `".$incol."` = '".$incolval."' ".$order ;
  $result = $mysqli->query($sql);
  if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
     $output[]=$row; 
   }
   return $output;
 } else {
   return $output;
 }

 $mysqli->close();

}


// function extract_col_count($table ,$additional=''){
//   require __DIR__.'/db-connect.php';
//   $output=[];
//   $sql = "SELECT COUNT(*) AS count FROM `".$table."` " .$additional ." "  ;
 
//   $result = $mysqli->query($sql);
//   if ($result->num_rows > 0) {
//     while($row = $result->fetch_assoc()) {
//      $output[]=$row; 
//    }
//    return $output;
//  } else {
//    return $output;
//  }

//  $mysqli->close();

// }


function extract_full($table){
  require __DIR__.'/db-connect.php';
  $output=[];
  $sql = "SELECT * FROM `".$table."`" ;
  $result = $mysqli->query($sql);
  if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
     $output[]=$row; 
   }
   return $output;
 } else {
   return $output;
 }

 $mysqli->close();

}

function extract_col($outcol ,$table){
  require __DIR__.'/db-connect.php';

  $sql = "SELECT ".$outcol." FROM `".$table."`" ;
  $result = $mysqli->query($sql);
  if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
     $output[]=$row[$outcol]; 
   }
   return $output;
 } else {
   return "NO-DATA";
 }

 $mysqli->close();

}

function extract_col_all($outcol ,$table ,$additional=''){
  require __DIR__.'/db-connect.php';

  $sql = "SELECT ".$outcol." FROM `".$table."` " .$additional ." "  ;
  $result = $mysqli->query($sql);
  if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
     $output[]=$row; 
   }
   return $output;
 } else {
   return "NO-DATA";
 }

 $mysqli->close();

}

function max_value($table,$outcol='id',$additional=''){
  require __DIR__.'/db-connect.php';

  $sql = "SELECT MAX(".$outcol.") as max_value FROM `".$table."` " .$additional ." "  ;
  $result = $mysqli->query($sql);
  if ($result->num_rows > 0) {
   $row = $result->fetch_assoc();
   
   return $row['max_value'];
 } else {
   return 0;
 }

 $mysqli->close();

}

function max_count($table,$outcol='id',$additional=''){
  require __DIR__.'/db-connect.php';

  $sql = "SELECT COUNT(".$outcol.") as count_value FROM `".$table."` " .$additional ." "  ;
  $result = $mysqli->query($sql);
  if ($result->num_rows > 0) {
   $row = $result->fetch_assoc();
   
   return $row['count_value'];
 } else {
   return 0;
 }

 $mysqli->close();

}




function extractRecord($outcol,$incol,$inval,$table,$additional=''){
  require __DIR__.'/db-connect.php';

  $sql = "SELECT ".$outcol." FROM `".$table."` WHERE ".$incol." = '".$inval."' ". $additional." " ;
  $result = $mysqli->query($sql);
  if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
     $output[]=$row; 
   }
   return $output;
 } else {
   return "NO-DATA";
 }

 $mysqli->close();

}

function extractRecordList($outcol,$table,$additional=''){
  require __DIR__.'/db-connect.php';

  $sql = "SELECT ".$outcol." FROM `".$table."`  ". $additional." " ;
  $result = $mysqli->query($sql);
  if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
     $output[]=$row; 
   }
   return $output;
 } else {
   return "NO-DATA";
 }

 $mysqli->close();

}

function extract_col_distinct($outcol,$table){
  require __DIR__.'/db-connect.php';

  $sql = "SELECT DISTINCT ".$outcol." FROM `".$table."` " ;
  $result = $mysqli->query($sql);
  if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
     $output[]=$row[$outcol]; 
   }
   return $output;
 } else {
   return "NO-DATA";
 }

 $mysqli->close();

}



function extract_col_where($outcol,$incol,$inval,$table,$additional=''){
  require __DIR__.'/db-connect.php';

  $sql = "SELECT ".$outcol." FROM `".$table."` WHERE ".$incol." = '".$inval."' ".$additional ;
  $result = $mysqli->query($sql);
  if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
     $output[]=$row[$outcol]; 
   }
   return $output;
 } else {
   return "NO-DATA";
 }

 $mysqli->close();

}



// print_r(extractRecord('*','qbid','5d274a9582311','questionbank_xamconsoleXC'));



function smsapi($authKey,$mobileNumber,$senderId,$msg,$route){

  $message = urlencode($msg);

  $postData = array(
    'authkey' => $authKey,
    'mobiles' => $mobileNumber,
    'message' => $message,
    'sender' => $senderId,
    'route' => $route
  );

//API URL
  $url="http://hdsms.xctllp.com/api/sendhttp.php";

// init the resource
  $ch = curl_init();
  curl_setopt_array($ch, array(
    CURLOPT_URL => $url,
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_POST => true,
    CURLOPT_POSTFIELDS => $postData
    //,CURLOPT_FOLLOWLOCATION => true
  ));


//Ignore SSL certificate verification
  curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
  curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);


//get response
  $output = curl_exec($ch);

//Print error if any
  if(curl_errno($ch))
  {
    echo 'error:' . curl_error($ch);
  }

  curl_close($ch);

  echo $output;
}

//      $otp = rand(100000, 999999);
// $message = "Your One Time Password is " . $otp;

// smsapi('244091AgWeYlmdq5bfb72f1','8606101302','PUIBLA',$message,'4');




/*PROJECT-SPECIFIC*/

function newDayResetParameters($today,$metaname,$metavalue){
  $todaydate=extractRecord('*','configname','TODAYDATE','systemconfig_xc');
  $storedToday=date("d-m-Y",strtotime($todaydate[0]['configvalue']));


  if($storedToday!=$today){
    update_value($today,'systemconfig_xc','configvalue','configname','TODAYDATE' );
    update_value($metavalue,'systemconfig_xc','configvalue','metaname',$metaname );

  }

}

function getnameByCatid($catid){
  return extract_cell('metaname','catalogue_id',$catid,'catalogue');
}

function getMetanameByCatid($catid){
  return extract_cell("meta-url-key",'catalogue_id',$catid,'catalogue');
}
function getRecordByCatid($catid){
  return extractRecord("*",'catalogue_id',$catid,'catalogue');
}

function getParentByCatid($catid){
  return extract_cell('referkeyid','catalogue_id',$catid,'catalogue');
}

function getRefIdByUrlKeyFromCatalogue($name){
  return extract_cell('referkeyid','`meta-url-key`',$name,'catalogue');
}

function getIdByUrlKeyFromCatalogue($name){
  return extract_cell('catalogue_id','`meta-url-key`',$name,'catalogue');
}
 function getIdRecordByUrlKeyFromCatalogue($name){
  return extractRecord('catalogue_id,metatype','`meta-url-key`',$name,'catalogue');
}
 

function extractDataByLangcode($langcode,$which_language="ENG",$additional=""){
  if(!isset($which_language) || empty($which_language)){
    $which_language='ENG';
  }

  $data=extract_cell('meta_content','lang_code',$langcode,'language',' AND which_language ="'.$which_language.'" '.$additional);
  if($data !="NO-DATA"){
    return $data;
  }else{
    return "#EMPTY09#%";
  }
  

}



function createLangItem($lang_code,$data,$data_type,$referkey="",$referkeyid="",$whichLang="ENG",$clone_id="")
{

  $lexist=extractDataByLangcode($lang_code,$whichLang);
  if('#EMPTY09#%'==($lexist)){
    $lang_id_en=gen_uuid();

    insert_value('language','language_id',$lang_id_en );

  }else{
    $language_data=extractRecord('language_id','lang_code',$lang_code,'language'," AND which_language = '".$whichLang."' ");
    $lang_id_en=$language_data[0]["language_id"];

  }

  update_value($whichLang,'language','which_language','language_id',$lang_id_en);
  update_value($lang_code,'language','lang_code','language_id',$lang_id_en);
  update_value($data,'language','meta_content','language_id',$lang_id_en);
  update_value($data_type,'language','meta_type','language_id',$lang_id_en);
  update_value($referkey,'language','referkey','language_id',$lang_id_en);
  update_value($referkeyid,'language','referkeyid','language_id',$lang_id_en);
  if($clone_id!=""){
    update_value($clone_id,'language','extras','language_id',$lang_id_en);

  }
}

function dropLangItem($lang_code, $referkey="" ,$clone_id=""){
  $add="";
  if($referkey!=""){
   $add= ' AND referkey ="'.$referkey.'" ';
 }else{
  $add="";
}
if($clone_id!=""){
 $add.= ' AND extras ="'.$clone_id.'" ';
}else{
  $add="";
}
droprecord('language','lang_code',$lang_code,$add);
}

function insert_newsletter($email) {
    require __DIR__ . '/db-connect.php';
    
    $uid = gen_uuid();

    $query = "INSERT INTO enquiry (email, combination_key, uid) VALUES (?, 'news_letter', ?)";
    $stmt  = $mysqli->prepare($query);
    $stmt->bind_param("ss", $email, $uid);

    $result = $stmt->execute();
    $stmt->close();

    return $result;
}






?>
