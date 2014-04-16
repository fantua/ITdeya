{% for news in page.items %}
<div class="blog-post">
    <h2 class="blog-post-title">{{ news.name }}</h2>
    <p class="blog-post-meta">{{ news.date }}</p>
    {{ news.preview_content }}
    <br>
    <p><a class="btn btn-default" href="/news/view/{{ news.id }}" role="button">Читати »</a></p>
</div>
<hr>

{% if loop.last %}

<p><button class="btn btn-lg btn-primary btn-block" onclick="window.location='/news'">Переглянути всі</button></p>

{% endif %}

{% else %}
Новин немає
{% endfor %}
