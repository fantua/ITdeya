<style>
    #map-canvas {
        height: 300px;
        margin: 0px;
        padding: 0px
    }
</style>

<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places&language=uk"></script>

<script>
    function initialize() {
        var mapOptions = {
            center: new google.maps.LatLng({{ events.place['place_k'] }}, {{ events.place['place_a'] }}),
    zoom: 17
    };
    var map = new google.maps.Map(document.getElementById('map-canvas'),
            mapOptions);


    var infowindow = new google.maps.InfoWindow();
    var marker = new google.maps.Marker({
        map: map,
        anchorPoint: new google.maps.Point(0, -29)
    });

    infowindow.close();
    marker.setVisible(false);

    marker.setIcon(/** @type {google.maps.Icon} */({
        url: '{{ events.place['place_icon'] }}',
        size: new google.maps.Size(71, 71),
        origin: new google.maps.Point(0, 0),
        anchor: new google.maps.Point(17, 34),
        scaledSize: new google.maps.Size(35, 35)
    }));
    marker.setPosition(new google.maps.LatLng({{ events.place['place_k'] }}, {{ events.place['place_a'] }}));
    marker.setVisible(true);

    infowindow.setContent('<div><strong>{{ events.place['place_name'] }}</strong><br> {{ events.place['place_address'] }}');
    infowindow.open(map, marker);
    }

    google.maps.event.addDomListener(window, 'load', initialize);

</script>

<div class="blog-post">
    {% if reg %}<div class="alert alert-success">Ви успішно зареєстровані!</div>{% endif %}
    <h2 class="blog-post-title">{{ events.name }}</h2>
    <p class="blog-post-meta"><b>Дата проведення:</b> {{ events.date }}</p>
    <p class="blog-post-meta"><b>Міце проведення:</b> {{ events.place['place_address'] }}</p>
    {{ events.full_content }}

    <div id="map-canvas"></div>
    <br>
    <p><button class="btn btn-md btn-success btn-block" data-toggle="modal" data-target="#myModal">Зареєструватися</button></p>

    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Реєстрація</h4>
                </div>
                <form class="form-horizontal" role="form" method="post" action="/events/register/{{ events.id }}">
                <div class="modal-body">

                        {% for key, value in events.data %}

                            <div >
                                <label class="control-label">{{ value['name'] }}: {% if value['required'] %}<span style="color: #f00000">*</span>{% endif %}</label>
                                {% if value['type'] == 'text' %}
                                    <input type="text" class="form-control" name="data[{{ key }}]" {% if value['required'] %}required{% endif %}>
                                {% else %}
                                    <textarea class="form-control" name="data[{{ key }}]" {% if value['required'] %}required{% endif %}></textarea>
                                {% endif %}
                            </div>

                        {% endfor %}

                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Зареєструватися</button>
                </div>
                </form>
            </div>
        </div>
    </div>

    <meta property="og:title" content="{{ events.name }}" />
    <meta property="og:description" content="{{ events.full_content|striptags }}" />
    <script type="text/javascript">(function(w,doc) {
        if (!w.__utlWdgt ) {
            w.__utlWdgt = true;
            var d = doc, s = d.createElement('script'), g = 'getElementsByTagName';
            s.type = 'text/javascript'; s.charset='UTF-8'; s.async = true;
            s.src = ('https:' == w.location.protocol ? 'https' : 'http')  + '://w.uptolike.com/widgets/v1/uptolike.js';
            var h=d[g]('body')[0];
            h.appendChild(s);
        }})(window,document);
    </script>
    <div data-background-alpha="0.0" data-orientation="horizontal" data-text-color="000000" data-share-shape="round-rectangle" data-buttons-color="ff9300" data-sn-ids="fb.tw.ok.vk.gp.mr." data-counter-background-color="ffffff" data-share-counter-size="11" data-share-size="30" data-background-color="ededed" data-share-counter-type="common" data-pid="1254441" data-counter-background-alpha="1.0" data-share-style="1" data-mode="share" data-following-enable="false" data-like-text-enable="false" data-selection-enable="true" data-icon-color="ffffff" class="uptolike-buttons" style="float: right"></div>
    <br><br>


</div>
<hr>

<div id="disqus_thread"></div>
<script type="text/javascript">
    /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
    var disqus_shortname = 'ifits'; // required: replace example with your forum shortname

    /* * * DON'T EDIT BELOW THIS LINE * * */
    (function() {
        var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
        dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
        (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
    })();
</script>
<noscript>Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
<a href="http://disqus.com" class="dsq-brlink">comments powered by <span class="logo-disqus">Disqus</span></a>

