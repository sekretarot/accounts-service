class HealthController < ApplicationController

  def health
    head :ok
  end

end