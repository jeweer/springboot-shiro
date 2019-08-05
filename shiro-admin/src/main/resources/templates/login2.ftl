<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登录</title>
    <link href="/assets/images/favicon.ico" rel="icon">

    <!-- Bootstrap -->
    <link href="/assets/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="/assets/css/font-awesome.min.css" rel="stylesheet">
    <!-- Animate.css -->
    <link href="/assets/css/animate.min.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="/assets/css/custom.min.css" rel="stylesheet">
    <!--jquery-confirm.min.css-->
    <link href="/assets/css/jquery-confirm.min.css" rel="stylesheet">
    <!--nprogress-->
    <link href="/assets/css/nprogress.min.css" rel="stylesheet">
</head>

<body class="login">

<div>
    <a class="hiddenanchor" id="signup"></a>
    <a class="hiddenanchor" id="signin"></a>

    <div  class="login_wrapper">
        <div id="login" class="animate form login_form">
            <section class="login_content">
                <form action="/login" method="POST" >
                    <h1>登陆系统</h1>
                    <div>
                        <input type="text" class="form-control" placeholder="username" name="loginid" desc="登陆名"  required="required" />
                    </div>
                    <div>
                        <input type="password" class="form-control" placeholder="password" name="password" desc="密码" required="required" />
                    </div>
                    <div class="form-group" style="text-align : left">
                        <label><input type="checkbox" id="rememberMe" name="rememberMe" style="width: 12px; height: 12px;margin-right: 5px;">记住我</label>
                    </div>
                    <div>
                        <button type="button" class="btn btn-success btn-login" style="width: 100%;">登录</button>
                    </div>


                    <div class="clearfix"></div>

                    <div class="separator">
                        <p class="change_link">
                            <a href="#signup" class="to_register"> 忘记密码</a>
                        </p>

                        <div class="clearfix"></div>
                        <br />

                        <div>
                            <h1><i class="fa fa-paw"></i> Gentelella Alela!</h1>
                            <p>©2016 All Rights Reserved. Gentelella Alela! is a Bootstrap 3 template. Privacy and Terms</p>
                        </div>
                    </div>
                </form>
            </section>
        </div>

        <div id="register" class="animate form registration_form">
            <section class="login_content">
                <form>
                    <h1>Create Account</h1>
                    <div>
                        <input type="text" class="form-control" placeholder="Username" required="" />
                    </div>
                    <div>
                        <input type="email" class="form-control" placeholder="Email" required="" />
                    </div>
                    <div>
                        <input type="password" class="form-control" placeholder="Password" required="" />
                    </div>
                    <div>
                        <a class="btn btn-default submit" href="index.html">Submit</a>
                    </div>

                    <div class="clearfix"></div>

                    <div class="separator">
                        <p class="change_link">Already a member ?
                            <a href="#signin" class="to_register"> Log  in </a>
                        </p>

                        <div class="clearfix"></div>
                        <br />

                        <div>
                            <h1><i class="fa fa-paw"></i> Gentelella Alela!</h1>
                            <p>©2016 All Rights Reserved. Gentelella Alela! is a Bootstrap 3 template. Privacy and Terms</p>
                        </div>
                    </div>
                </form>
            </section>
        </div>
    </div>
</div>

</body>
<script src="/assets/js/jquery.min.js" type="text/javascript"></script>
<script src="/assets/js/bootstrap.min.js" type="text/javascript"></script>
<script src="/assets/js/jquery-confirm.min.js" type="text/javascript"></script>
<script src="/assets/js/zyd.tool.js"></script>
<script>
   // $("#modal").modal('show');
    $(".btn-login").click(function () {
        var username =  $("input[name='username']").val();
        var password =  $("input[name='password']").val();
       if(username==""||password==""){
            $.tool.ajaxError("登陆名和密码不能为空","2000","");
       }else{
           $.ajax({
               type: "POST",
               url: "/passport/signin",
               data: $("#login-form").serialize(),
               dataType: "json",
               success: function (json) {
                   if (json.status === 200) {
                       window.location.href = "/";
                   }else{
                       $.tool.ajaxSuccess(json);
                       $("#img-kaptcha").attr("src", '/getKaptcha?time=' + new Date().getTime());
                   }
               }
           });

       }
    });

    $("#img-kaptcha").click(function () {
        $(this).attr("src", '/getKaptcha?time=' + new Date().getTime());
    });
    document.onkeydown = function (event) {
        var e = event || window.event || arguments.callee.caller.arguments[0];
        if (e && e.keyCode === 13) {
            $(".btn-login").click();
        }
    };
</script>
</html>
