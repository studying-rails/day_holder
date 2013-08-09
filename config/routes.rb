DayHolder::Application.routes.draw do
  root to: 'clock#show'
  resource :clock, controller: 'clock', only: 'show' do
    post :inc_day, :inc_month, :inc_year,
         :dec_day, :dec_month, :dec_year
  end
end
