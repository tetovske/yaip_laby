# frozen_string_literal: true

# Converts object from database to array
class ConvertObject
    include Interactor

    def call
        context.res = context.obj.map { |el| [el.input, el.json_responce] }
    end
end