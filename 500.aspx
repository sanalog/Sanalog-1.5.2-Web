<%@ page language="C#" autoeventwireup="true" codefile="500.aspx.cs" inherits="_404" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>500</title>
    <script>
        function goBack() {
            window.history.back();
        }
    </script>
    <style>
        body {
            color: #ecf0f1;
            margin: 0;
            font: normal 14px/20px Arial, Helvetica, sans-serif;
            height: 100%;
            background-color: #BDBDBD;
        }

        .container {
            height: auto;
            min-height: 100%;
        }

        .box {
            text-align: center;
            width: 800px;
            margin-left: -400px;
            position: absolute;
            top: 30%;
            left: 50%;
        }

        h1 {
            margin: 0;
            color: #E73C56;
            font-size: 150px;
            line-height: 150px;
            font-weight: bold;
        }

        h2 {
            margin-top: 20px;
            margin-bottom: 20px;
            font-size: 30px;
        }

        .text {
            margin-bottom: 20px;
        }

        .btn {
            display: inline-block;
            padding: 4px 12px;
            margin-bottom: 0;
            font-size: 14px;
            font-weight: normal;
            line-height: 1.42857143;
            text-align: center;
            white-space: nowrap;
            vertical-align: middle;
            cursor: pointer;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            background-image: none;
            color: #9C9C9C;
            background: #FFF;
            border: none !important;
            border-radius: 4px;
            -webkit-transition: border .25s linear, color .25s linear, background-color .25s linear;
            transition: border .25s linear, color .25s linear, background-color .25s linear;
            -webkit-font-smoothing: subpixel-antialiased;
            -webkit-box-shadow: inset 0 -2px 0 rgba(0,0,0,0.2);
            box-shadow: inset 0 -2px 0 rgba(0,0,0,0.2);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="box">
                <h1>500</h1>
                <h2>Sunucu hatası!
                </h2>
                <p class="text">Internal Server Error</p>
                <p><a onclick="goBack()" class="btn">Go Back</a></p>
            </div>
        </div>
    </form>
</body>
</html>
