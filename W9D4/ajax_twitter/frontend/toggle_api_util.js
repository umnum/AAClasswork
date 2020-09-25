const ToggleApiUtil = {
    toggleFollowAjax: function ($el) {
        if ($el.data("initial-follow-state") === true) {
            // debugger
            return $.ajax({
                method: 'DELETE',
                url: `/users/${$el.data("user-id")}/follow`,
                dataType: 'JSON'
            });
        } else {
            return $.ajax({
                method: 'POST',
                url: `/users/${$el.data("user-id")}/follow`,
                dataType: 'JSON'
            });
        }
    }
}

module.exports = ToggleApiUtil;
