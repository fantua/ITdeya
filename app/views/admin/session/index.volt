{{ content() }}

<style>
    body {
        padding-top: 40px;
        padding-bottom: 40px;
        background-color: #eee;
    }
</style>

{{ form('admin/session', 'class': 'form-signin', 'role': 'form') }}

    <h2 class="form-signin-heading">Авторизація</h2>

    {{ text_field('username', 'class': "form-control", 'placeholder': "Користувач", 'required': null, 'autofocus': null) }}
    {{ password_field('password', 'class': "form-control", 'placeholder': "Пароль", 'required': null) }}

    {{ submit_button('Увійти', 'class': 'btn btn-lg btn-primary btn-block') }}


</div>