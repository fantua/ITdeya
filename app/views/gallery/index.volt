{% for gallery in page.items %}
    <div class="blog-post">
        <h2 class="blog-post-title">{{ gallery.name }}</h2>
        <table style="border-collapse: separate;
        border-spacing: 10px 5px;">
            <tr>
            <td width="150px">
                <img src="/img/gallery/{{ gallery.id }}/preview.jpg" class="img-thumbnail">
            </td>
            <td valign="top">
                {{ gallery.description }}
            </td>
            </tr>
        </table>
        <br>
        <p><a class="btn btn-default" href="/gallery/view/{{ gallery.id }}" role="button">Переглянути »</a></p>
    </div>
    <hr>

    {% if loop.last %}

        <ul class="pager">
            <li>{{ link_to("gallery/index?page=" ~ page.before, 'Попередня') }}</li>
            <li>{{ link_to("gallery/index?page=" ~ page.next, 'Наступна') }}</li>
        </ul>

    {% endif %}

{% else %}
Альбомів немає
{% endfor %}
