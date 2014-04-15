{{ content() }}

<style>
    html, body, #map-canvas {
        height: 400px;
        margin: 0px;
        padding: 0px
    }
    .controls {
        margin-top: 16px;
        border: 1px solid transparent;
        border-radius: 2px 0 0 2px;
        box-sizing: border-box;
        -moz-box-sizing: border-box;
        height: 32px;
        outline: none;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
    }

    #pac-input {
        background-color: #fff;
        padding: 0 11px 0 13px;
        width: 400px;
        font-family: Roboto;
        font-size: 15px;
        font-weight: 300;
        text-overflow: ellipsis;
    }

    #pac-input:focus {
        border-color: #4d90fe;
        margin-left: -1px;
        padding-left: 14px;  /* Regular padding-left + 1. */
        width: 401px;
    }

    .pac-container {
        font-family: Roboto;
    }

    #type-selector {
        color: #fff;
        background-color: #4d90fe;
        padding: 5px 11px 0px 11px;
    }

    #type-selector label {
        font-family: Roboto;
        font-size: 13px;
        font-weight: 300;
    }


</style>

<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places&language=uk"></script>

<script>
    function initialize() {
        var mapOptions = {
            center: new google.maps.LatLng(48.921692, 24.711256),
            zoom: 12
        };
        var map = new google.maps.Map(document.getElementById('map-canvas'),
                mapOptions);

        var input = /** @type {HTMLInputElement} */(
                document.getElementById('pac-input'));

        var types = document.getElementById('type-selector');
        map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
        map.controls[google.maps.ControlPosition.TOP_LEFT].push(types);

        var autocomplete = new google.maps.places.Autocomplete(input);
        autocomplete.bindTo('bounds', map);

        var infowindow = new google.maps.InfoWindow();
        var marker = new google.maps.Marker({
            map: map,
            anchorPoint: new google.maps.Point(0, -29)
        });

        google.maps.event.addListener(autocomplete, 'place_changed', function() {
            infowindow.close();
            marker.setVisible(false);
            var place = autocomplete.getPlace();
            if (!place.geometry) {
                return;
            }

            // If the place has a geometry, then present it on a map.
            if (place.geometry.viewport) {
                map.fitBounds(place.geometry.viewport);
            } else {
                map.setCenter(place.geometry.location);
                map.setZoom(17);  // Why 17? Because it looks good.
            }
            marker.setIcon(/** @type {google.maps.Icon} */({
                url: place.icon,
                size: new google.maps.Size(71, 71),
                origin: new google.maps.Point(0, 0),
                anchor: new google.maps.Point(17, 34),
                scaledSize: new google.maps.Size(35, 35)
            }));
            marker.setPosition(place.geometry.location);
            marker.setVisible(true);

            var address = '';
            if (place.address_components) {
                address = [
                    (place.address_components[0] && place.address_components[0].short_name || ''),
                    (place.address_components[1] && place.address_components[1].short_name || ''),
                    (place.address_components[2] && place.address_components[2].short_name || '')
                ].join(' ');
            }

            infowindow.setContent('<div><strong>' + place.name + '</strong><br>' + address);
            infowindow.open(map, marker);
        });

        // Sets a listener on a radio button to change the filter type on Places
        // Autocomplete.
        function setupClickListener(id, types) {
            var radioButton = document.getElementById(id);
            google.maps.event.addDomListener(radioButton, 'click', function() {
                autocomplete.setTypes(types);
            });
        }

        setupClickListener('changetype-all', []);
        setupClickListener('changetype-establishment', ['establishment']);
        setupClickListener('changetype-geocode', ['geocode']);
    }

    google.maps.event.addDomListener(window, 'load', initialize);

</script>

<form class="form-horizontal" role="form" method="post" action="/admin/events/edit/{{ events.id }}">

<div class="form-group">
    <label for="name" class="control-label col-xs-2">Назва</label>
    <div class="col-xs-10">
        <input type="name" class="form-control" id="name" name="name" placeholder="Назва" value="{{ events.name }}" required>
    </div>
</div>
<div class="form-group">
    <label for="full_content" class="control-label col-xs-2">Повна новина</label>
    <div class="col-xs-10">
        <textarea name="full_content" id="full_content" rows="10" cols="80">
            {{ events.full_content }}
        </textarea>

        <script>CKEDITOR.replace( 'full_content' );</script>

    </div>
</div>
<div class="form-group">
    <label for="preview_content" class="control-label col-xs-2">Попередній перегляд новини</label>
    <div class="col-xs-10">
        <textarea name="preview_content" id="preview_content" rows="10" cols="80">
            {{ events.preview_content }}
        </textarea>

        <script>CKEDITOR.replace( 'preview_content' );</script>

    </div>
</div>
<div class="form-group">
    <label for="date" class="control-label col-xs-2">Дата</label>
    <div class="col-xs-10">
        <input type="datetime-local" class="form-control" id="date" name="date" value="{{ events.date }}" required>
    </div>
</div>
<div class="form-group">
    <label for="pac-input" class="control-label col-xs-2">Місце</label>
    <div class="col-xs-10">
        <input id="pac-input" name="pac-input" class="controls" type="text" placeholder="8 Гарбарська" value="{{ events.place }}">
        <div id="type-selector" class="controls">
            <input type="radio" name="type" id="changetype-all" checked="checked">
            <label for="changetype-all">All</label>

            <input type="radio" name="type" id="changetype-establishment">
            <label for="changetype-establishment">Establishments</label>

            <input type="radio" name="type" id="changetype-geocode">
            <label for="changetype-geocode">Geocodes</label>
        </div>
        <div id="map-canvas"></div>
    </div>
</div>
<div class="form-group">

    {% for key, value in events.data %}
        {% if loop.first %}
            <label class="control-label col-xs-2">Форма реєстрації</label>
        {% else %}
            <label class="control-label col-xs-2" id="lab_{{ key }}"></label>
        {% endif %}

        <div class="col-xs-10" id="data_{{ key }}">
            <label style="padding-right: 25px;">Назва: <input type="text" class="form-control" name="data[{{ key }}][name]" value="{{ value['name'] }}" required style="display: inherit;width: 200px;"></label>
            <label style="padding-right: 25px;">Тип: <select class="form-control" style="display: inherit;width: 100px" name="data[{{ key }}][type]"><option value="text">text</option><option value="textarea" {% if value['type'] == 'textarea' %}selected{% endif %}>textarea</option></select></label>
            <label><input type="checkbox"  name="data[{{ key }}][required]" {% if value['required'] %}checked{% endif %}> Обов`язкове</label>
            {% if !loop.first %}
                <a class="btn" onclick="deleteElement({{ key }})"><i class="glyphicon glyphicon-minus"></i></a>
            {% endif %}
        </div>

    {% endfor %}

    <label class="control-label col-xs-2"></label><div class="col-xs-10"><a class="btn" onclick="addElement()"><i class="glyphicon glyphicon-plus"></i></a></div>
</div>
<div class="form-group">
    <div class="col-xs-offset-2 col-xs-10">
        <button type="submit" class="btn btn-primary">Додати</button>
    </div>
</div>
</form>

<script>
    i = {{ events.data|length }};
    i--;
    function addElement(){
        var last = $('#data_' + i);
        i++;

        last.after(
                '<label class="control-label col-xs-2" id="lab_' + i + '"></label>' +
                        '<div class="col-xs-10" id="data_' + i + '">' +
                        '<label style="padding-right: 25px;">Назва: <input type="text" class="form-control" name="data[' + i + '][name]" required style="display: inherit;width: 200px;"></label> ' +
                        '<label style="padding-right: 25px;">Тип: <select class="form-control" style="display: inherit;width: 100px" name="data[' + i + '][type]"><option value="text">text</option><option value="textarea">textarea</option></select></label> ' +
                        '<label><input type="checkbox"  name="data[' + i + '][required]" checked> Обов`язкове</label> ' +
                        '<a class="btn" onclick="deleteElement(' + i + ')"><i class="glyphicon glyphicon-minus"></i></a>' +
                        '</div>'
        );
    }

    function deleteElement(n){
        $('#lab_' + n).remove();
        $('#data_' + n).remove();

        if(i == n)
            i--;
    }


</script>