class GoalsController < ApplicationController

    before_action :authenticate
    
    
    def index 
        @goals = Goal.all
    end

end
