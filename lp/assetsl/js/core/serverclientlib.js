
 
Array.prototype.removeArrayItem = function() {
  var what, a = arguments, L = a.length, ax;
  while (L && this.length) {
    what = a[--L];
    while ((ax = this.indexOf(what)) !== -1) {
      this.splice(ax, 1);
    }
  }
  return this;
};

function summernoteEditor(id,params={
    placeholder: '',
    fontNames: ['Nunito','Arial','sans-serif'],
    fontNamesIgnoreCheck: ['Nunito','Arial','sans-serif'],
    fontSizes: ['8', '9', '10', '11', '12', '13', '14', '15', '16', '18', '20', '22' , '24', '28', '32', '36', '40', '48'],
    tabsize: 2,
    height: 120,
    callbacks: {

      onImageUpload: function(files) {
        ajaxEditorImagesToFiles(files[0],id);
      }
    },
    toolbar: [
    ['style', ['bold', 'italic', 'underline', 'clear']],
    ['font', ['strikethrough', 'superscript', 'subscript']],
    ['fontname', ['fontname']],
    ['fontsize', ['fontsize']],
    ['color', ['color']],
    ['para', ['ul', 'ol', 'paragraph']],
    ['table', ['table']],
    ['height', ['height']],

    ['insert', ['link', 'picture', 'video']],
    ['view', ['fullscreen', 'codeview', 'help']]
    ]
  }){

    $(id).summernote(params);

    $(id).summernote('fontName', 'Nunito');

  }

function xcdelayer(callback, ms) {
  var timer = 0;
  return function() {
    var context = this, args = arguments;
    clearTimeout(timer);
    timer = setTimeout(function () {
      callback.apply(context, args);
    }, ms || 0);
  }

}

function datatableResponse(idname,responsefile,coloption=null,otherparam='none'){
  $('#'+idname).DataTable({
    "columns": coloption,
    "bProcessing": true,
    "serverSide": true,
    'order': [[ 0, 'desc' ]],

    "ajax":{
                url :responsefile, // json datasource
                type: "post",  // type of method  ,GET/POST/DELETE
                data:otherparam,
                error: function(e){
                 $("#"+idname+"_processing").css("display","none");
               } 
             }
           });

}

function datatableResponse_print(idname,responsefile,coloption=null,otherparam='none'){
  $('#'+idname).DataTable({
    "columns": coloption,
    "bProcessing": true,
    "serverSide": true,
    'order': [[ 0, 'desc' ]],


    dom: 'Bfrtip',
                 // buttons: ['copy','csv', 'print','pageLength'],
                 buttons: ['copy','csv','pageLength'],


                 "lengthMenu": [[10, 25, 50, 100], [10, 25, 50, "All"]],

                 "ajax":{
                url :responsefile, // json datasource
                type: "post",  // type of method  ,GET/POST/DELETE
                data:otherparam,
                error: function(e){
                 $("#"+idname+"_processing").css("display","none");
               } 
             }
           });

}

function datatableResponse_print_custom(idname,responsefile,coloption=null,printcol=[0,1],otherparam='none'){
  $('#'+idname).DataTable({
    "columns": coloption,
    "bProcessing": true,
    "serverSide": true,
    'order': [[ 0, 'desc' ]],


    dom: 'Bfrtip',
             
                 buttons: [
                  {
                  extend: 'csvHtml5',
                  text: 'Export CSV',
                  exportOptions: {
                      columns: printcol 
                  },
                  customize: function (csv) {

                      return "Customized CSV Header\n" + csv;
                  }
                  }
                ],


                 "lengthMenu": [[10, 25, 50, 100], [10, 25, 50, "All"]],

                 "ajax":{
                url :responsefile,
                type: "post",  
                data:otherparam,
                error: function(e){
                 $("#"+idname+"_processing").css("display","none");
               } 
             }
           });

}


function ajaxFormSend(formtarget,event,target,ajaxurl,ajaxmethod='post',loader='',callback=()=>{} ){
  var formselector= $(formtarget);
  var loaderselector= $(loader);
  formselector.on(event,target,(e)=>{
    e.preventDefault();
    var info= formselector.serialize();
    $.ajax({
     url: ajaxurl,
     method: ajaxmethod,
     data: info,
     beforeSend: ()=>{
       loaderselector.fadeIn();

     },
     success: (output)=>{
       loaderselector.fadeOut();

       let a=JSON.parse(output);

       if(a[0]=="1"){
        swal("Good job!",a[1], "success").then(()=>{callback();});
        $('.dataTable').DataTable().ajax.reload();

      }else if(a[0]=="0"){
        swal("Failed!",a[1], "error").then(()=>{callback();});

      }else{
       loaderselector.fadeOut();

     }

   },
   error:(err)=>{
    swal("Failed!","Something Went Wrong", "error");

  }



});

         // loaderselector.hide();



       });


}

  function ajaxEditorImagesToFiles(file, editor) {
    data = new FormData();
    data.append("img[]", file);
    data.append("imgtype", "EDITORIMAGE");
    $.ajax({
      data: data,
      type: "POST",
      url: "_dp_push.php",
      cache: false,
      contentType: false,
      processData: false,
      success: function(url) {
                // editor.insertImage(welEditable, url);
                var image = $('<img>').attr('src',  url);
               $(editor).summernote("insertNode", image[0]);

               }
            });
  }

function datatableResponseAsc(idname,responsefile,coloption=null,otherparam='none'){
  $('#'+idname).DataTable({
    "columns": coloption,
    "bProcessing": true,
    "serverSide": true,
    'order': [[ 0, 'asc' ]],

                 // dom: 'Bfrtip',
                 // buttons: ['copy','csv', 'print'],


                 "ajax":{
                url :responsefile, // json datasource
                type: "post",  // type of method  ,GET/POST/DELETE
                data:otherparam,
                error: function(e){
                  console.log(e);
                  $("#"+idname+"_processing").css("display","none");
                } 
              }
            });

}

function ajaxFormSendFullparam(formtarget,event,target,ajaxurl,ajaxmethod='post',loader='',callback=()=>{} ){
  var formselector= $(formtarget);
  var loaderselector= $(loader);
  let allselect=formselector.find('select[required]');
  let allselectno=allselectno.length;
  let xsl=0,flgparam=0;
  while(xsl< allselectno){
    if(allselectno[xsl].value=="")
    {
      flgparam= 1;
    }
    xsl++;
  }
  formselector.on(event,target,(e)=>{
    e.preventDefault();
    if(flgparam ==0){
      var info= formselector.serialize();
      $.ajax({
       url: ajaxurl,
       method: ajaxmethod,
       data: info,
       beforeSend: ()=>{
         loaderselector.fadeIn();

       },
       success: (output)=>{
         loaderselector.hide();
         console.log(output);

         let a=JSON.parse(output);

         if(a[0]=="1"){
          swal("Good job!",a[1], "success").then(()=>{callback();});
          $('.dataTable').DataTable().ajax.reload();

        }else{
          swal("Failed!",a[1], "error").then(()=>{callback();});

        }

      },
      error:(err)=>{
        swal("Failed!","Something Went Wrong", "question");

      }



    });
    }

         // loaderselector.hide();



       });


}

//custom function
function truncateElement(target ,callback=()=>{})
{
 $(target).on('click','.xcdelete',(e)=>{

   e.preventDefault();

   swal({
    title: "Are you sure?",
    text: "Once deleted, you will not be able to recover this data!",
    icon: "warning",
    buttons: true,
    dangerMode: true,
  })
   .then((willDelete) => {
    if (willDelete) {

      ajaxJsonTransfer({},$(e.target).attr('href'),'post','#ajaxloader',(res)=>{
        callback();

      });
      swal("Poof! Your data has been deleted!", {
        icon: "success",
      });
    } 
  });



 });
}


function ajaxJsonTransfer(info,ajaxurl,ajaxmethod='post',loader='',callback=()=>{} ){
  var loaderselector= $(loader);
  $.ajax({
   url: ajaxurl,
   method: ajaxmethod,
   data: info,
   beforeSend: ()=>{
     loaderselector.fadeIn();
   },
   success: (output)=>{
     loaderselector.fadeOut();
     let a=JSON.parse(output);

     if(a[0]=="1"){
      swal("Good job!",a[1], "success",{
        buttons: false,
        timer: 1400,
      }).then(()=>{callback();});

    }else if(a[0]=="0"){
      swal("Failed!",a[1], "error").then(()=>{callback();});

    }else{
     loaderselector.fadeOut();

   }

 },
 error:(err)=>{
   swal("Failed!","Something Went Wrong :", "error");
   loaderselector.fadeOut();

 }



});



}

function ajaxMixedMediaTransfer(mixedDataParams,ajaxparams,callback=()=>{},callbacksuccess=()=>{}) {

  if (mixedDataParams) {

      // var blob=dataURItoBlob(result.src);
      var formData = new FormData();
      // $(ajaxparams.loader).show();
for (var key in mixedDataParams) {
        formData.append(key, mixedDataParams[key]);

      };
      formData.append('imgtype',ajaxparams.type);
      $.ajax(ajaxparams.url, {
        method: 'POST',
        data: formData,
        processData: false,
        contentType: false,

        success: function (es) {
          callbacksuccess(es);
          
        },

        error: function () {
          alert('failed');
        },

        complete: function (e) {
          callback(e);
        },
      });

    }



  }

  function ajaxFileTransfer(result,ajaxparams,callback=()=>{},contenttypename='pdf[]') {

    if (result) {

      // var blob=dataURItoBlob(result.src);
      var formData = new FormData();
      // $(ajaxparams.loader).show();

      formData.append(contenttypename, result);
      formData.append('imgtype',ajaxparams.type);
      formData.append('filename',ajaxparams.filename);
      $.ajax(ajaxparams.url, {
        method: 'POST',
        data: formData,
        processData: false,
        contentType: false,

        success: function (e) {

        },

        error: function () {
          alert('failed');
        },

        complete: function (e) {
          callback(e);
        },
      });

    }



  }


  async function ajaxJsonTransferAndOutput(info,ajaxurl,ajaxmethod='post',loader='',callback=()=>{} ){
    var loaderselector= $(loader);
    await $.ajax({
     url: ajaxurl,
     method: ajaxmethod,
     data: info,
     beforeSend: ()=>{
       loaderselector.fadeIn();
     },
     success: (output)=>{
       loaderselector.fadeOut();
       let a=JSON.parse(output);

       if(a[2]!=""){
         callback(a[2]);

       } 


     },
     error:(err)=>{
       swal("Failed!","Something Went Wrong :", "error");

     }



   });



  }





  function ajaxFormSendSpl(formtarget,event,target,ajaxurl,ajaxmethod='POST',loader='',callback=()=>{},infodata='' ){
    var formselector= $(formtarget);
    var loaderselector= $(loader);
    formselector.on(event,target,(e)=>{
      e.preventDefault();

      formselector.ajaxForm({
       url: ajaxurl,
       method: ajaxmethod,
     // data:info,
     beforeSubmit: ()=>{
       loaderselector.fadeIn();

     },
     success: (output)=>{
       loaderselector.fadeOut();

       let a=JSON.parse(output);

       if(a[0]=="1"){
        swal("Good job!",a[1], "success").then(()=>{callback();});
        $('.dataTable').DataTable().ajax.reload();

      }else if(a[0]=="0"){
        swal("Failed!",a[1], "error").then(()=>{
        //  callback();
      });

      }else{
       loaderselector.fadeOut();

     }


   },
   error:(err)=>{
    swal("Failed!","Something Went Wrong", "error");
    loaderselector.fadeOut();

  }



}).submit();




    });


  }



  function ajaxFormSendSplRecaptcha(formtarget,event,target,ajaxurl,ajaxmethod='post',loader='',callback=()=>{} ){
    var formselector= $(formtarget);
    var loaderselector= $(loader);
    formselector.on(event,target,(e)=>{
      e.preventDefault();
        // var info= formselector.serialize();

        formselector.validate();
        var ab= formselector.valid();
        var flg=0;
        if(ab){
          getRecaptcha(()=>{

            formselector.ajaxForm({

              url: ajaxurl,
              method: ajaxmethod,
              beforeSubmit: ()=>{
                loaderselector.fadeIn();

              },
              success: (output)=>{
                loaderselector.fadeOut();
                let a=JSON.parse(output);
                if(a[0]=="1"){
                  swal("Good job!",a[1], "success").then(()=>{callback();});


                }else if(a[0]=="0"){
                  swal("Failed!",a[1], "error").then(()=>{callback();});
                }else{
                  loaderselector.fadeOut();
                }
              },
              error:(err)=>{
                swal("Failed!","Something Went Wrong", "error");
                loaderselector.fadeOut();
              }
            }).submit();



          });
        }
        else{
          swal("Oops!", " Please Fill All the Fields . ", "error") ;
          getRecaptcha();
        }




      });


  }










  function ajaxFormSendSplAndOutput(formtarget,event,target,ajaxurl,ajaxmethod='POST',loader='',callback=()=>{},infodata='' ){
    var formselector= $(formtarget);
    var loaderselector= $(loader);
    formselector.on(event,target,(e)=>{
      e.preventDefault();

      formselector.ajaxForm({
       url: ajaxurl,
       method: ajaxmethod,
     // data:info,
     beforeSubmit: ()=>{
       loaderselector.fadeIn();

     },
     success: (output)=>{
       loaderselector.fadeOut();

       let a=JSON.parse(output);

       if(a[0]=="1"){
        swal("Good job!",a[1], "success").then(()=>{callback(a);});
        $('.dataTable').DataTable().ajax.reload();

      }else if(a[0]=="0"){
        swal("Failed!",a[1], "error").then(()=>{callback(a);});

      }else{
       loaderselector.fadeOut();

     }


   },
   error:(err)=>{
    swal("Failed!","Something Went Wrong", "error");
    loaderselector.fadeOut();

  }



}).submit();




    });


  }


