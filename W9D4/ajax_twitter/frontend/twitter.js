const FollowToggle = require('./follow_toggle')

$(document).ready(() => {
    $(".follow-toggle").each((index, el) => {
        new FollowToggle($(el));
    })
})



