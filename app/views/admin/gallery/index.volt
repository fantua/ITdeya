{{ content() }}

<p style="float: right"><a href="/admin/gallery/add" class="btn btn-primary btn-sm" role="button">Додати альбом</a></p>

{% for gallery in page.items %}
    {% if loop.first %}

        <table class="table table-bordered table-hover">
            <thead>
            <tr>
                <th>id</th>
                <th>Назва</th>
                <th colspan="2">Змінити</th>
            </tr>
            </thead>
            <tbody>
    {% endif %}

            <tr>
                <td>{{ gallery.id }}</td>
                <td>{{ gallery.name }}</td>
                <td><a class="btn btn-toolbar" href="/admin/gallery/edit/{{ gallery.id }}"><i class="glyphicon glyphicon-pencil"></i> Редагувати</a></td>
                <td><a class="btn btn-toolbar" href="/admin/gallery/delete/{{ gallery.id }}" style="color: #d9534f"><i class="glyphicon glyphicon-remove"></i> Видалити</a></td>
            </tr>

    {% if loop.last %}

            <tr>
                <td colspan="4">
                    <ul class="pager" style="margin: 0px;">
                        <li class="previous">{{ link_to("admin/gallery/index", '&larr; Перша') }}</li>
                        <li>{{ link_to("admin/gallery/index?page=" ~ page.before, 'Попередня') }}</li>
                        <span> {{ page.current }} / {{ page.total_pages }} </span>
                        <li>{{ link_to("admin/gallery/index?page=" ~ page.next, 'Наступна') }}</li>
                        <li class="next">{{ link_to("admin/gallery/index?page=" ~ page.last, 'Остання &rarr;') }}</li>
                    </ul>
                </td>
            </tr>

            </tbody>
        </table>

    {% endif %}
    {% else %}
        Новин немає
    {% endfor %}