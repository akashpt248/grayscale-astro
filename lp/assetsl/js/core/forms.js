
function formhash(form, password) {
    // Create a new element input, this will be our hashed password field. 
    var p = document.createElement("input");

    // Add the new element to our form. 
    form.appendChild(p);
    p.name = "p";
    p.type = "hidden";
    p.value = hex_sha512(password.value);

    // Make sure the plaintext password doesn't get sent. 
    password.value = "";

    // Finally submit the form. 
    form.submit();
}

function notif(form,text,link) {
    // Create a new element input, this will be our hashed password field. 
    if (text.value == '') {
        alert('You must provide all the requested details. Please try again');
        return false;
    }
    if(link.value == ''){
        link.value = '#';
    }
    form.submit();
    return true;
}

function notific(form,ev_id,text) {
    // Create a new element input, this will be our hashed password field. 
    if (text.value == '' || ev_id.value == '') {
        alert('You must provide all the requested details. Please try again');
        return false;
    }
    form.submit();
    return true;
}

function isValidEmailAddress(emailAddress) {
    var pattern = /^([a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+(\.[a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+)*|"((([ \t]*\r\n)?[ \t]+)?([\x01-\x08\x0b\x0c\x0e-\x1f\x7f\x21\x23-\x5b\x5d-\x7e\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|\\[\x01-\x09\x0b\x0c\x0d-\x7f\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))*(([ \t]*\r\n)?[ \t]+)?")@(([a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.)+([a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.?$/i;
    return pattern.test(emailAddress);
};

function regformhash(form,category,username, email, phone_number, password, conf,dept,faculty) {
    //alert(pin.value);
    // Check each field has a value

    console.log(faculty);

    if (email.value == ''     ||
        password.value == ''  ||
        phone_number.value == '' ||
        category.value == '' ||
        conf.value == '') {

        // alert('You must provide all the requested details. Please try again');

        swal(" Please try again",'You must provide all the requested details!',"warning");
        return false;
    }

    // Check the username

    // re = /^\w+$/;
    // if(!re.test(username.value)) {
    //     alert("Username must contain only letters, numbers and underscores. Please try again");
    //     form.username.focus();
    //     return false;
    // }



    if( !isValidEmailAddress( email.value ) ){
        // alert('Please provide a valid email address. Please try again');
        swal(" Please try again",'Please provide a valid email addressz!',"warning");
        return false;
    }


    if (password.value.length < 6) {
        // alert('Passwords must be at least 6 characters long.  Please try again');
        swal(" Please try again",'Passwords must be at least 6 characters long!',"warning");
        form.password.focus();
        return false;
    }
    if (phone_number.value.length != 10) {
        // alert('Please provide a valid Phone Number');
        swal(" Please try again",'Please provide a valid Phone Number!',"warning");
        form.phone_number.focus();
        return false;
    }

    if (password.value != conf.value) {
        // alert('Your password and confirmation do not match. Please try again');
        swal(" Please try again",'Your password and confirmation do not match!',"warning");
        form.password.focus();
        return false;
    }
    console.log("Dept");
    console.log(dept.value);
    let dvalue="";
    if (category.value=='dadmin' || category.value=='faculty') {
        dvalue= dept.value;
    }
    else{
         dvalue= "";
    }

    // Create a new element input, this will be our hashed password field.
    var p = document.createElement("input");

    // Add the new element to our form.
    form.appendChild(p);
    p.name = "p";
    p.type = "hidden";
    // p.value = hex_sha512(password.value);


    if (password.value.length !=0 && conf.value.length !=0) {

        if (password.value != conf.value) {
            // alert('Your password and confirmation do not match. Please try again');
            swal(" Please try again",'Your password and confirmation do not match!',"warning");
            form.password.focus();
            return false;
        }


        p.value = hex_sha512(password.value);
    }
    else{
        p.value="";

        if ((password.value.length !=0 && conf.value.length ==0) || (password.value.length ==0 && conf.value.length !=0) ) {
            // alert('Your password and confirmation do not match. Please try again');
            swal(" Please try again",'Your password and confirmation do not match!',"warning");
            return false;
        }

    }

    // Make sure the plaintext password doesn't get sent.
    password.value = "";
    conf.value = "";
    var dataString = 'username='+ username.value + '&email='+ email.value + '&phone_number='+ phone_number.value + '&p='+ p.value +'&category='+ category.value +'&dept='+ dvalue +'&faculty='+ faculty.value;
    // $(this).closest('form').preventDefault();
    // $(this).closest('form').stopPropagation();


    $.ajax({
        type: "POST",
        url: "user_upload.php",
        data: dataString,
        cache: false,
        success: function(result){
            datr=result.trim();
            if(datr=="success"){
                // alert(datr);
                swal('New User Added',"successfully procedure complete","success").then(()=>{
                window.location.reload();

                });
             }

            else{
                swal('Email Already Exist!'," procedure incomplete","warning");
            }  
        },
        error : (err)=>{
            alert(err);
        }
    });
    return false;
}
function upformhash(form,category,username, email, phone_number, password, conf,cusid,dept, faculty) {

    // alert("inside");


    console.log(faculty.value);
 
    if (email.value == ''     ||
       phone_number.value == '' ||
       username.value == '' ||
       category.value == '' 
      ) {

        // alert('You must provide all the requested details. Please try again');
        swal(" Please try again",'You must provide all the requested details!',"warning");
        return false;
    }



    if( !isValidEmailAddress( email.value ) ){
        // alert('Please provide a valid email address. Please try again');
        swal(" Please try again",'Please provide a valid email addressz!',"warning");
        return false;
    }


    // if (password.value.length < 6 & password.value.length>0) {
    //     // alert('Passwords must be at least 6 characters long.  Please try again');
    //     swal(" Please try again",'Passwords must be at least 6 characters long',"warning");
    //     form.password.focus();
    //     return false;
    // }
    if (phone_number.value.length != 10) {
        // alert('Please provide a valid Phone Number');
        swal(" Please try again",'Please provide a valid Phone Number',"warning");
        form.phone_number.focus();
        return false;
    }


    let dvalue="";
    if (category.value=='dadmin' || category.value=='faculty') {
        dvalue= dept.value;
    }
    else{
         dvalue= "";
    }


    var p = document.createElement("input");
    form.appendChild(p);
    p.name = "p";
    p.type = "hidden";

    if (password.value.length ==0 && conf.value.length ==0){
        
        p.value="";
    }
    else{


        if (password.value.length !=0 && conf.value.length !=0) {

            if (password.value != conf.value) {
                // alert('Your password and confirmation do not match. Please try again');
                swal(" Please try again",'Your password and confirmation do nottt match',"warning");
                form.password.focus();
                return false;
            }


            p.value = hex_sha512(password.value);
        }
        else{
            p.value="";

            if ((password.value.length !=0 && conf.value.length ==0) || (password.value.length ==0 && conf.value.length !=0) ) {
                // alert('Your password and confirmation do not match. Please try again');
                swal(" Please try again",'Your password and confirmation do notttt match',"warning");
                return false;
            }

        }

    }

    // Make sure the plaintext password doesn't get sent.
    password.value = "";
    conf.value = "";

    // Finally submit the form.
    //form.submit();
    var dataString = 'cusid='+cusid.value+'&username='+ username.value + '&email='+ email.value + '&phone_number='+ phone_number.value +'&category='+ category.value +'&p='+ p.value +'&dept='+ dvalue +'&faculty='+ faculty.value;
    $.ajax({
        type: "POST",
        url: "user_upload_edit.php",
        data: dataString,
        cache: false,
        success: function(result){
            // datr=result.trim();

            // if(datr=="success"){
                // alert(result);
            //     window.location.reload();
            // }
            // else alert(datr);
            swal('User details Changed ',"successfully procedure complete","success").then(()=>{
                // window.location.reload();

                $('.dataTable').DataTable().ajax.reload();
            });
        }
    });
    return true;
}


