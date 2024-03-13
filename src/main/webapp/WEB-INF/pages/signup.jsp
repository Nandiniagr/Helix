<html>
<head>
    <style>
    body {
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        font-family: sans-serif;
        background: #55acee;

    }
    .main {
        width: 350px;
        height: 500px;
        background: #FFFFFF;
        background: #FFFFFF;
        overflow: hidden;
        border-radius: 10px;
        box-shadow: 5px 20px 50px #000;
    }
    #chk {
        display: none;
    }
    .signup {
        position: relative;
        margin-top:-10px;
        width: 100%;
        height: 100%;
    }
    label {
        color: #000000;
        font-size: 2.3em;
        justify-content: center;
        display: flex;
        margin: 60px;
        font-weight: bold;
        cursor: pointer;
        transition: .5s ease-in-out;
    }
    input {
        width: 60%;
        height: 20px;
        background: #e0dede;
        justify-content: center;
        display: flex;
        margin: 20px auto;
        padding: 10px;
        border: none;
        outline: none;
        border-radius: 5px;
    }
    button {
        width: 60%;
        height: 40px;
        margin: 10px auto;
        justify-content: center;
        display: block;
        color: #fff;
        background: #55acee;
        font-size: 1em;
        font-weight: bold;
        margin-top: 20px;
        outline: none;
        border: none;
        border-radius: 5px;
        transition: .2s ease-in;
        cursor: pointer;
    }
    button:hover {
        background: #6d44b8;
    }
    .login {
        height: 460px;
        background: #eee;
        border-radius: 60% / 10%;
        transform: translateY(-180px);
        transition: .8s ease-in-out;
    }
    .login label {
        color: #573b8a;
        transform: scale(.6);
    }
    #chk:checked ~ .login {
        transform: translateY(-500px);
    }
    #chk:checked ~ .login label {
        transform: scale(1);
    }
    #chk:checked ~ .signup label {
        transform: scale(.6);
    }
    #signup-error{
        color:red;
        display:none;
        justify-content: center;
        display: flex;
        margin: 20px auto;
        padding: 10px;
    }
    </style>

    <title>Twitter signup</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>
           <div class="main">
               <input type="checkbox" id="chk" aria-hidden="true">
               <div class="signup">
                   <img src="https://cdn.pixabay.com/photo/2014/04/03/11/53/twitter-312464_960_720.png" alt="Logo" style="width: 50px; height: 40px; display: block; margin: 20px auto 0">

                   <form>
                       <label for="chk" aria-hidden="true"> Become a member </label>
                       <input id ="signup-name" type="text" name="txt" placeholder="User name" required="">
                       <input id ="signup-email" type="email" name="email" placeholder="Email" required="">
                       <input id ="signup-password" type="password" name="pswd" placeholder="Password" required="">
                       <p id="signup-error"></p>
                       <button type="button" id="btn-signup">Sign up</button>
                   </form>
               </div>
           </div>

           <script>
                function validateSignupForm(){
                    var name= $("#signup-name").val();
                    var email= $("#signup-email").val();
                    var password= $("#signup-password").val();

                    var error="";
                    if(!name)
                    {
                        error+="name is empty";
                    }
                    if(!email)
                    {
                        error+=" email is empty";
                    }
                    if(!password)
                    {
                        error+=" password is empty";
                    }
                    if(!!password && password.length<=3)
                    {
                        error+="password length must be greater than 3";
                    }
                    $("#signup-error").html(error);

                    if(error.length>0)
                    {
                        return false;
                    }
                    return true;

                }

               $("#btn-signup").click(function(){
               var isFormValid=validateSignupForm();
               if(isFormValid){
                 $("#signup-error").hide();
                 var user={
                 "name":$("#signup-name").val(),
                 "email":$("#signup-email").val(),
                 "password":$("#signup-password").val()
                 };
                 $.ajax({
                   type: "POST",
                   url: "/signup",
                   data: JSON.stringify(user),
                   success: function(response){
                        if(!!response){
                            if(response.user_created === true)
                            {
                                alert(response.message);
                            }
                            else
                            {
                                alert(response.message);
                            }
                        }
                   },
                   contentType: "application/json"
                 });
               }
               else
               {
                 $("#signup-error").show();
               }
               });
           </script>
</body>
</html>