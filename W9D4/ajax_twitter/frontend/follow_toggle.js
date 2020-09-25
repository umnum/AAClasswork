const ToggleApiUtil = require('./toggle_api_util')
class FollowToggle {
    constructor($el) {
        this.user_id = $el.data("user-id");
        this.followState = $el.data("initial-follow-state")
        this.el = $el;
        this.render($el);
        this.handleClick($el);
    };

    render($el) {
        if (this.followState) {
            $el.text("Unfollow!")
        } else {
            $el.text("Follow!")
        }
    };

    handleClick($el) {
        $el.on("click", e => {
            e.preventDefault();
            $el.prop("disabled", true);
            ToggleApiUtil.toggleFollowAjax($el)
                .then(response => {
                    $el.data("initial-follow-state", !this.followState)
                    this.followState = !this.followState;
                    this.render($el);
                    $el.prop("disabled", false);
                });
        })
    };

};
module.exports = FollowToggle;