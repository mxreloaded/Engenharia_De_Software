# frozen_string_literal: true

class AppController < ApplicationController
  skip_before_action :authenticate_request

  def index
  end
end
