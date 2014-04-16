{% for events in page.items %}
    <div class="blog-post">
        <h2 class="blog-post-title">{{ events.name }}</h2>
        <p class="blog-post-meta"><b>Дата проведення:</b> {{ events.date }}</p>
        <p class="blog-post-meta"><b>Міце проведення:</b> {{ events.place['place_address'] }}</p>
        {{ events.preview_content }}
        <br>
        <p><a class="btn btn-default" href="/events/view/{{ events.id }}" role="button">Детальніше »</a></p>
    </div>
    <hr>

    {% if loop.last %}

        <ul class="pager">
            <li>{{ link_to("events/index?page=" ~ page.before, 'Попередня') }}</li>
            <li>{{ link_to("events/index?page=" ~ page.next, 'Наступна') }}</li>
        </ul>

    {% endif %}

{% else %}
Новин немає
{% endfor %}
