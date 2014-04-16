<div class="container">

    <div class="header">

        {{ elements.getMenu() }}

        <h3 class="text-muted"><img src="/img/logo.png" onclick="startGame()" id="logo"> Ivano-Frankivsk IT Students</h3>
    </div>

    <div class="row">
        <div class="col-sm-8 blog-main">
            {{ content() }}
        </div>
        <div class="col-sm-3 col-sm-offset-1 blog-sidebar">
            <!--<div class="sidebar-module">
                <button class="btn btn-md btn-primary btn-block" onclick="window.location='/index'">Про нас</button>
            </div>-->
            <div class="sidebar-module" style="background:url(/img/about.png) center center;">
                <a href="/about" style="text-decoration: none;outline: 0;">
                    <div class="inner-padding" style="color: #fff; overflow: hidden;text-align: center;">
                        <h4 style="margin-bottom: 20px;font-size: 20px;line-height: 30px;font-family: Georgia, serif;font-style: italic;">Хто ми?</h4>
                        <p style="margin: 0;font-size: 14px;line-height: 20px;text-transform: uppercase;">Група людей зацікавлених<br>
                             в розвитку ІТ сфери<br>
                            в Івано-Франківську</p>
                        <span style="margin: 15px 0px;display: block;font-size: 12px;font-family: Georgia, serif;font-style: italic;text-transform: none;" >— Детальніше —</span>
                    </div>
                </a>
            </div>
            <br>
            <div class="sidebar-module" style="text-align: center">
                <a href="http://vk.com/ifits" target="_blank"><img src="/img/vk.jpg"></a>
            </div>
            <br>
            <div class="sidebar-module" style="text-align: center">
                <h4>Події</h4>

                {{ elements.getEvents() }}

            </div>
            <br>
            <div class="sidebar-module" style="text-align: center">
                <h4>Партнери</h4>
                <img src="/img/softjourn.png">
                <img src="/img/eleks.png">
                <img src="/img/softserve.png">
            </div>
        </div>
    </div>
    <div class="blog-footer">
        <p>Flappy Team for ITdeya cup.</p>
        <p>
            <a href="#">Вверх</a>
        </p>
    </div>
</div>
