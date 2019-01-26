function findGetParameter(parameterName) {
    var result = null,
        tmp = [];
    var items = location.search.substr(1).split("&");
    for (var index = 0; index < items.length; index++) {
        tmp = items[index].split("=");
        if (tmp[0] === parameterName) result = decodeURIComponent(tmp[1]);
    }
    return result;
}
document.addEventListener("turbolinks:load", function(){
    var country = document.getElementById("select_coutry");
    var state = document.getElementById("select_state");

    if (sc = findGetParameter("select_coutry")) {
        Rails.ajax({
            url: "/states.js?country=" + sc,
            type: "GET"
        })
    }
    if (ss = findGetParameter("select_state")) {
        Rails.ajax({
            url: "/cities.js?country=" + sc + "&state=" + ss,
            type: "GET",
            async: false
        })
        setTimeout(function(){
            state.value = ss;
        }, 1000);
    }
    if (sct = findGetParameter("select_city")) {
        setTimeout(function(){
            document.getElementById("select_city").value = sct;
        }, 1000);        
    }

    country.addEventListener("change", function(){
        Rails.ajax({
            url: "/states.js?country=" + country.value,
            type: "GET"
        })
    })

    state.addEventListener("change", function(){
        Rails.ajax({
            url: "/cities.js?country=" + country.value + "&state=" + state.value,
            type: "GET"
        })
    })
})