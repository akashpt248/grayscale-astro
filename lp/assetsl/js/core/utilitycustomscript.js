function modalDataLoad(modaltarget,searchinputelement,searchresult,searchlistname,targetinputcodebox,targetinputfullnamebox,tokenflg=0,callback3=()=>{})
{
  var searchInputBox=$(searchinputelement);
  var searchResult=$(searchresult);
  var modalTarget=$(modaltarget);

  searchInputBox.keyup((e)=>{

    let searchkey=searchInputBox.val();
    let info ={'searchkey' : searchkey ,'searchlist': searchlistname};

    ajaxJsonTransferAndOutput(info,'./am_search_tap_response.php','post','',(res)=>{

      searchResult.html(res.data[0][0]);

    }); 

  });

  let dl1= $(targetinputcodebox);
  let dl2= $(targetinputfullnamebox);


  modalTarget.on( 'click','.search-element',(e)=>{
    e.preventDefault();
    let key1=e.target.getAttribute('data-key1');
    let key2=e.target.getAttribute('data-key2');
    dl1.val(key2);
    dl2.val(key1);
    dl1.focus();


  });









  dl1.keydown((e)=>{
   if(e.keyCode=='13'){
     let searchkey=dl1.val();

     let info ={'searchkey' : searchkey ,'searchlist': searchlistname};

     ajaxJsonTransferAndOutput(info,'./am_search_enter_response.php','post','',(res)=>{

       if(res.data.length >0){
        dl2.val(res.data[0][1]);

      }else{
        dl2.val('');

      }

      if(tokenflg==1){

        /*TOKEN MANAGEMENT*/

        let tokenUpdate= document.querySelector('input[name="token"]');
        let tokenname=searchkey;

        ajaxJsonTransferAndOutput({'tokenname':'1','tname':tokenname},'./am_component_reload.php','post','#ajaxloader',(res)=>{
               tokenUpdate.value=((res[tokenname]!='NULL')? (parseInt(res[tokenname])) : "");

            });
      }

      callback3();




    }); 

   }

 });

}

function modalDataLoadPick(modaltarget,searchinputelement,searchresult,searchlistname,targetinputcodebox,responsefile,infoitem='novalue:1',callback3=()=>{})
{
  var searchInputBox=$(searchinputelement);
  var searchResult=$(searchresult);
  var modalTarget=$(modaltarget);

  searchInputBox.keyup((e)=>{

    let searchkey=searchInputBox.val();
    let info ={'searchkey' : searchkey ,'searchlist': searchlistname,infoitem};

    ajaxJsonTransferAndOutput(info,responsefile,'post','',(res)=>{

      searchResult.html(res.data[0][0]);

    }); 

  });

  let dl= $(targetinputcodebox);
 

  modalTarget.on( 'click','.search-element',(e)=>{
    e.preventDefault();
    
    let key=e.currentTarget.getAttribute('data-key');
     dl.val(key);
   callback3(key);


  });




}




function mbsd_sane_enter_key(parent="body",input_types= "input, select, button, textarea") {
  // var input_types;
  // input_types = "input, select, button, textarea";

  return $(parent).on("keydown", input_types, function(e) {
    var enter_key, form, input_array, move_direction, move_to, new_index, self, tab_index, tab_key;
    enter_key = 13;
    tab_key = 9;

    if (e.keyCode === tab_key || e.keyCode === enter_key) {
      self = $(this);

      // some controls should react as designed when pressing enter
      if (e.keyCode === enter_key && (self.prop('type') === "submit" || self.prop('type') === "textarea")) {
        return true;
      }

      form = self.parents(parent);

      // Sort by tab indexes if they exist
      tab_index = parseInt(self.attr('tabindex'));
      if (tab_index) {
        input_array = form.find("[tabindex]").filter(':visible').sort(function(a, b) {
          return parseInt($(a).attr('tabindex')) - parseInt($(b).attr('tabindex'));
        });
      } else {
        input_array = form.find(input_types).filter(':input:not([readonly])').filter(':visible');
      }

      // reverse the direction if using shift
      move_direction = e.shiftKey ? -1 : 1;
      new_index = input_array.index(this) + move_direction;

      // wrap around the controls
      if (new_index === input_array.length) {
        new_index = 0;
      } else if (new_index === -1) {
        new_index = input_array.length - 1;
      }

      move_to = input_array.eq(new_index);
      move_to.focus();
      move_to.select();
      return false;
    }
  });
}

function inputBlurCaseChange(element){
 element.value = element.value.toUpperCase();
}


function inputEnterProcedureDone(inputtarget,infokeyname,responsefile ,callbackinput=()=>{})
{

 inputtarget.keydown((e)=>{
   if(e.keyCode=='13'){
     let searchkey=inputtarget.val();
     let info={'infokeyvalue' : searchkey,'infokeyname':infokeyname};
     ajaxJsonTransferAndOutput(info,responsefile,'post','#ajaxloader',(result)=>{
     
        callbackinput(result);
       
    }); 


   }

 });
}

function agetoproject(age){
  if(age<=18){
  $('input[name="opprojectcode"]').val('AK');
}else{
    $('input[name="opprojectcode"]').val('GEN');

}
}


/*DRAG ELEMENT*/


function dragElement(elmnt) {
  var pos1 = 0, pos2 = 0, pos3 = 0, pos4 = 0;
  if (document.getElementById(elmnt.id + "header")) {
    // if present, the header is where you move the DIV from:
    document.getElementById(elmnt.id + "header").onmousedown = dragMouseDown;
  } else {
    // otherwise, move the DIV from anywhere inside the DIV:
    elmnt.onmousedown = dragMouseDown;
  }


  function dragMouseDown(e) {
    e = e || window.event;
    e.preventDefault();
    // get the mouse cursor position at startup:
    pos3 = e.clientX;
    pos4 = e.clientY;
    document.onmouseup = closeDragElement;
    // call a function whenever the cursor moves:
    document.onmousemove = elementDrag;
  }

  function elementDrag(e) {
    e = e || window.event;
    e.preventDefault();
    // calculate the new cursor position:
    pos1 = pos3 - e.clientX;
    pos2 = pos4 - e.clientY;
    pos3 = e.clientX;
    pos4 = e.clientY;
    // set the element's new position:
    elmnt.style.top = (elmnt.offsetTop - pos2) + "px";
    elmnt.style.left = (elmnt.offsetLeft - pos1) + "px";
  }

  function closeDragElement() {
    // stop moving when mouse button is released:
    document.onmouseup = null;
    document.onmousemove = null;
  }
}


/*DRAG MODAL*/
function dragModal(elem){
$(elem).on("mousedown", function(mousedownEvt) {
    var $draggable = $(this);
    var x = mousedownEvt.pageX - $draggable.offset().left,
        y = mousedownEvt.pageY - $draggable.offset().top;
    $("body").on("mousemove.draggable", function(mousemoveEvt) {
        $draggable.closest(".modal-dialog").offset({
            "left": mousemoveEvt.pageX - x,
            "top": mousemoveEvt.pageY - y
        });
    });
    $("body").one("mouseup", function() {
        $("body").off("mousemove.draggable");
    });
    $draggable.closest(".modal").one("bs.modal.hide", function() {
        $("body").off("mousemove.draggable");
    });
});

}


function keycomponent_reload_table(keycomponent,keycomponentvalue,target_query,dvalue=""){
   ajaxJsonTransferAndOutput({[keycomponent]: keycomponentvalue,"dvalue":dvalue },'./exam_component_reload.php','post','#ajaxloader',(res)=>{

    let reloadtable= document.querySelector(target_query);
    reloadtable.innerHTML=res[keycomponent];
 
  });
}

function keycomponent_reload_list(info,target_query){
   ajaxJsonTransferAndOutput(info,'./exam_component_reload.php','post','#ajaxloader',(res)=>{

    let reloadtable= document.querySelector(target_query);
    reloadtable.innerHTML=res;
 
  });
}

function keycomponent_reload_list_crawl(info,target_query,crawl,callbackfunc=()=>{}){
   ajaxJsonTransferAndOutput(info,crawl,'post','#ajaxloader',(res)=>{

    let reloadtable= document.querySelector(target_query);
    reloadtable.innerHTML=res;
     callbackfunc();
 
  });
}


/* FUNCTION CALL */
// mbsd_sane_enter_key();
// dragElement(document.getElementById("mydiv"));

