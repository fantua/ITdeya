{{ content() }}

{{ form('admin/gallery/add', 'class': 'form-horizontal', 'role': 'form') }}

    <div class="form-group">
        <label for="name" class="control-label col-xs-2">Назва</label>
        <div class="col-xs-10">
            <input type="name" class="form-control" id="name" name="name" placeholder="Назва" required autofocus>
        </div>
    </div>
    <div class="form-group">
        <label for="description" class="control-label col-xs-2">Опис</label>
        <div class="col-xs-10">
            <textarea name="description" id="description" rows="10" cols="80">
                Опис...
            </textarea>

            <script>CKEDITOR.replace( 'description' );</script>

        </div>
    </div>
    <div class="form-group">
        <div class="col-xs-offset-2 col-xs-10">
            <button type="submit" class="btn btn-primary">Додати</button>
        </div>
    </div>
</form>