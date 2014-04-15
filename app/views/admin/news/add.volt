{{ content() }}

{{ form('admin/news/add', 'class': 'form-horizontal', 'role': 'form') }}

    <div class="form-group">
        <label for="name" class="control-label col-xs-2">Назва</label>
        <div class="col-xs-10">
            <input type="name" class="form-control" id="name" name="name" placeholder="Назва" required autofocus>
        </div>
    </div>
    <div class="form-group">
        <label for="full_content" class="control-label col-xs-2">Повна новина</label>
        <div class="col-xs-10">
            <textarea name="full_content" id="full_content" rows="10" cols="80">
                Текст новини...
            </textarea>

            <script>CKEDITOR.replace( 'full_content' );</script>

        </div>
    </div>
    <div class="form-group">
        <label for="preview_content" class="control-label col-xs-2">Попередній перегляд новини</label>
        <div class="col-xs-10">
            <textarea name="preview_content" id="preview_content" rows="10" cols="80">
                Текст новини...
            </textarea>

            <script>CKEDITOR.replace( 'preview_content' );</script>

        </div>
    </div>
    <div class="form-group">
        <div class="col-xs-offset-2 col-xs-10">
            <button type="submit" class="btn btn-primary">Додати</button>
        </div>
    </div>
</form>