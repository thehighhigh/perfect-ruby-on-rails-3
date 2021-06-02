class TicketsController < ApplicationController

  def new
    raise ActionController::RoutingError, "ログイン状態でTicketsController#new にアクセス"
  end

  def create
    event = Event.find(params[:event_id])
    if event.tickets.find_by(user_id: current_user.id)
      redirect_to event, notice: "既に参加表明済みです。"
    else
      @ticket = current_user.tickets.build do |t|
        t.event = event
        t.comment = params[:ticket][:comment]
      end
      if @ticket.save
        redirect_to event, notice: "このイベントに参加表明しました。"
      end
    end
  end

  def destroy
    ticket = current_user.tickets.find_by!(event_id: params[:event_id])
    ticket.destroy!
    redirect_to event_path(params[:event_id]), notice: "このイベントの参加表明を取り消しました。"
  end
end
