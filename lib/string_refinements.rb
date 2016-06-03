module Camelizer
  refine String do
    def camelize
      split('_').map(&:capitalize).join
    end
  end
end
