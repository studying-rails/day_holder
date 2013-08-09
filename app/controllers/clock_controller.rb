class ClockController < ApplicationController

  def show
    @now = FreezeClock.now
    render
  end

  # def inc_day
  #   FreezeClock.now += 1.day
  #   goto_root
  # end

  { inc: +1, dec: -1 }.each do |dir, dir_value|
    [:year, :month, :day].each do |unit|
      method_name = "#{dir}_#{unit}".to_sym
      val = dir_value.__send__ unit
      define_method method_name do
        FreezeClock.now += val
        goto_root
      end
    end
  end

  private

  def goto_root
    redirect_to root_path
  end
end

