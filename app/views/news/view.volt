<div class="blog-post">
    <h2 class="blog-post-title">{{ news.name }}</h2>
    <p class="blog-post-meta">{{ news.date }}</p>
    {{ news.full_content }}

    <meta property="og:title" content="{{ news.name }}" />
    <meta property="og:description" content="{{ news.full_content|striptags }}" />
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

