{{ content() }}

<p style="float: right"><a href="/admin/events/add" class="btn btn-primary btn-sm" role="button">Додати подію</a></p>

{% for events in page.items %}
    {% if loop.first %}

        <table class="table table-bordered table-hover">
            <thead>
            <tr>
                <th>id</th>
                <th>Назва</th>
                <th>Дата</th>
                <th colspan="2">Змінити</th>
            </tr>
            </thead>
            <tbody>
    {% endif %}

            <tr>
                <td>{{ events.id }}</td>
                <td>{{ events.name }}</td>
                <td>{{ events.date }}</td>
                <td><a class="btn btn-toolbar" href="/admin/events/edit/{{ events.id }}"><i class="glyphicon glyphicon-pencil"></i> Редагувати</a></td>
                <td><a class="btn btn-toolbar" href="/admin/events/delete/{{ events.id }}" style="color: #d9534f"><i class="glyphicon glyphicon-remove"></i> Видалити</a></td>
            </tr>

    {% if loop.last %}

            <tr>
                <td colspan="5">
                    <ul class="pager" style="margin: 0px;">
                        <li class="previous">{{ link_to("admin/events/index", '&larr; Перша') }}</li>
                        <li>{{ link_to("admin/events/index?page=" ~ page.before, 'Попередня') }}</li>
                        <span> {{ page.current }} / {{ page.total_pages }} </span>
                        <li>{{ link_to("admin/events/index?page=" ~ page.next, 'Наступна') }}</li>
                        <li class="next">{{ link_to("admin/events/index?page=" ~ page.last, 'Остання &rarr;') }}</li>
                    </ul>
                </td>
            </tr>

            </tbody>
        </table>

    {% endif %}
    {% else %}
        Подій немає
    {% endfor %}