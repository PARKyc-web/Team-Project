<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="keywords" content="SignUp, Login, Register">
  <meta name="keywords" content="Sign up, Sign in">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login</title>
  <!--Bootstrap Css-->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <!--Font-aweome-->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
  <!--Custom Css-->
 <style>


body{
    width:100%;
    background-color:var(--background-theme);
}


/* Sections */
.login_section{
    min-height: 100vh;
    display: flex;
    align-items:center;
    position: relative;
    justify-content:center;
}

.accounts_container{
    height: 550px;
    min-height: 550px;
    max-height: 100%;
    border-radius:10px;
    box-shadow: 8px 8px 8px rgba(0,0,0,0.1);
    background-color: #fcfcfc;
    overflow: hidden; 
}


.accounts_image img{
    object-fit: cover;
    object-position: center;
    border-top-left-radius: 10px;
    border-bottom-left-radius: 10px;
}
.accounts_col form .form-group{
    position: relative !important;
}
.accounts_col form .form-control{
    font-size:1.6rem;
    padding:20px 10px;
    margin-bottom:20px;
    background:transparent !important;
}
.accounts_col form label,
.accounts_col form .form-group i{
    position:absolute;
    z-index: 1;
    pointer-events: none;
    top: 50%;
    transform: translateY(-50%);
    font-size:1.2rem;
    left:10px;

}
.accounts_col form label{
    transition: .2s linear;
}
.change_label{
    background-color:#fcfcfc;
    transition: .2s linear;
    transform: scale(0.8);
    top:0 !important;
}
.accounts_col form .form-group i{
    left:90% !important;
    cursor: pointer;
    pointer-events:visible;
}
.register_btn{
    padding:10px 0!important;
    font-size: 1.6rem !important;
    font-weight: 600 !important;

}

.already_member_box p,
.already_member_box span{
    cursor: pointer;
}
.login_form,
.signup_form{
    display:none;
}
 </style>

</head>

<body>
  <section class="login_section">
    <div class="container outer_container accounts_container">
      <div class="row h-100">
        <div class="col col-sm-12 col-md-12 col-lg-8 m-0 p-0 w-100 h-100 accounts_col">
          <div class="accounts_image w-100 h-100">
            <img src="https://img.freepik.com/free-photo/social-media-instagram-digital-marketing-concept-3d-rendering_106244-1717.jpg?t=st=1647414398~exp=1647414998~hmac=2c478ef6affd973ccd71ea4d394d9283db4a0c6c4c686ba0b9f6091c8a56e5a1&w=1480" alt="accounts_image" class="img-fluid w-100 h-100" />
          </div>
          <!--accounts_image-->
        </div>
        <!--account_col-->
        <div class="col col-sm-12 col-md-12 col-lg-4 m-0 p-0 accounts_col">
          <div class="accounts_forms signup_form w-100 h-100" id="signup">
            <div class="title mt-4 p-4 w-100">
              <h1>Sign Up</h1>
              <p class="mt-3">Lorem ipsum dolor sit amet consectetur adipisicing elit. </p>
            </div>
            <!--title-->
            <form method="post" name="form" class="form w-100 p-4" id="form">
              <div class="row">
                <div class="col col-sm-12 col-md-12 col-lg-6 m-0">
                  <div class="form-group">
                    <label for="fname">Firstname</label>
                    <input type="text" name="fname" class="form-control" id="fname" onfocus="labelUp(this)" onblur="labelDown(this)" required />
                  </div>
                </div>
                <div class="col col-sm-12 col-md-12 col-lg-6 m-0">
                  <div class="form-group">
                    <label for="lname">Lastname</label>
                    <input type="text" name="lname" class="form-control" id="lname" onfocus="labelUp(this)" onblur="labelDown(this)" required />
                  </div>
                </div>
              </div>
              <!--form-row-->
              <div class="form-group">
                <label for="email">Email</label>
                <input type="email" name="email" class="form-control" id="email" onfocus="labelUp(this)" onblur="labelDown(this)" required />
              </div>
              <div class="form-group">
                <label for="signup_password">Password</label>
                <i class="fa fa-eye-slash" id="eye_icon_signup"></i>
                <input type="password" name="pass" class="form-control" id="signup_password" onfocus="labelUp(this)" onblur="labelDown(this)" required />
              </div>
              <div class="form-group">
                <label for="cpass">Confirm Password</label>
                <input type="password" name="cpass" class="form-control" id="cpass" onfocus="labelUp(this)" onblur="labelDown(this)" required />
              </div>
              <div class="form-group">
                <button type="submit" class="btn btn-primary register_btn w-100">Sign Up</button>
              </div>
            </form>

            <div class="already_member_box">
              <p class="text-center" id="to_login">I am already member</p>
            </div>
          </div>
          <!--accounts_forms-->
          <div class="accounts_forms  w-100 h-100" id="login">
            <div class="title  mt-4 p-4 w-100">
              <h1>Sign In</h1>
              <p class="mt-3">Lorem ipsum dolor sit amet consectetur adipisicing elit. </p>
            </div>
            <!--title-->
            <form method="post" name="form" class="form  w-100 p-4" id="form">
              <div class="form-group">
                <label for="email">Email</label>
                <input type="email" name="email" class="form-control" id="email" onfocus="labelUp(this)" onblur="labelDown(this)" required />
              </div>
              <div class="form-group">
                <label for="login_password">Password</label>
                <i class="fa fa-eye-slash" id="eye_icon_login"></i>
                <input type="password" name="pass" class="form-control" id="login_password" onfocus="labelUp(this)" onblur="labelDown(this)" required />
              </div>
              <div class="form-group mb-0">
                <button type="submit" class="btn btn-primary register_btn w-100">Sign In</button>
              </div>
            </form>

            <div class="already_member_box d-flex justify-content-between px-4">
              <span class="text-center" id="to_signup">Create an account?</span>
              <span class="text-center">Forgot password</span>
            </div>
          </div>
          <!--accounts_forms-->
        </div>
        <!--account_col-->
      </div>
      <!--row-->
    </div>
    <!--accounts_container-->
  </section>
  <!--login_section-->

  <!-- jQuery library -->
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <!-- Popper JS -->
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <!-- Latest compiled JavaScript -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <!--Custom Js-->
  <script type="text/javascript" src="js/app.js"></script>
  <script>
  
//Chnage Label Position

//call when focus on input
function labelUp(input){
   input.parentElement.children[0].setAttribute("class", "change_label");    
}  

//call when focus out on input
function labelDown(input){
   if(input.value.length === 0){
       input.parentElement.children[0].classList.remove("change_label");
   }
       
} 

//show & hide password
var eye_icon_signup = document.getElementById('eye_icon_signup');
var eye_icon_login = document.getElementById('eye_icon_login');
var sign_up_password = document.getElementById("signup_password");
var login_password = document.getElementById("login_password");
eye_icon_signup.addEventListener('click', ()=>{
   hideAndShowPass(eye_icon_signup, signup_password); 
});
eye_icon_login.addEventListener('click', ()=>{
   hideAndShowPass(eye_icon_login, login_password);  
});

const hideAndShowPass = (eye_icon, password) => {
   if(eye_icon.classList.contains("fa-eye-slash")){
       eye_icon.classList.remove('fa-eye-slash');
       eye_icon.classList.add('fa-eye');
       password.setAttribute('type', 'text');
       
   }
   else{
       eye_icon.classList.remove('fa-eye');
       eye_icon.classList.add('fa-eye-slash');
       password.setAttribute('type', 'password');
   }
};


//Sign Up & Sign In Toggle
let to_signup = document.getElementById('to_signup');
let to_login = document.getElementById('to_login');
to_signup.addEventListener('click', function(){
  let_change();
});
to_login.addEventListener('click', function(){
   let_change();
});
const let_change = () => {
   let login = document.getElementById('login');
   login.classList.toggle('login_form');
   let signup = document.getElementById('signup');
   signup.classList.toggle('signup_form');
}
</script>

</body>

</html>

