{{ content() }}

<form class="form-horizontal" role="form" method="post" action="/admin/gallery/edit/{{ gallery.id }}">

<div class="form-group">
    <label for="name" class="control-label col-xs-2">Назва</label>
    <div class="col-xs-10">
        <input type="name" class="form-control" id="name" name="name" placeholder="Назва" value="{{ gallery.name }}" required>
    </div>
</div>
<div class="form-group">
    <label for="description" class="control-label col-xs-2">Повна новина</label>
    <div class="col-xs-10">
        <textarea name="description" id="description" rows="10" cols="80">
            {{ gallery.description }}
        </textarea>

        <script>CKEDITOR.replace( 'description' );</script>

    </div>
</div>
<div class="form-group">
    <div class="col-xs-offset-2 col-xs-10">
        <button type="submit" class="btn btn-primary">Редагувати</button>
    </div>
</div>
</form>