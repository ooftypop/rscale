module PollsHelper
  def user_voted(poll)
    if current_user.voted_for_poll?(poll)
      button_tag("Voted!", class: ["submit-button", "submit-all-button"], type: "button")
    else
      button_tag("Vote", class: ["submit-button", "submit-all-button"], name: "button", type: "button", id: "masterSave", onclick: "submitAllVotes()" )
    end
  end
end
