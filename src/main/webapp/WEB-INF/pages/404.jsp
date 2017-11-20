
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <link rel="stylesheet" href="/resource/css/main.css" type="text/css" media="screen, projection"/>
    <!-- main stylesheet -->
    <link rel="stylesheet" type="text/css" media="all" href="/resource/css/tipsy.css"/> <!-- Tipsy implementation -->

    <!--[if lt IE 9]>
    <link rel="stylesheet" type="text/css" href="/resource/css/ie8.css"/>
    <![endif]-->

    <script type="text/javascript" src="/resource/scripts/jquery-1.7.2.min.js"></script> <!-- uiToTop implementation -->
    <script type="text/javascript" src="/resource/scripts/custom-scripts.js"></script>
    <script type="text/javascript" src="/resource/scripts/jquery.tipsy.js"></script> <!-- Tipsy -->

    <script type="text/javascript">

        $(document).ready(function () {

            universalPreloader();

        });

        $(window).load(function () {

            //remove Universal Preloader
            universalPreloaderRemove();

            rotate();
            dogRun();
            dogTalk();

            //Tipsy implementation
            $('.with-tooltip').tipsy({gravity: $.fn.tipsy.autoNS});

        });

    </script>

    <title>404 - Not found</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>

<body>

<!-- Universal preloader -->
<div id="universal-preloader">
    <div class="preloader">
        <img src="/resource/images/universal-preloader.gif" alt="universal-preloader"
             class="universal-preloader-preloader"/>
    </div>
</div>
<!-- Universal preloader -->

<div id="wrapper">
    <!-- 404 graphic -->
    <div class="graphic"></div>
    <!-- 404 graphic -->
    <!-- Not found text -->
    <div class="not-found-text">
        <h1 class="not-found-text">少侠! 请留步</h1>
    </div>
    <!-- Not found text -->

    <!-- search form -->
    <div class="search">
        <a href="/index" class="with-tooltip" title="Return to the home page">点击返回</a>
    </div>
    <!-- search form -->

    <!-- top menu -->
    <div class="top-menu">


    </div>
    <!-- top menu -->

    <div class="dog-wrapper">
        <!-- dog running -->
        <div class="dog"></div>
        <!-- dog running -->

        <!-- dog bubble talking -->
        <div class="dog-bubble">

        </div>

        <!-- The dog bubble rotates these -->
        <div class="bubble-options">
            <p class="dog-bubble">
                正在联系火星总部查找您所需要的页面.请返回等待信息..
            </p>
            <p class="dog-bubble">
                <br/>
                不要返回吗?
            </p>
            <p class="dog-bubble">
                <br/>
                确定不要返回吗?
            </p>
            <p class="dog-bubble">
                真的真的确定不要返回吗?<br/><img style="margin-top:8px" src="/resource/images/cookie.png" alt="cookie"/>
            </p>
            <p class="dog-bubble">
                <br/>
                好吧.还是随便你要不要真的确定返回吧
            </p>
            <p class="dog-bubble">
                <br/>
                不要返回吗?
            </p>
            <p class="dog-bubble">
                确定不要返回吗?
            </p>
            <p class="dog-bubble">
                <br/>
                真的真的确定不要返回吗?
            </p>
            <p class="dog-bubble">
                好吧.还是随便你要不要真的确定返回吧 <br/><img style="margin-top:8px" src="/resource/images/cat.png" alt="cat"/>
            </p>
            <p class="dog-bubble">
                正在联系火星总部查找您所需要的页面.请返回等待信息..
            </p>
        </div>
        <!-- The dog bubble rotates these -->
        <!-- dog bubble talking -->
    </div>

    <!-- planet at the bottom -->
    <div class="planet"></div>
    <!-- planet at the bottom -->
</div>


</body>
</html>