module PollsHelper
  def user_vote_button(poll)
    if current_user.voted_for_poll?(poll)
      button_tag("You Voted!", class: ["btn", "btn-primary", "js-scroll-trigger"], type: "button")
    else
      button_tag("Vote", class: ["btn", "btn-primary", "js-scroll-trigger"], name: "button", type: "button", id: "masterSave", onclick: "submitAllVotes()" )
    end
  end
end
