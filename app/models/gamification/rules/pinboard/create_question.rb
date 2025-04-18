# frozen_string_literal: true

module Gamification
  module Rules
    module Pinboard
      class CreateQuestion < Gamification::Rules::Base
        def create_score!
          # Do not award points for questions in the "Technical issues" sections
          return if @payload.fetch(:technical)

          super
        end

        private

        def name
          :create_question
        end

        def checksum
          @payload.fetch :id
        end

        def data
          {question_id: @payload.fetch(:id)}
        end

        def required_keys
          %i[course_id id user_id]
        end
      end
    end
  end
end
