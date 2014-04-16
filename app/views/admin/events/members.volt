{{ content() }}

{% for members in page.items %}
{% if loop.first %}

<p style="float: right"><a href="/admin/events/getcsv/{{ members.event_id }}" class="btn btn-primary btn-sm" role="button">Вигрузити в CSV</a></p>
<table class="table table-bordered table-hover">
    <thead>
    <tr>
        <th>id</th>

        {% for key, value in events %}

            <th>{{ value['name'] }}</th>

        {% endfor %}
    </tr>
    </thead>
    <tbody>
    {% endif %}

    <tr>
        <td>{{ members.id }}</td>

        {% for key, value in members.data %}
            <td>{{ value }}</td>
        {% endfor %}

    </tr>

    {% if loop.last %}

    <tr>
        <td colspan="{{ colspan }}">
            <ul class="pager" style="margin: 0px;">
                <li class="previous">{{ link_to("admin/events/members/" ~ members.event_id, '&larr; Перша') }}</li>
                <li>{{ link_to("admin/events/members/" ~ members.event_id ~ "?page=" ~ page.before, 'Попередня') }}</li>
                <span> {{ page.current }} / {{ page.total_pages }} </span>
                <li>{{ link_to("admin/events/members/" ~ members.event_id ~ "?page=" ~ page.next, 'Наступна') }}</li>
                <li class="next">{{ link_to("admin/events/members/" ~ members.event_id ~ "?page=" ~ page.last, 'Остання &rarr;') }}</li>
            </ul>
        </td>
    </tr>

    </tbody>
</table>

{% endif %}
{% else %}
Подій немає
{% endfor %}